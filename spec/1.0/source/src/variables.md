# Variables

A variable consists of a name, a static type and miscellaneous other symbols. A variable may be read-only by using the `const` keyword.

```
var x: Number;
const y: Number;
```

## Initializer

Variables are lazily initialized with the exception of variables whose static type has a *default* value, such as a [primitive type](types.md#primitive-types) or the `Optional` type.

* It is a fatal exception if the value of a variable is accessed before initialized and the static type of that variable includes no default value.

```
const x: Number
x // 0

const y: RegExp
y // Fatal exception
```

*Constant initializer*: A variable may consist of a constant initializer. A constant initializer is an expression that can be evaluated at compile-time.