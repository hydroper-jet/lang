# JetWork 1.0 Language Specification

## 1. Overview

JetWork is a flexible, strongly typed, multi-purpose scripting language that strives to be in a balance between simplicity and performance.

The language is a fusion of the ActionScript 3 and Rust languages.

## 1.1. Example programs

### 1.1.1 isEven function

```
public function isEven(argument: BigInt): Boolean (
    argument % 2 == 0
);
```

## 1.2. APIs and package manager

The language is integrated with a package manager with support for vital features:

* workspaces;
* specifying a dependency through a directory path;
* registry namespaces.

Registry namespaces allow distinguishing dependencies from different platforms; without registry namespaces, the registry can get cluttered over time and working with different platforms can be a confusing experience.

A particular package can only depend in two registry namespaces: `*` and another optional registry namespace specified by the package manifest's top-level `registryNamespace` option. The `*` registry namespace indicates that the package does not rely on a platform.

Here is an example of a potential package manifest that uses `http://www.w3.org/web` as its dependency namespace:

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