# Classes

A class represents an object type.

Classes consist of several internal properties, as described in the following table:

| Internal property | Description |
| ----------------- | ----------- |
| \[\[*Name*\]\] | The non fully qualified name of the class. |
| \[\[*ParentDefinition*\]\] | The parent definition of the class. |
| \[\[*SuperClass*\]\] | The super class of the class. It is undefined if the class is the `Object` class. |
| \[\[*Implements*\]\] | Set of interfaces the class implements. |
| \[\[*IsFinal*\]\] | Indicates whether the class is final or not. |
| \[\[*IsStatic*\]\] | Indicates whether the class is static or not. |
| \[\[*IsAbstract*\]\] | Indicates whether the class is abstract or not. |
| \[\[*AllowLiteral*\]\] | Indicates whether the class may be initialized through an object initializer or not; that is, if it has the `[Literal]` meta-data. |
| \[\[*TypeParameters*\]\] | The type parameter sequence of the class. |
| \[\[*StaticProperties*\]\] | Static properties of the class. |
| \[\[*Prototype*\]\] | The class prototype. |

## Super class

By default, all classes, excluding `Object`, have `Object` as their super class.

It is a verify error if:

* a class attempts to extend itself;
* a class attempts to extend a subclass of itself.

## Parent definition

When the parent definition of a class is a package, the class has a fully package qualified name.