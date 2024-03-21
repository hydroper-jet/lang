# Classes

A class as denoted by the **class** keyword represents an object type. A class is accessed as a **Class** object during runtime.

## Internal properties

| Property | Description |
| -------- | ----------- |
| \[\[*Name*\]\] | The non qualified name of the class. |
| \[\[*Visibility*\]\] | The [visibility](#sec-visibility) of the class. |
| \[\[*Parent*\]\] | The parent definition of the class. |
| \[\[*BaseClass*\]\] | The base class. It is undefined for the **Object** class. |
| \[\[*Implements*\]\] | Set of interfaces the class implements. |
| \[\[*IsFinal*\]\] | Indicates whether the class is final or not. |
| \[\[*IsStatic*\]\] | Indicates whether the class is static or not. |
| \[\[*IsAbstract*\]\] | Indicates whether the class is abstract or not. |
| \[\[*AllowLiteral*\]\] | Indicates whether the class may be initialized through an object initializer or not; that is, whether it has the **\[Literal]** meta-data or not. |
| \[\[*TypeParameters*\]\] | The type parameter sequence of the class. |
| \[\[*StaticProperties*\]\] | Static properties of the class. |
| \[\[*Constructor*\]\] | The constructor method of the class. |
| \[\[*Prototype*\]\] | Properties of the class prototype. |
| \[\[*Proxies*\]\] | Object consisting of proxies defined by the class whose keys are strings and whose values are methods. |
| \[\[*ListOfToProxies*\]\] | **to** proxies defined by the class as methods. |
| \[\[*Metadata*\]\] | Meta-data attached to the class. |

## Inheritance

**Restrictions**

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

## Base Class

By default, all classes, excluding **Object**, have **Object** as their base class.

**Restrictions**

It is a verify error if a class attempts to extend itself.

It is a verify error if a class attempts to extend a subclass of itself.

## Literal Classes

**Restrictions**

Classes containing the **\[Literal\]** meta-data have the following restrictions:

* They are implicitly marked final.
* They must extend the **Object** class.

```
[Literal]
final class C1 {
    var x
}
const o: C1 = { x: 10 }
```

## Meta-data

A class may contain zero or more meta-data.

```
[N1(n2)]
class C1 {}
```