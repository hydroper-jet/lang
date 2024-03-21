# Variables

A variable represents a fixed slot storing a value.

```
var x: Number

const y: Number
```

A variable is designed read-only through using the **const** keyword instead of the **var** keyword when defining the variable.

Read-only variables are called **constants**.

## Internal Properties

| Property | Description |
| -------- | ----------- |
| \[\[*Name*\]\] | The non qualified name of the variable. |
| \[\[*Type*\]\] | The type of the variable. |
| \[\[*Visibility*\]\] | The [visibility](#sec-visibility) of the variable. |
| \[\[*Parent*\]\] | The parent definition of the variable. |
| \[\[*ReadOnly*\]\] | Indicates whether the variable is read-only or not. |
| \[\[*ConstantInitializer*\]\] | Constant initializer of the variable as a constant value. |
| \[\[*Metadata*\]\] | Meta-data attached to the variable. |

## Initializer

Variables are **lazily** initialized except those whose static type defines a *default* value, such as one of the primitive types. **Lazily** initialized variables are initialized upon the first access.

A variable may consist of a **constant initializer**. A constant initializer consists of a constant expression.

```
var x = 0
```

**Restrictions**

During runtime it is a **ReferenceError** if the value of a variable is accessed before initialized and the static type of that variable includes no default value.

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

During runtime it is a **VerifyError** if a constant is assigned more than once.

```
const x = 0
x++ // ERROR
```

At compile-time a non instance constant must contain an initializer.

```
const x // ERROR

class C1 { const x } // OK
```

At compile-time a non instance constant must not be assigned more than once.

```
const x = 0
x++ // ERROR
```

At compile-time an instance constant may be assigned in the constructor body.

```
class C1 {
    const x
    function C1() { x = 10 }
}
```

At compile-time an instance constant may not be assigned outside the constructor body.

```
const x // VerifyError

const x = 10
x++ // VerifyError

class C {
    const x
    function C(x) { this.x = x }
    function f() { x = 10 } // VerifyError
}
```

## Meta Data

A variable may contain zero or more meta-data.

```
[N1(n2)]
const x
```

## Optional Variables

**Optional** variables do not need to be specified when using an object initializer to construct a class.

```
[Literal]
class C1 { const x: Number? }

const o: C1 = {}
```

A variable is **optional** when its static type includes **null** or when its static type includes **undefined**.