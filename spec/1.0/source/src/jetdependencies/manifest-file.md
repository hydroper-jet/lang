# Manifest file

The manifest file of a package consists of the **jet.json** filename and contains descriptions encoded as a JSON object. The manifest file is stored at the directory of the package.

The following is an example manifest describing a package:

```json
{
    "id": "com.n1.n2",
    "version": "0.1.0",
    "platform": "http://example.com",
    "compilerOptions": {
        "sources": ["src"]
    }
}
```

## type

The **type** property of the manifest file is optional and must be equals to one of { **"package"**, **"workspace"**, **"platform"** }. If not present, it is set to **"package"**.

* If such property equals **"package"**, the manifest file describes a package.
* If such property equals **"workspace"**, then the manifest file describes a workspace.
* If such property equals **"platform"**, then the manifest file describes a platform.

## Package schema

### id

The **id** property of the manifest file is a required string conforming to the *JetDependenciesPackageId* symbol. The **id** attribute of the package is set to this string.

**Syntax**

<ul>
    <i>JetDependenciesPackageId</i> ::
    <ul>
        <i>JetDependenciesPackageIdStart</i><br>
        <i>JetDependenciesPackageId</i> <i>JetDependenciesPackageIdPart</i><br>
        <i>JetDependenciesPackageId</i> <b>.</b> <i>JetDependenciesPackageIdPart</i><br>
        <i>JetDependenciesPackageId</i> <b>-</b> <i>JetDependenciesPackageIdPart</i>
    </ul>
</ul>

<ul>
    <i>JetDependenciesPackageIdStart</i> ::
    <ul>
        <b>A</b>-<b>F</b><br>
        <b>a</b>-<b>f</b>
    </ul>
</ul>

<ul>
    <i>JetDependenciesPackageIdPart</i> ::
    <ul>
        <i>JetDependenciesPackageIdStart</i><br>
        <b>0</b>-<b>9</b>
    </ul>
</ul>

### version

The **version** property of the manifest file is a required string conforming to a SemVer version number, contributing the SemVer version number to the **version** attribute of the package.

### platform

The **platform** property of the manifest file is a contextually required string identifying a platform either by an Uniform Resource Identifier or through a file Uniform Resource Locator (URL) that starts with **file:**, assigning the platform to the **platform** attribute of the package. In case it is a file URL, it locates a platform in the host file system.

The **platform** property is required for all packages but the scripts contained with the **scripts** attribute of the package.

### dependencies

The **dependencies** property of the manifest file is an optional object consisting of dependency specifiers.

### Dependency specifier

A dependency specifier is a property whose name must match the *JetDependenciesPackageId* symbol and whose value must be a string either as a SemVer version number, or as a file Uniform Resource Locator (URL), or as a Git Uniform Resource Locator. A file URL starts with the **file:** prefix and locates a package in the host file system. A Git URL starts with the **git:** prefix and locates a package at a Git repository.

### scripts

The **scripts** property of the manifest file is an optional object consisting of additional packages that may be invoked through the command line, contributing to the **scripts** attribute of the package.

### compilerOptions

The **compilerOptions** property of the manifest file is an optional object describing compiler options.

### commandName

The **commandName** property of the manifest file is an optional string indicating the command name through which the package may be invoked from the command line, contributing to the **command name** attribute of the package.

### configuration

The **configuration** property of the manifest file is an optional array of branches that conditionally merge the following manifest options: **scripts**, **dependencies** and **compilerOptions**.

Each entry in the array must be a two-element tuple consisting of a **condition** and a consequent file manifest object, whose results either aggregate to or overwrite the previous manifest settings.

The condition must be a string matching the *JetDependenciesCondition* symbol, ignoring the *WhiteSpace*, *LineTerminator*, and *Comment* symbols between each token.

* The **always** condition is always true.
* The **if** condition is true if its expression evaluates to true.
* The **else if** condition is true if the previous sibling **else if** conditions until the first sibling **if** condition (inclusive) are false and if its expression evaluates to true.
* The **else** condition is true if the previous sibling **else if** conditions until the first sibling **if** condition (inclusive) are false.

The following is an example file manifest demonstrating the use of the **configuration** property:

```json
{
    "id": "com.n1.n2",
    "version": "0.1.0",
    "platform": "http://example.com",
    "configuration": [
        ["always", {
            "compilerOptions": {
                "sources": ["src/alpha"]
            }
        }],
        ["if (target=ios)", {
            "compilerOptions": {
                "sources": ["src/platforms/ios"]
            }
        }],
        ["else", {
            "compilerOptions": {
                "sources": ["src/platforms/unsupported"]
            }
        }],
        ["always", {
            "compilerOptions": {
                "sources": ["src/omega"]
            }
        }]
    ]
}
```

**Syntax**

<ul>
    <i>JetDependenciesCondition</i> :
    <ul>
        <b>always</b><br>
        <b>if (</b> <i>ConfigurationExpression</i> <b>)</b><br>
        <b>else if (</b> <i>ConfigurationExpression</i> <b>)</b><br>
        <b>else</b>
    </ul>
</ul>

## Workspace schema

### members

The **members** property of the manifest file is required and must be an array of strings as paths to directories containing a manifest file. Each entry in the array must locate a package and **must not** be duplicate, contributing a member package to the workspace.

## Platform schema

### uri

The **uri** property of the manifest file is a required string consisting of an Uniform Resource Identifier (URI) unique to the platform, contributing to the **URI** attribute of the platform.

### compiler

The **compiler** property of the manifest file is a required string consisting of a path to a compiler executable, contributing to the **compiler** attribute of the platform.