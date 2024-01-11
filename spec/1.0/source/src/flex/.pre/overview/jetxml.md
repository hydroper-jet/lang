# JetXML components

Jet supports classes in XML form called *JetXML* components. A JetXML component is a file with the extension `.jetxml`.

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

For the above example, `k:Container` inherits from the following abstract `Node` class from `org.k`:

```
package org.k {
    public abstract class Node implements JetXML.<Node> { /* ... */ }
}
```

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