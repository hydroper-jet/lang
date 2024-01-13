# JetPM package manager

The language coworks with JetPM, a package manager that supports a standard build system, conditional compilation, and workspaces.

JetPM requires a package to belong to a *registry namespace*.

## Build system

The package manifest locates Jet source files, enabling JetPM to build a project through a concise command such as `jetpm build`, resulting into a bytecode artifact.

Here is an example package manifest:

**package.json**

```json
{
    "id": "com.x.y",
    "version": "0.1.0",
    "registryNamespace": "http://ns.airsdk.dev/2008",
    "compilerOptions": {
        "includeSources": ["src"]
    }
}
```

## Registry namespaces

Registry namespaces are required to distinguish platforms on which the Jet program executes. Platforms may have incompatible implementations, such as regular expressions, or lacking implementations of certain functions, therefore sharing packages between platforms is not allowed in JetPM.

The package manifest's top-level `registryNamespace` option is required and indicates the registry namespace to which the package belongs as well as the namespace on which dependencies are found in the package registry.

Here is an example of a potential package manifest that uses `http://ns.airsdk.dev/2008` as its registry namespace:

**package.json**

```json
{
    "id": "com.x.y",
    "version": "0.1.0",
    "registryNamespace": "http://ns.airsdk.dev/2008",
    "dependencies": {
        "goog.firebase": "1.0.0"
    }
}
```

Note that registry namespaces are defined internally in the registry and may not be arbitrary. Registry namespaces are available as platforms are supported.

## Conditional compilation

The JetPM build system receives *constants* supplied by build commands, which may be used with [conditional compilation](conditional-compilation.md).

```plain
jetpm build --define myConstant
jetpm build --define myConstant=10
jetpm build --define q::myConstant=10
```

The top-level `configuration` property of the package manifest specifies the manifest properties in a conditional way. The matching branches are combined and overriden properly in top-down sequence, including the program sources and the package dependencies.

The key of each property in the `configuration` property is in one of the forms:

* `always`
* `if (condition)`
* `else if (condition)`
* `else`

Here is an example package manifest using the `configuration` setting:

**package.json**

```json
{
    "id": "com.x.y",
    "version": "0.1.0",
    "registryNamespace": "http://ns.airsdk.dev/2008",
    "configuration": [
        ["always", {
            "compilerOptions": {
                "includeSources": ["src/base"]
            }
        }],
        ["if (air::target=ios)", {
            "compilerOptions": {
                "includeSources": ["src/platform/ios"]
            }
        }],
        ["else", {
            "compilerOptions": {
                "includeSources": ["src/platform/unsupported"]
            }
        }],
        ["always", {
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

## Scripts

The package manifest allows mapping of executable scripts, as well as their dependencies.

Scripts are executed in the Node.js® platform; therefore they implicitly use the `http://ns.nodejs.org/2009` registry namespace.

JetPM constants are propagated from the containing package to the script, allowing equivalent conditional compilation in the script sources.

*Build script*: The `build` script is automatically executed before the Jet project is built. Here is an example manifest demonstrating the special `build` script:

**package.json**

```json
{
    "id": "com.x.y",
    "version": "0.1.0",
    "registryNamespace": "http://ns.airsdk.dev/2008",
    "scripts": {
        "build": {
            "compilerOptions": {
                "includeSources": ["build.jet"]
            }
        }
    }
}
```

## Workspaces

A workspace project contains a `workspace.json` file, which follows the format:

**workspace.json**

```json
{
    "members": [
        "packages/com.x.y",
        "packages/com.x.z"
    ]
}
```

A member package may depend in another member package by using a `file:` URL:

**package.json**

```json
{
    "id": "com.x.z",
    "version": "0.1.0",
    "registryNamespace": "http://ns.airsdk.dev/2008",
    "dependencies": {
        "com.x.y": "file:../com.x.y"
    }
}
```