# JetXML

JetWork supports classes in XML form called *JetXML* classes. JetXML classes are files with the extension `.jetxml`. Such classes are instantiated with an empty constructor and XML attributes applied to them delegate to the instance properties.

JetXML classes must extend a base class. Here is a simple example program:

**Button.jetxml**

```xml
<Button extends="spark.Node">
    <script>
        <![CDATA[
            [JetXML]
            public var xy: Number = 0;
        ]]>
    </script>
</Button>
```

**Node.jet**

```
import jetwork.jetxml.JetXML;
public abstract class Node implements JetXML {
    /* ... */
}
```

The `JetXML` meta data is used to automatically alter the rendering status of a node when the direct value of the `xy` property changes by assigning `jetxmlStatus = "outdated"`.

It is allowed to alias JetWork modules inside `.jetxml` classes and the alias is available both within the code and within the XML tags:

```xml
<Button xmlns:s="spark.controls" extends="s.SparkControl">
    <s:ProgressBar/>
</Button>
```

The `jetxmlStatus` property is in general used to cause a next rendering on a next frame iteration of the node.

## Data bindings

JetXML may support data bindings in the future. Data bindings allow connecting property values through events.