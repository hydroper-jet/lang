# Variables

A variable is a fixed slot storing a value.

```
var x: Number;
const y: Number;
```

A variable consists of the following internal properties:

| Internal property | Description |
| ----------------- | ----------- |
| \[\[*Name*\]\] | The unqualified name of the variable. |
| \[\[*Type*\]\] | The type of the variable. |
| \[\[*Visibility*\]\] | The [visibility](visibility.md) of the variable. |
| \[\[*ParentDefinition*\]\] | The parent definition of the variable. |
| \[\[*ReadOnly*\]\] | Indicates whether the variable is read-only or not. |
| \[\[*ConstantInitializer*\]\] | Constant initializer of the variable as a constant value. |
| \[\[*PlainMetadata*\]\] | Plain meta-data attached to the variable. |

## Read-only variables

A variable may be read-only by using the `const` keyword instead of the `var` keyword when defining it.

Read-only variables are referred to as *constants*.

## Initializer

Variables are lazily initialized with the exception of variables whose static type has a *default* value, such as a [primitive type](types.md#primitive-types) or a nullable type.

* It is a `ReferenceError` if the value of a variable is accessed before initialized and the static type of that variable includes no default value.

```
class C {
    const x: Number
    const y: RegExp
    function C() {
        x // 0
        y // ReferenceError
    }
}
```

* It is a `VerifyError` if a constant is assigned more than once.
* A non-instance constant must contain an initializer.
* A non-instance constant must not be assigned by an assignment expression.
* An instance constant may be assigned in the constructor body.
* An instance constant may not be assigned outside the constructor body.

```
const x // VerifyError

const x = 10
x++ // VerifyError

class C {
    const x
    function C(x) {
        this.x = x
    }
    function f() {
        x = 10 // VerifyError
    }
}
```

*Constant initializer*: A variable may consist of a constant initializer. A constant initializer consists of a constant expression.

```
var x = 0
```

## Meta data

A variable may contain zero or more plain meta-data.

```
[[N1(n2)]]
const x: T;
```

## Optional variables

Optional variables do not need to be specified when using an object initializer.

```
[Literal]
public class C {
    public const x: Number?;
}
const o: C = {};
```

A variable is *optional* when the variable's static type contains `null` or when the variable's static type contains `undefined`.