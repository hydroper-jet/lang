# JetXML components

JetWork supports classes in XML form called *JetXML* components. A JetXML component is a file with the extension `.jetxml`.

* A JetXML component class extends another class based in the root XML element.
* A JetXML component class specifies its fully package qualified class name in the `className` attribute of the root XML element.
* XML namespaces identify JetWork packages, except for the `jetxml` XML namespace.
* XML attributes apply to instance properties.
* A JetXML constructor is only allowed to receive optional parameters.

Here is an example JetXML:

**Example.jetxml**

```xml
<k:Container xmlns="jetxml" xmlns:k="org.k" className="org.example.Example">
    <Script>
        <![CDATA[
            public var exampleProperty: Number = Infinity;
        ]]>
    </Script>
    <k:Container>
        <k:AnotherExample/>
    </k:Container>
</k:Container>
```

For the given example, `k:Container` inherits from the following abstract `Node` class from `org.k`:

```
package org.k {
    public abstract class Node implements JetXML { /* ... */ }
}
```

Explanatory comments:

* The example Example.jetxml file defines a class that inherits from the `k:Container` class.
* The instance variable `exampleProperty` declared within the `Script` tag automatically alters the rendering status of the `Example` instance when the direct value of the `exampleProperty` property is updated by an assignment; that is, assignments to `exampleProperty` are implicitly followed by a `node.jetxmlStatus = "outdated";` assignment.
* The `jetxmlStatus` property may be used to cause a new rendering of the node on a next frame iteration.
* The `jetxmlStatus` property as defined by the `JetXML` interface is allowed to emit an event when assigned.

## Data bindings

JetXML may support data bindings in the future. Data bindings allow connecting property values through events.

## \<Children/\>

The empty `<Children/>` tag, of the namespace `jetxml`, may appear anywhere in a JetXML file to indicate where to add the tag's children:

```xml
<k:Container xmlns="jetxml" xmlns:k="org.k" className="org.example.Example">
    <k:Container>
        <k:Container>
            <Children/>
        </k:Container>
    </k:Container>
</k:Container>
```

## \<Script\>

The `<Script>` tag, of the namespace `jetxml`, may appear anywhere in the top-level of a JetXML file to attach code to the class and its outer package.

There are two forms of `Script`:

* `<Script>` — Attaches code to the class block.
* `<Script package="true">` — Attaches code to the class's package.

Here is an example attaching code to the class's package:

```xml
<k:Container xmlns="jetxml" xmlns:k="org.k" className="org.example.Example">
    <Script package="true">
        <![CDATA[
            public type ExampleAlias = [String, Boolean];
        ]]>
    </Script>
</k:Container>
```

## Initialization

JetWork imposes no restrictions for the JetXML component constructor and it may be defined as a normal constructor:

```xml
<k:Container xmlns="jetxml" xmlns:k="org.k" className="org.example.Example">
    <Script>
        <![CDATA[
            public function Example() {
                super();
            }
        ]]>
    </Script>
</k:Container>
```