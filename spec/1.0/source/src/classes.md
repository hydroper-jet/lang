# Classes

A class as denoted by the `class` keyword represents an object type. A class is reflected as a `Class` object.

Classes consist of several internal properties, as described in the following table:

| Internal property | Description |
| ----------------- | ----------- |
| \[\[*Name*\]\] | The unqualified name of the class. |
| \[\[*Visibility*\]\] | The [visibility](visibility.md) of the class. |
| \[\[*ParentDefinition*\]\] | The parent definition of the class. |
| \[\[*BaseClass*\]\] | The base class. It is undefined for the `Object` class. |
| \[\[*Implements*\]\] | Set of interfaces the class implements. |
| \[\[*IsFinal*\]\] | Indicates whether the class is final or not. |
| \[\[*IsStatic*\]\] | Indicates whether the class is static or not. |
| \[\[*IsAbstract*\]\] | Indicates whether the class is abstract or not. |
| \[\[*AllowLiteral*\]\] | Indicates whether the class may be initialized through an object initializer or not; that is, if it has the `[Literal]` meta-data. |
| \[\[*TypeParameters*\]\] | The type parameter sequence of the class. |
| \[\[*StaticProperties*\]\] | Static properties of the class. |
| \[\[*Constructor*\]\] | The constructor function of the class. |
| \[\[*Prototype*\]\] | Properties of the class prototype as a dictionary from string to symbol. |
| \[\[*Proxies*\]\] | Proxies defined by the class as a dictionary from string to function symbol. |
| \[\[*ListOfToProxies*\]\] | `to` proxies defined by the class as function symbols. |
| \[\[*PlainMetadata*\]\] | Plain meta-data attached to the class. |

## Inheritance

Instance properties must not be duplicate in the class inheritance.

```
class C1 {
    var x
}
class C2 extends C1 {
    var x // VerifyError
}
```

Overriding methods are allowed to be duplicate in the class inheritance.

```
class C1 {
    function f() {}
    function get x() 10
}
class C2 extends C1 {
    override function f() {} // OK
    function get x() 10 // VerifyError (must override)
}
```

## Base class

By default, all classes, excluding `Object`, have `Object` as their base class.

It is a verify error if:

* a class attempts to extend itself;
* a class attempts to extend a subclass of itself.

## Literal classes

Classes containing the `[Literal]` meta-data have the following restrictions:

* They are implicitly marked final.
* They must extend the `Object` class.

```
[Literal]
final class C {
    var x
}

const o: C = { x: 10 }
```

## Meta data

A class may contain zero or more plain meta-data:

```
[N1(n2)]
class C {}
```