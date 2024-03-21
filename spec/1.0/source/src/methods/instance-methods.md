# Instance Methods

An instance method is a non static method directly enclosed in a **class**, **enum**, or **interface** block.

```
class C1 {
    function f() {}
}
```

Instance methods are **bound methods**; that is, they always produce the same **Function** object when accessed from an instance with the **this** literal bound to the instance object.

```
class C1 {
    function f(): C1 (this)
}

const o = new C1
trace(o.f == o.f)

const { f } = o
trace(f() == o)
```

## Abstract Methods

An abstract method contains the **abstract** attribute.

**Restrictions**

Abstract methods must not contain a body.

Abstract methods must be overriden by subclasses of the enclosing class.

## Final Methods

A final method contains the **final** attribute.

**Restrictions**

Final methods must not be overriden by subclasses of the enclosing class.

## Overriding

An overriding method contains the **override** attribute.

```
class C1 {
    function f() {}
}
class C2 extends C1 {
    override function f() {}
}
```

### Overriding Signature

The overriding method contains an **overriding signature**. The method of the base class being overriden contains a signature referred to as **base signature**.

It is a verify error if the overriding signature is not compatible with the base signature.

The overriding signature is compatible with the base signature if either:

* It is equals the base signature
* It introduces optional parameters and/or a rest parameter to the base signature and either the result type is equals to that of the base signature or the result type is a subtype of that of the base signature.

```
class C1 {
    function f(): * (10);
}
class C2 extends C1 {
    override function f(a: Number = 10): Number (a ** 2);
}
```

### Overriding Symbol

It is allowed for an overriding method to override either a **method**, a **getter**, or a **setter**. The kind of base class method being overriden must be looked up according to the kind of the overriding method.