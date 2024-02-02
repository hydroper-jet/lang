# Instance methods

An instance method is a non static function directly enclosed by a `class`, `enum` or `interface` block.

```
class C {
    function f() {}
}
```

Instance methods are *bound* methods and produce the same `Function` object from an instance.

```
class C {
    function f() {}
}

const o = new C
trace(o.f == o.f)
```

## Abstract methods

An abstract method contains the `abstract` attribute.

* Abstract methods must not contain a body.
* Abstract methods must be overriden by subclasses of the enclosing class.

## Final methods

A final method contains the `final` attribute.

* Final methods must not be overriden by subclasses of the enclosing class.

## Overriding

An overriding method contains the `override` attribute.

```
class C1 {
    function f(): void {}
}
class C2 extends C1 {
    override function f(): void {}
}
```

A method must not be overriden if it is type parameterized or if the overriding method is type parameterized.

```
class C1 {
    function f.<T>(): void {}
}
class C2 extends C1 {
    override function f(): void {} // VerifyError
}

class C3 {
    function f(): void {}
}
class C4 extends C3 {
    override function f.<T>(): void {} // VerifyError
}
```

### Overriding signature

It is a verify error if the overriding signature is not compatible with the base class's method signature.
  * The overriding signature is compatible with the super signature if either:
    * it is equals the super signature, or
    * it introduces optional parameters and/or a rest parameter to the super signature and either the result type is equals to that of the super signature or the result type is a subtype of that of the super signature.

```
class C1 {
    function f(): * (undefined);
}
class C2 extends C1 {
    override function f(a: Number = 10): Number (a ** 2);
}
```

### Overriding symbol

It is allowed for an overriding method to override:

* A regular method
* A getter
* A setter