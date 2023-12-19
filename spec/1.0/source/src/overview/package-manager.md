# Package manager

The language is integrated with JetPM, a package manager with support for vital features:

* workspaces;
* specifying a dependency through a directory path;
* registry namespaces.

## Build process

The package manifest represents a JetWork project, and locates its sources; therefore, the package manager is able to build a project through a simple command such as `jetpm build`, resulting into a bytecode artifact.

Here is an example package manifest:

**package.json**

```json
{
    "id": "org.q.f",
    "version": "0.1.0",
    "compilerOptions": {
        "includeSources": ["src"]
    }
}
```

## Registry namespaces

Registry namespaces allow distinguishing dependencies from different platforms; without registry namespaces, the registry can get cluttered over time and working with different platforms can be a confusing experience.

A particular package can only depend in two registry namespaces: `*` and another optional registry namespace specified by the package manifest's top-level `registryNamespace` option. The `*` registry namespace indicates that the package does not rely on a platform.

Here is an example of a potential package manifest that uses `http://www.w3.org/web` as its registry namespace:

**package.json**

```json
{
    "id": "org.q.f",
    "version": "0.1.0",
    "registryNamespace": "http://www.w3.org/web",
    "dependencies": {
        "*": {
            "org.xml": "1.0.0"
        },
        "http://www.w3.org/web": {
            "goog.g": "1.0.0"
        }
    }
}
```

Note that registry namespaces are only defined by the registry and not by the developers. This decision prevents accidental mistyping of registry namespace URIs and prevents cluttering of the registry with arbitrary registry namespaces.

## Conditional configuration

The package manager supports configuration constants that allow for conditional configuration within a manifest through the top-level `if` property. The matching options are combined and overriden properly in top-down sequence, including the program sources and the package dependencies.

The conditions in `if` support a minimal conditional language:

* `constant` — If configuration is present
* `!expression` — If condition is false
* `(expression)` — Parenthesized condition
* `primaryExpression && primaryExpression` — If conditions are true
* `primaryExpression || primaryExpression` — If one condition is true

The `true` constant is always present, and is typically used for specifying *base* options and *facade* options.

Here is an example package manifest using `if`:

**package.json**

```json
{
    "if": [
        ["true", {
            "compilerOptions": {
                "includeSources": ["src/base"]
            }
        }],
        ["air::target=ios", {
            "compilerOptions": {
                "includeSources": ["src/platform/ios"]
            }
        }],
        ["true", {
            "compilerOptions": {
                "includeSources": ["src/facade"]
            }
        }]
    ]
}
```

Here are example JetPM commands passing configuration constants:

```plain
jetpm build --define someConstant
jetpm build --define air::target=ios
```