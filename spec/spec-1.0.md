# JetWork 1.0 Language Specification

## 1. Overview

JetWork is a flexible, strongly typed, multi-purpose scripting language that strives to be in a balance between simplicity and performance. JetWork is a fusion of the ActionScript 3 and Rust languages.

### 1.1. Compilation and transpilation

JetWork compiles to the JetWork Virtual Machine Bytecode which, in turn, can be compiled to other languages or be directly executed by a virtual machine.

### 1.1.1. String encoding

Since implementations use different encodings for the main string data type, the String data type in JetWork is accompanied by a StringIndex type, used to represent an index for any String. StringIndex does not allow numeric operations; instead, StringIndex supports methods such as `next()` that work with character positions instead of encoded indices.

For example, the following variable `x` is a string ranging from the second character to the end of another string:

```
const x = y.substring(StringIndex(0).next(y, 1));
```

### 1.1.2. Number overflow

Operations whose result cannot be represented due to range limit cause a number overflow, such as `Int.MAX_VALUE + 1`. The result of a number overflow is implementation defined.

### 1.2. Example programs

#### 1.2.1. isEven function

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