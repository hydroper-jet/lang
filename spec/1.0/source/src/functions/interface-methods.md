# Interface methods

An interface method is an instance method belonging to an interface.

```
interface I {
    function f(): void
}
```

## Optional interface method

A function that is an interface method may be optional by specifying its body.

```
interface I {
    function f(): void {}
}
```

## Interface method forms

An interface method is allowed to be:

* a regular method;
* a getter;
* a setter.