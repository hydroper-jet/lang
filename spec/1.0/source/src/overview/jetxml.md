# JetXML

JetWork supports classes in XML form called *JetXML* classes. JetXML classes are files with the extension `.jetxml`. Such classes are instantiated with an empty constructor and XML attributes applied to them delegate to the instance properties.

JetXML classes must extend a base class. Here is an example program:

**Button.jetxml**

```xml
<Button extends="spark.Node">
    <script>
        <![CDATA[
            [JetXMLVariable]
            public var xy: Number = 0;
        ]]>
    </script>
</Button>
```

**Node.jet**

```
import jetwork.jetxml.*;
public abstract class Node implements JetXMLAppendable, JetXMLUpdate {
    /* ... */
}
```

The `JetXMLVariable` meta data is used to automatically alter the rendering status of a node when the value of a property changes. For update functions, the `jetxmlStatus` property must be set to `"outdated"` instead.

It is allowed to alias JetWork modules inside `.jetxml` classes and the alias is available both within the code and within the XML tags:

```xml
<Button xmlns:s="spark.controls" extends="s.SparkControl">
    <s:ProgressBar/>
</Button>
```

The `JetXMLVariable` meta data and the `JetXMLUpdate` interface are in general used to cause a next rendering on a next frame iteration of the node by checking the `jetxmlStatus` property.