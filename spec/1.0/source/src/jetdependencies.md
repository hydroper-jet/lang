<sectionLabel>sec-jetdependencies</sectionLabel>

# JetDependencies

This section describes the attributes, schemas and semantics of the JetDependencies dependency manager incorporated in the Jet language.

*Note: Throughout this section, **package** refers to **JetDependencies package**, **workspace** refers to **JetDependencies workspace**, **platform** refers to **JetDependencies platform**, and **constant** refers to **JetDependencies constant**.*

## Package

### Attributes

| Name | Description |
| ---- | ----------- |
| ***directory***        | The directory containing the package. |
| ***manifest***         | The manifest file of the package. |
| ***id***               | The identifier of the package. |
| ***version***          | The SemVer version number of the package. |
| ***platform***         | The platform of the package. |
| ***dependencies***     | The packages that the package depends in. |
| ***compiler options*** | The compiler options of the package. |
| ***scripts***          | Object of script packages. |
| ***command name***     | Optional string identifying a command name through which the package may be invoked in the command line. |

## Workspace

### Attributes

| Name | Description |
| ---- | ----------- |
| ***directory***        | The directory containing the workspace. |
| ***manifest***         | The manifest file of the workspace. |
| ***members***          | Array of member packages. |

## Platform

### Attributes

| Name | Description |
| ---- | ----------- |
| ***manifest***         | The manifest file of the platform. |
| ***URI***              | The URI of the platform. |
| ***compiler***         | Path to the compiler executable associated with the platform. |

### Compiler executable

*Note: this section is incomplete in the present. A compiler must conform to a certain command line structure and must be able to generate artifacts, generate API documentation, execute as a language server, and execute or debug the artifact program.*

## Constants

JetDependencies is supplied with zero or more constants during build commands.