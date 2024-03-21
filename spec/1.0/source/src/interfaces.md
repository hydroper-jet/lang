# Interfaces

An interface as denoted by the **interface** keyword represents an abstract object type. An interface is accessed as a **Class** object during runtime.

## Internal Properties

| Property | Description |
| -------- | ----------- |
| \[\[*Name*\]\] | The non qualified name of the interface. |
| \[\[*Visibility*\]\] | The [visibility](#sec-visibility) of the interface. |
| \[\[*Parent*\]\] | The parent definition of the interface. |
| \[\[*BaseInterfaces*\]\] | The base interfaces of the interface. |
| \[\[*TypeParameters*\]\] | The type parameter sequence of the interface. |
| \[\[*Prototype*\]\] | Properties of the interface prototype. |
| \[\[*Metadata*\]\] | Meta-data attached to the interface. |

## Inheritance

Methods must not be a duplicate in the interface inheritance.

```
interface I1 {
    function f() {}
}
interface I2 extends I1 {
    function f() {} // VerifyError
}
```

## Base Interfaces

It is a verify error if an interface attempts to extend itself.

It is a verify error if an interface attempts to extend a subtype of itself.

## Meta-data

An interface may contain zero or more meta-data.

```
[N1(n2)]
interface I1 {}
```