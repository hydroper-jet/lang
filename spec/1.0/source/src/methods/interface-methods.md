# Interface Methods

An interface method is an instance method belonging to an **interface**.

```
interface I {
    function f();
}
```

## Implementation

Implementors of an interface must implement those interface methods that are not optional. The method visibility must match **public** if the implementor is at a **package**, otherwise the visibility must match **internal**.

```
interface I1 {
    function f() {}
}
class C1 implements I1 {
    function f() {}
}
```

## Optional Interface Method

An interface method is optional when its body is explicitly specified.

```
interface I1 {
    function f() {}
}
```

## Interface Method Forms

An interface method is allowed to be a **method**, a **getter**, or a **setter**.