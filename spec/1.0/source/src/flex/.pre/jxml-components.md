# JXML components

<!--

Future data binding support:

* Consider using a particular XML namespace for data binding attributes (prefix usually being "bind").
* A p={o.p} attribute would be a data binding if o is a binding from within the JXML component

-->

A JXML component is a XML file with the extension `.jxml` describing a class that inherits from a `JXML` implementor.

The class described in the XML file is referred throughout this section as *descClass*.

## Root element

The following semantics apply to the root element:

* The root element of the XML file is a JXML instantiation. The component of the JXML instantiation is the class from which *descClass* inherits.
* The root element must assign the attribute `className` a fully package qualified name whose trailing name identifies the class name of *descClass*, as in:

```xml
<e:Application xmlns:e="org.example" className="org.example.Main">
    <!-- org.example.Main -->
</e:Application>
```

Such XML file results into defining *descClass* as a `Main` class that belongs to the `org.example` package. It is a verify error if the class is already defined.

## Constructor

The constructor of *descClass* is implicitly defined if not already defined by the `<Script>` element.

The following restrictions apply to JXML components:

* The constructor of *descClass* is only allowed to receive optional parameters.
* The constructor of *descClass* must not include the rest parameter.

The following semantics apply to JXML components:

* A `children?: [T]` parameter is automatically contributed to the end of the formal parameter list of the *descClass* constructor, where `T` is the type argument to the implemented `JXML` interface in *descClass*.

## \<Script\>

The `Script` element is allowed at the root element and may appear at most once. If an `Script` element appears, it must only contain a CDATA section.

The CDATA section contains a Jet source as the contents of a `class` block. Such contents are contributed to *descClass*.

The `Script` element must be interpreted before the XML attributes of the root element are processed. This behavior allows code in attribute values to rely on `import` directives, as in the following JXML component:

```xml
<e:Application xmlns:e="org.example"
    className="org.example.Main"
    rectangle="{new Rectangle(0, 0, 100, 100)}">
    <Script>
        import org.foundation.geom.*;
    </Script>
</e:Application>
```

## \<Children/\>

The empty `Children` element is allowed anywhere within the root element and may appear at most once.

The `Children` tag is replaced by zero or more JXML instantiations that appear as children of the JXML component.

```xml
<e:C1 xmlns:e="org.example" className="org.example.C2">
    <Children/>
</e:C1>
```

## JXML instantiation

All XML elements that are not of the empty namespace are JXML instantiations. Given that *comp* is the component being instantiated:

* *comp* is valid if and only if the tag name identifies a fully package qualified class that implements the `JXML` interface, where the tag namespace identifies the package and the tag unqualified name identifies the class name.
* A JXML instantiation returns `result = new comp(..., children)` passing a children array as the last argument and the default value for any other parameters.
  * It is a verify error if any of the parameter other than `children` have no default value.
* JXML instantiation requires contributing code to *descClass* constructor.

Code is contributed to the *descClass* constructor as follows:

* Let *codeLocation* be undefined.
* If there is a `super` statement in the constructor
  * Assign *codeLocation* = the location immediately after the `super` statement
* Otherwise
  * Assign *codeLocation* = the initial location of the constructor.
* Contribute to *codeLocation* the processing of attributes followed by children processing.

Attributes are processed as follows:

* For each XML attribute of the instantiation tag
  * If the XML attribute name is not **className**
    * Call *AssignJXMLAttribute*(*comp*, constructor scope, XML attribute)

Children are processed as follows:

* Let *parent* be `result`.
* If *comp* contains a `<Children/>` tag
  * Assign *parent* = the parent containing the `<Children/>` tag.
* For each *child* in the constructor `children` parameter
  * Call `parent.jxmlAppend(child)`.

### AssignJXMLAttribute()

The internal *AssignJXMLAttribute*(*comp*, *scope*, XML attribute) function takes the following steps:

1. Let *p* be a property of the result object whose name matches the attribute unqualified name.
2. It is a verify error if either *p* is not defined or *p* is read-only.
3. It is a verify error if *p* is neither a variable property or a virtual property.
4. Let *t* be the static type of *p*.
5. If the attribute value starts with the **&#x7B;** character and ends with the **&#x7D;** character
    1. Call *AssignJXMLExpressionAttribute*(*comp*, *scope*, *p*, *t*, XML attribute)
