# Virtual properties

A virtual property consists of a name, a static type, a possibly omitted getter, a possibly omitted setter, a [visibility](visibility.md), and miscellaneous.

* A virtual property is read-only if it has only a getter.
* A virtual property is write-only if it has only a setter.
* Getter and setter are functions that belong to the virtual property.

```
function get x(): T (v);
function set x(v: T): void {}
```

## Parent definition

When the parent definition of a virtual property is a package, the virtual property has a fully package qualified name.