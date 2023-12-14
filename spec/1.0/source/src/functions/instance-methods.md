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

A overriding method contains the `override` attribute.

```
class C1 {
    function f(): void {}
}
class C2 {
    override function f(): void {}
}
```