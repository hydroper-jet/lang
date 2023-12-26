# JetXML components

<!--

Future data binding support:

* Consider using a particular XML namespace for data binding attributes (prefix usually being "bind").
* A p={o.p} attribute would be a data binding if o is a binding from within the JetXML component

-->

A JetXML component is a XML file with the extension `.jetxml` describing a class that inherits from a `JetXML` implementor. The class being described in the XML file is referred throughout this section as `descClass`.

## Class name

The root element must assign the attribute `className` a fully package qualified name whose trailing name identifies the class name of `descClass`, as in:

```xml
<e:Application xmlns:e="org.example" className="org.example.Main">
    <!-- Class contents -->
</e:Application>
```

Such XML file results into defining `descClass` as a `Main` class that belongs to the `org.example` package. It is a verify error if the class is already defined.

## Root element

The root element of the XML file instantiates a JetXML component and determines the class from which `descClass` inherits.

## Class constructor

The class constructor of `descClass` is implicitly defined if not already defined by the `<Script>` element.

The following restrictions apply to JetXML components:

* The constructor of `descClass` is only allowed to receive optional parameters.

## \<Script\>

The `Script` element is allowed at the root element and may appear at most once. If an `Script` element appears, it must only contain a CDATA section.

The CDATA section contains a JetWork source as the contents of a `class` block. Such contents are contributed to `descClass`.

The `Script` element must be interpreted before the XML attributes of the root element are processed. This behavior allows code in attribute values to rely on `import` directives, as in the following JetXML component:

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

The `Children` tag is replaced by zero or more JetXML instantiations that appear as children of the JetXML component.

```xml
<e:C1 xmlns:e="org.example" className="org.example.C2">
    <Children/>
</e:C1>
```

## JetXML instantiation

All XML elements that are not of the empty namespace are JetXML instantiations. Given that `comp` is the component being instantiated:

* `comp` is valid if and only if the tag name identifies a fully package qualified class that implements the `JetXML` interface, where the tag namespace identifies the package and the tag unqualified name identifies the class name.
* A JetXML instantiation returns `result = new comp()` followed by zero or more property assignments at `result` and zero or more `result.jetxmlAppend()` calls.

Children components are processed as follows:

1. If `comp` contains a `<Children/>` tag, children components take the place of such `<Children/>` tag.
2. Otherwise, for each child component, call `result.jetxmlAppend()` with the result of the child JetXML instantiation.

### Attributes

XML attributes of the empty namespace applied to the instantiation are processed as follows:

1. Let *p* be a property of the result object whose name matches the attribute unqualified name.
2. It is a verify error if either *p* is not defined or *p* is read-only.
3. It is a verify error if *p* is neither a variable property or a virtual property.
4. Let *t* be the static type of *p*.
5. If the attribute value starts with the **&#x7B;** character and ends with the **&#x7D;** character
    1. Let *src* be a substring of the attribute value from the second character until the last character.
    2. Let *v* be the verification of *src* as an *AssignmentExpression* with the context type *t* and with the initial scope as the `descClass` constructor scope.
    3. Assign *v* = *ConvertImplicitly*(*v*, *t*)
    4. It is a verify error if *v* is an incompatible conversion.
    5. Assign *p* the evaluation of *v*
6. Otherwise
    1. Do one of the following steps:
        1. If *t* is `N` or `Optional.<N>` where `N` is a number type, assign *AttributeValueToNumber*(*v*, `N`) to *p* where *v* is the attribute value.
        2. If *t* is `Boolean` or `Optional.<Boolean>` and the attribute value is `false` or `true`, assign the equivalent boolean constant of that attribute value to *p*.
        3. If *t* is `Char` or `Optional.<Char>`, assert that the attribute value consists of one character and assign the first Unicode code point of the attribute value to *p*.
        4. If *t* is `String` or `Optional.<String>`, assign the attribute value to *p*.
        5. If *t* is `E` or `Optional.<E>` where `E` is a non Set `enum`, assert that the attribute value identifies a member of the `enum` by its string component and assign such member to *p*.
        6. If *t* is `E` or `Optional.<E>` where `E` is a Set `enum`, assert that the attribute value is a comma-separated list identifying one or more members of the `enum` by their string components and assign such members to *p*.
    2. Otherwise:
        1. Let *colorClass* be \[\[*JetXMLColor*\]\] from either `comp` or a super class of `comp`.
        2. If *colorClass* exists and *t* is equals *colorClass*, assign `new colorClass(v)` to *p* where `v` is the attribute value as a `String`.
        3. Otherwise:
            1. Let *vectorClasses* be \[\[*JetXMLVectors*\]\] from either `comp` or a super class of `comp`.
            2. Let *vectorComponents* be the result of spliting the attribute value by comma.
            3. If a class *vectorClass* from *vectorClasses* has a constructor whose number of formal parameters equals to the length of *vectorComponents*, assign *p* the expression `new vectorClass(...)` passing every value from the sequence returned by *StringSequenceToNumberSequence*(*vectorComponents*, *N*) with *N* being the number type expected by the *vectorClass* constructor's formal parameters.
            4. Otherwise throw a verify error.

### AttributeValueToNumber()

The internal *AttributeValueToNumber*(*s*, *N*) function takes a string *s* and returns a number of a specific number type *N*. The function performs the following steps:

* Let *s* be the result of trimming Unicode Whitespace characters out of both ends of *s*.
* If *N* is a floating point type and *s* is one of \{ `NaN`, `Infinity`, `-Infinity`, `+Infinity` \}, return the *N* representation of *s* as a floating point constant.
* Return the mathematical value of *s* as a *DecimalLiteral* or *HexIntegerLiteral*.

### StringSequenceToNumberSequence()

The internal *StringSequenceToNumberSequence*(*seq*, *N*) function takes a sequence of strings *seq* and returns a number sequence of a specific number type *N*. The function returns a processing of every element *s* in *seq* as the result of calling *AttributeValueToNumber*(*s*).

## Instance variables

Instance variables belonging to `descClass` are JetXML variables with special behavior as described by section [Variables](variables.md#jetxml-variables).