# Interface methods

An interface method is an instance method belonging to an interface.

```
interface I {
    function f(): void
}
```

## Implementation

Implementors of an interface must implement non optional interface methods.

```
interface I {
    function f() {}
}
class C implements I {
    function f() {}
}
```

## Optional interface method

A function that is an interface method may be optional by specifying its body.

```
interface I {
    function f() {}
}
```

## Interface method forms

An interface method is allowed to be:

* A regular method
* A getter
* A setter