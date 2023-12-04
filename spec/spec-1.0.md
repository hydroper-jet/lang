# JetWork 1.0 Language Specification

## 1. Overview

JetWork is a flexible, strongly typed, multi-purpose scripting language that strives to be in a balance between simplicity and performance.

The syntax for JetWork programs is designed to be as close as possible to the syntax from ActionScript 3 programs. The language attempts not to introduce unfamiliar syntax.

### 1.1. Example programs

#### 1.1.1. isEven function

```
public function isEven(argument: BigInt): Boolean (
    argument % 2 == 0
);
```

### 1.2. Package manager

The language is integrated with a package manager with support for vital features:

* workspaces;
* specifying a dependency through a directory path;
* registry namespaces.

Registry namespaces allow distinguishing dependencies from different platforms; without registry namespaces, the registry can get cluttered over time and working with different platforms can be a confusing experience.

A particular package can only depend in two registry namespaces: `*` and another optional registry namespace specified by the package manifest's top-level `registryNamespace` option. The `*` registry namespace indicates that the package does not rely on a platform.

Here is an example of a potential package manifest that uses `http://www.w3.org/web` as its dependency namespace:

**package.json**

```json
{
    "id": "org.q.f",
    "registryNamespace": "http://www.w3.org/web",
    "dependencies": {
        "*": {
            "xml": "1.0.0",
        },
        "http://www.w3.org/web": {
            "goog.g": "1.0.0"
        }
    }
}
```

Note that registry namespaces are only defined by the registry maintainers, not by the developers.

### 1.3. Compilation and transpilation

JetWork compiles to the JetWork Virtual Machine Bytecode, which, in turn, can be compiled to other languages or be executed by a virtual machine.

### 1.3.1. String encoding

The String data type uses an implementation-defined encoding and is supported by a CharIndex data type representing a string index into it. CharIndex holds the original string and the integer index. CharIndex defines a `next()` method that walks Unicode Scalar Values in the encoded string, returning the final CharIndex. The zero literal (`0`) implicitly converts to CharIndex.

The following variable `x` is a string ranging from the second character to the end of another string:

```
const string2 = string1.substring(string1.firstIndex.next(1));
```

Further examples:

```
const s = "jetwork";

// "jet"
trace(s.slice(0, s.firstIndex.next(3)));
trace(s.slice(0, s.lastIndex.next(-4)));

// Character count between i and j
trace(s.charCountRange(i, j));

// Character count
trace(s.charCount);

// Character count in the implementation encoding's units
trace(s.charCountEncoded);

// Whether the string is empty or not
trace(s.isEmpty);
trace(s == "");

// Scalar Value at i
const character = "jetwork".charAt(i);

// For each character
for each (const character in "jetwork") {}
```

### 1.3.2. Number overflow

Operations whose result cannot be represented due to range limit cause a number overflow, such as `Int.MAX_VALUE + 1`. The result of a number overflow is implementation defined.

### 1.3.3. Exceptions

JetWork supports checked exceptions and fatal exceptions, which facilitates different implementations of the language. Fatal exceptions are known as *panics* in other languages; fatal exceptions are not caught by user code in JetWork.

## 1.4. JetXML classes

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