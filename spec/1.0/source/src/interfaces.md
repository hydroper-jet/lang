# Interfaces

An interface represents an abstract object type.

Interfaces consist of a small number of internal properties, described in the following table:

| Internal property | Description |
| ----------------- | ----------- |
| \[\[*Name*\]\] | The unqualified name of the interface. |
| \[\[*Visibility*\]\] | The [visibility](visibility.md) of the interface. |
| \[\[*ParentDefinition*\]\] | The parent definition of the interface. |
| \[\[*SuperInterfaces*\]\] | The super interfaces of the interface. |
| \[\[*TypeParameters*\]\] | The type parameter sequence of the interface. |
| \[\[*Prototype*\]\] | Properties of the interface prototype as a dictionary from string to symbol. |
| \[\[*PlainMetadata*\]\] | Plain meta-data attached to the interface. |

## Super interfaces

It is a verify error if:

* an interface attempts to extend itself;
* an interface attempts to extend a subtype of itself.

## Parent definition

When the parent definition of an interface is a package, the interface has a fully package qualified name.

## Meta data

An interface may contain zero or more plain meta-data:

```
[[N1(n2)]]
interface I {}
```