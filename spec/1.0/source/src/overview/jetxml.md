# JetXML

JetWork supports classes in XML form called *JetXML*. A JetXML is a file with the extension `.jetxml`. A JetXML is instantiated with an empty constructor and XML attributes applied to them delegate to the instance properties.

* It is allowed to alias JetWork modules inside `.jetxml` classes and the alias is available both within the code and within the XML tags:
* JetXML classes extend another class, which is based in the root XML element.

Here is an example JetXML class:

**ExampleJetXML.jetxml**

```xml
<k:Container xmlns:fx="http://www.jetwork.org/lang/jetxml" xmlns:k="org.k" xmlns:example="package">
    <fx:Script>
        <![CDATA[
            public var xy: Number = 0;
        ]]>
    </fx:Script>
    <example:Container>
        <k:Container/>
    </example:Container>
</k:Container>
```

For the given example, `k:Container` inherits from the following abstract *Node* class from `org.k` applies:

```
import jetwork.jetxml.JetXML;
public abstract class Node implements JetXML { /* ... */ }
```

Explanatory comments:

* The example ExampleJetXML.jetxml file defines a class that inherits from the `k:Container` class.
* The instance variable `xy` declared within the `fx:Script` tag automatically alters the rendering status of the `ExampleJetXML` instance when the direct value of the `xy` property is updated by an assignment; that is, assignments to `xy` are implicitly followed by a `node.jetxmlStatus = "outdated";` assignment.
* The `jetxmlStatus` property may be used to cause a new rendering of the node on a next frame iteration.
* The `jetxmlStatus` property as defined by the `JetXML` interface is allowed to emit an event when assigned.

## Data bindings

JetXML may support data bindings in the future. Data bindings allow connecting property values through events.

## \<fx:Children/\>

The empty `<fx:Children/>` tag, where `fx` is the namespace `http://www.jetwork.org/lang/jetxml`, may appear anywhere in a JetXML file to indicate where to add the tag's children:

```xml
<k:Container xmlns:fx="http://www.jetwork.org/lang/jetxml" xmlns:k="org.k">
    <k:Container>
        <k:Container>
            <fx:Children/>
        </k:Container>
    </k:Container>
</k:Container>
```

## \<fx:Script\>

The `<fx:Script>` tag, where `fx` is the namespace `http://www.jetwork.org/lang/jetxml`, may appear anywhere in the top-level of a JetXML file to attach code to the class and its outer module.

There are two forms of `fx:Script`:

* `<fx:Script>` — Attaches code to the class block.
* `<fx:Script scope="module">` — Attaches code to the class's module.

Here is an example attaching code to the class's module:

```xml
<k:Container xmlns:fx="http://www.jetwork.org/lang/jetxml" xmlns:k="org.k">
    <fx:Script scope="module">
        <![CDATA[
            public type LoaderResult = Result.<ByteArray, TypeError, VerifyError>;
        ]]>
    </fx:Script>
</k:Container>
```

## Initialization

JetWork imposes no restrictions for the JetXML constructor and it may be defined as a normal constructor:

```xml
<k:Container xmlns:fx="http://www.jetwork.org/lang/jetxml" xmlns:k="org.k">
    <fx:Script>
        <![CDATA[
            public function ExampleJetXML() {
                super();
            }
        ]]>
    </fx:Script>
</k:Container>
```