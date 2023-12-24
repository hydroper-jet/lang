# Variables

A variable consists of a name, a static type, a [visibility](visibility.md), and miscellaneous. A variable may be read-only or constant by using the `const` keyword.

```
var x: Number;
const y: Number;
```

## Initializer

Variables are lazily initialized with the exception of variables whose static type has a *default* value, such as a [primitive type](types.md#primitive-types) or the `Optional` type.

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

A variable may contain zero or more arbitrary plain meta-data.

```
[[N1(n2)]]
const x: T;
```

## JetXML variables

A JetXML variable is an instance variable belonging to a JetXML file.

* Assigning value to a JetXML variable causes the following assigment to the instance object:

```
instance.jetxmlStatus = "outdated";
```

## Optional variables

Optional variables do not need to be specified when using an object initializer:

```
[Literal]
public class C {
    public const x: Optional.<Number>;
}
const o: C = {};
```

A variable is *optional* when the variable's static type is the `Optional` type.

## Parent definition

When the parent definition of a variable is a package, the variable has a fully package qualified name.