6. Otherwise call *AssignJXMLConstantAttribute*(*comp*, *p*, *t*, XML attribute)
7. Otherwise call *AssignJXMLColorAttribute*(*comp*, *p*, *t*, XML attribute)
8. Otherwise call *AssignJXMLVectorAttribute*(*comp*, *p*, *t*, XML attribute)

### AssignJXMLExpressionAttribute()

The internal *AssignJXMLExpressionAttribute*(*comp*, *scope*, *p*, *t*, XML attribute) function takes the following steps:

1. Let *src* be a substring of the attribute value from the second character until the last character (**&#x7D;**).
2. Let *v* be the verification of *src* as an *AssignmentExpression* with the context type *t* and with the initial scope as *scope*.
3. Assign *v* = implicit conversion from *v* to *t*.
4. It is a verify error if *v* is an incompatible conversion.
5. Assign *p* the evaluation of *v*

### AssignJXMLConstantAttribute()

The internal *AssignJXMLConstantAttribute*(*comp*, *p*, *t*, XML attribute) function takes the following steps:

1. If *t* is `N` or `Optional.<N>` where `N` is a number type
    1. Assign *AttributeValueToNumber*(*v*, `N`) to *p* where *v* is the attribute value.
    2. Exit function
2. If *t* is `Boolean` or `Optional.<Boolean>` and the attribute value is `false` or `true`, 
    1. Assign the equivalent boolean constant of that attribute value to *p*.
    2. Exit function
3. If *t* is `Char` or `Optional.<Char>`
    1. Assert that the attribute value consists of one character.
    2. Assign the first Unicode Code Point of the attribute value to *p*.
    3. Exit function
4. If *t* is `String` or `Optional.<String>`
    1. Assign the attribute value to *p*.
    2. Exit function
5. If *t* is `E` or `Optional.<E>` where `E` is a non Set `enum`
    1. Assert that the attribute value identifies a member of the `enum` by its string component and assign such member to *p*.
    2. Exit function
6. If *t* is `E` or `Optional.<E>` where `E` is a Set `enum`.
    1. Assert that the attribute value is a comma-separated list identifying one or more members of the `enum` by their string components.
    2. Assign such members to *p*.
    3. Exit function
7. Return assignment failure.

### AssignJXMLColorAttribute()

The internal *AssignJXMLColorAttribute*(*comp*, *p*, *t*, XML attribute) function takes the following steps:

1. Let *colorClass* be \[\[*JXMLColor*\]\] from either *comp* or a super class of *comp*.
2. If *colorClass* exists and *t* is equals *colorClass*, assign `new colorClass(v)` to *p* where `v` is the attribute value as a `String`.
3. Otherwise return assignment failure.

### AssignJXMLVectorAttribute()

The internal *AssignJXMLVectorAttribute*(*comp*, *p*, *t*, XML attribute) function takes the following steps:

1. Let *vectorClasses* be \[\[*JXMLVectors*\]\] from either *comp* or a super class of *comp*.
2. Let *vectorComponents* be the result of spliting the attribute value by comma.
3. If a class *vectorClass* from *vectorClasses* has a constructor whose number of formal parameters equals to the length of *vectorComponents* and *t* is equals *vectorClass*, assign *p* the expression `new vectorClass(...)` passing every value from the sequence returned by *StringsToNumbers*(*vectorComponents*, *N*) with *N* being the number type expected by the *vectorClass* constructor's formal parameters.
4. Otherwise return assignment failure.

### AttributeValueToNumber()

The internal *AttributeValueToNumber*(*s*, *N*) function takes a string *s* and returns a number of a specific number type *N*. The function performs the following steps:

* Let *s* be the result of trimming Unicode Whitespace characters out of both ends of *s*.
* If *N* is a floating point type and *s* is one of \{ `NaN`, `Infinity`, `-Infinity`, `+Infinity` \}, return the *N* representation of *s* as a floating point constant.
* Return the mathematical value of *s* as a *DecimalLiteral* or *HexIntegerLiteral*.

### StringsToNumbers()

The internal *StringsToNumbers*(*seq*, *N*) function takes a sequence of strings *seq* and returns a number sequence of a specific number type *N*. The function returns a processing of every element *s* in *seq* as the result of calling *AttributeValueToNumber*(*s*).