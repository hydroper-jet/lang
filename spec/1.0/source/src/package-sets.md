# Package sets

Package sets allow to resolve a property from a set of packages. Package sets are common in XML based frameworks built over the Jet Compiler codebase.

Package sets consist of the following internal properties:

| Internal property | Description |
| ----------------- | ----------- |
| \[\[*Name*\]\] | The unqualified name of the package set. |
| \[\[*Visibility*\]\] | The [visibility](visibility.md) of the package set. |
| \[\[*ParentDefinition*\]\] | Parent definition of the package set. |
| \[\[*Packages*\]\] | The packages within the set. |

## Parent definition

When the parent definition of a package set is a package, the package set has a fully package qualified name.