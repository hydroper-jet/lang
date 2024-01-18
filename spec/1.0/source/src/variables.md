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

## Initializer

Variables are lazily initialized with the exception of variables whose static type has a *default* value, such as a [primitive type](types.md#primitive-types) or a nullable type.

* It is a `ReferenceError` if the value of a variable is accessed before initialized and the static type of that variable includes no default value.

```
public class C {
    public const x: Number
    public const y: RegExp
    public function C() {
        x // 0
        y // ReferenceError
    }
}
```

* It is a `VerifyError` if a constant variable is assigned more than once.
* A constant variable that is not an instance variable must contain an initializer.
* A constant variable that is not an instance variable must not be assigned by an assignment expression.
* A constant variable that is an instance variable may be assigned in the constructor body.
* A constant variable that is an instance variable may not be assigned outside the constructor body.

*Constant initializer*: A variable may consist of a constant initializer. A constant initializer consists of a constant expression.

## Meta data

A variable may contain zero or more plain meta-data.

```
[[N1(n2)]]
const x: T;
```

## Optional variables

Optional variables do not need to be specified when using an object initializer:

```
[Literal]
public class C {
    public const x: Number?;
}
const o: C = {};
```

A variable is *optional* when the variable's static type is a nullable type or when the variable's static type contains `undefined`.

## Parent definition

When the parent definition of a variable is a package, the variable has a fully package qualified name.