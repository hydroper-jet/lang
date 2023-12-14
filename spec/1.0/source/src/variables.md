# Variables

A variable consists of a name, a static type and miscellaneous other symbols. A variable may be read-only or constant by using the `const` keyword.

```
var x: Number;
const y: Number;
```

## Initializer

Variables are lazily initialized with the exception of variables whose static type has a *default* value, such as a [primitive type](types.md#primitive-types) or the `Optional` type.

* It is a fatal exception if the value of a variable is accessed before initialized and the static type of that variable includes no default value.

```
public class C {
    public const x: Number
    public const y: RegExp
    public function C() {
        x // 0
        y // Fatal exception
    }
}
```

* It is a fatal exception if a constant variable is assigned more than once.
* A constant variable that is not an instance variable must contain an initializer.
* A constant variable that is not an instance variable must not be assigned by an assignment expression.
* A constant variable that is an instance variable may be assigned in the constructor body.
* A constant variable that is an instance variable may not be assigned outside the constructor body.

*Constant initializer*: A variable may consist of a constant initializer. A constant initializer consists of a constant expression.