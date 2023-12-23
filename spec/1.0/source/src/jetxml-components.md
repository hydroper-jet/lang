# JetXML components

<!--

Future data bindings support:

* Consider using a particular XML namespace for data binding attributes.

JetXML components:

* Attribute constants:
  * `Optional.<N>` where `N` is a number type: accepts an attribute constant of `N` type
  * `NF` where `NF` is a floating point type: accepts a floating point, `-Infinity`, `+Infinity`, `Infinity`, and `NaN`
  * `Boolean` allows for `true` and `false`
  * `Optional.<Char>` allows for a single character
  * `Char` allows for a single character
  * `Optional.<String>` allows for any attribute value (interpreted as a String)
  * `String` allows for any attribute value (interpreted as a String)
  * Non-Set `enum` allows for a member string
  * `Optional.<E>` where `E` is a non-Set `enum` allows for a member string
  * Set `enum` allows for comma-separated member strings
  * `Optional.<E>` where `E` is a Set `enum` allows for comma-separated member strings
  * Any other type may not be expressed as an attribute constant.

-->

A JetXML component is a XML file with the extension `.jetxml` describing a class that inherits from a `JetXML` subclass. The class being described the XML file is referred throughout this section as `descClass`.

The default XML namespace used throughout this section is the **jetxml** string, as if the attribute `xmlns="jetxml"` were applied to the root XML element.

## Class name

The root element must assign the attribute `className` a fully package qualified name whose trailing name identifies the class name of `descClass`, as in:

```xml
<e:Application xmlns="jetxml" xmlns:e="org.example" className="org.example.Main">
    <!-- Class contents -->
</e:Application>
```

Such XML file results into defining `descClass` as a `Main` class that belongs to the `org.example` package. It is a verify error if the class is already defined.

## Root element

The root element of the XML file instantiates a JetXML component and determines the class from which `descClass` inherits.

## Class constructor

The following restrictions apply to JetXML components:

* The constructor of `descClass` is only allowed to receive optional parameters.

## \<Script\>

The `Script` element is allowed at the root element and may appear at most once. If an `Script` element appears, it must only contain a CDATA section.

The CDATA section contains a JetWork source as the contents of a `class` block. Such contents are contributed to `descClass`.

## \<Children/\>

The empty `Children` element is allowed anywhere within the root element and may appear at most once.

The `Children` tag is replaced by zero or more component instantiations that appear as children of the JetXML component.

```xml
<e:C1 xmlns="jetxml" xmlns:e="org.example" className="org.example.C2">
    <Children/>
</e:C1>
```

## Component instantiation

All XML elements that are not in the **jetxml** namespace are component instantiations. Given that `cbi` is the component being instantiated:

* `cbi` is valid if and only if the tag name identifies a fully package qualified class that inherits from the `JetXML` class, where the tag namespace identifies the package and the tag non qualified name identifies the class name.
* A component instantiation returns `result = new cbi()` followed by zero or more property assignments at `result` and zero or more `result.jetxmlAppend()` calls.

Children components are processed as follows:

1. If `cbi` contains a `<Children/>` tag, children components take the place of such `<Children/>` tag.
2. Otherwise, for each child component, call `result.jetxmlAppend()` with the result of the child instantiation.

### Attributes

Attributes at the **jetxml** namespace applied to the instantiation are processed as follows:

* To do