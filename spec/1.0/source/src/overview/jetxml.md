# JetXML

JetWork supports classes in XML form called *JetXML* classes. JetXML classes are files with the extension `.jetxml`. Such classes are instantiated with an empty constructor and XML attributes applied to them delegate to the instance properties.

* It is allowed to alias JetWork modules inside `.jetxml` classes and the alias is available both within the code and within the XML tags:
* JetXML classes extend another class, which is indicated by the root XML element.

Here is an example JetXML class:

**Maze.jetxml**

```xml
<f:Container xmlns:fx="http://www.jetwork.org/lang/jetxml" xmlns:f="fu.tree" xmlns:e="package">
    <fx:Script>
        <![CDATA[
            [JetXML]
            public var xy: Number = 0;
        ]]>
    </fx:Script>
    <e:Container><f:Helper/></e:Container>
</f:Container>
```

**Node.jet**

```
import jetwork.jetxml.JetXML;
public abstract class Node implements JetXML { /* ... */ }
```

The `JetXML` meta data is used to automatically alter the rendering status of a node when the direct value of the `xy` property changes by assigning `jetxmlStatus = "outdated"`.

The `jetxmlStatus` property is in general used to cause a next rendering on a next frame iteration of the node.

## Data bindings

JetXML may support data bindings in the future. Data bindings allow connecting property values through events.

## \<fx:Children/\>

The empty `<fx:Children/>` tag, where `fx` is the namespace `http://www.jetwork.org/lang/jetxml`, may appear anywhere in a JetXML file to indicate where to add the tag's children:

```xml
<f:Container xmlns:fx="http://www.jetwork.org/lang/jetxml" xmlns:f="fu.tree">
    <f:Container>
        <f:Container>
            <fx:Children/>
        </f:Container>
    </f:Container>
</f:Container>
```

## \<fx:Script\>

The `<fx:Script>` tag, where `fx` is the namespace `http://www.jetwork.org/lang/jetxml`, may appear anywhere in the top-level of a JetXML file to attach code to the class and its outer module.

There are two forms of `fx:Script`:

* `<fx:Script>` — Attaches code to the class block.
* `<fx:Script type="module">` — Attaches code to the class's module.

Here is an example attaching code to the class's module:

```xml
<f:Container xmlns:fx="http://www.jetwork.org/lang/jetxml" xmlns:f="fu.tree">
    <fx:Script type="module">
        <![CDATA[
            public type LoaderResult = Result.<ByteArray, TypeError, VerifyError>;
        ]]>
    </fx:Script>
</f:Container>
```