# Interfaces

An interface represents an abstract object type.

Interfaces consist of a small number of internal properties, described in the following table:

| Internal property | Description |
| ----------------- | ----------- |
| \[\[*Name*\]\] | The non fully qualified name of the interface. |
| \[\[*ParentDefinition*\]\] | The parent definition of the interface. |
| \[\[*SuperInterfaces*\]\] | The super interfaces of the interface. |
| \[\[*TypeParameters*\]\] | The type parameter sequence of the interface. |
| \[\[*Prototype*\]\] | The interface prototype. |

## Super interfaces

It is a verify error if:

* an interface attempts to extend itself;
* an interface attempts to extend a subtype of itself.

## Parent definition

When the parent definition of an interface is a package, the interface has a fully package qualified name.