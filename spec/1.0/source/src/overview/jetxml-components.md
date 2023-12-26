# JetXML components

JetWork supports classes in XML form called *JetXML* components. A JetXML component is a file with the extension `.jetxml`.

Here is an example JetXML:

```xml
<k:Container xmlns:k="org.k" className="org.example.Example">
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

## Data binding

JetXML may support data binding in the future. Data binding allows transferring the value from an source property to a destination property through an event.

## \<Children/\>

The empty `<Children/>` tag may appear anywhere in a JetXML file to indicate where to add the tag's children:

```xml
<k:Container xmlns:k="org.k" className="org.example.Example">
    <k:Container>
        <k:Container>
            <Children/>
        </k:Container>
    </k:Container>
</k:Container>
```

## \<Script\>

The `<Script>` tag may appear once in the root of a JetXML file to attach code to the class block.

## Initialization

JetWork imposes no restrictions for the JetXML component constructor and it may be defined as a normal constructor:

```xml
<k:Container xmlns:k="org.k" className="org.example.Example">
    <Script>
        <![CDATA[
            public function Example() {
                super();
            }
        ]]>
    </Script>
</k:Container>
```