# Instance methods

An instance method is a non static function directly enclosed by a `class`, `enum` or `interface` block.

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

### Overriding signature

It is a verify error if the overriding signature is not compatible with the super class's method signature.
  * The overriding signature is compatible with the super signature if either:
    * it is equals the super signature, or
    * it introduces optional parameters and/or a rest parameter to the super signature.

```
class C1 {
    function f(): void {}
}
class C2 extends C1 {
    override function f(a: Number = 10): void {}
}
```

### Overriding symbol

It is allowed for an overriding method to override:

* a regular method;
* a getter;
* a setter.