# JSQ

JSQ (JavaScript Quantum) is a flexible, multi-paradigm, strongly typed scripting language. JSQ compiles to the JSQ Virtual Machine Bytecode and includes miscellaneous standard objects.

```jsq
use ds.swing.*;
public use s = ds.swing;

public const staticVar = "static constant";

public function myFunction(a) a.sqrt();

// Define a function with the name "for"
public function escaped#for(): void {
    // "for" function
}

// Call a function with the name "for"
this.for(64); // 8

// Or
escaped#for(64);

var x = y; // Writable variable
const x = y; // Read-only variable
```

# Properties

Property access operators are similiar to ECMAScript property operators, with the exclusion of implicit conversion. Solely string and number types can be used to index.

# Package (dependency namespace)

A package manifest specifies dependencies by a *dependency namespace*. The namespaace of packages that do not belong to a namespace are denoted by `*`. The namespace "https://www.w3.org" is generally used for websites or web applications.

```json
{
    "id": "com.q.f",
    "registryNamespace": "https://www.w3.org",
    "dependencies": {
        "*": {
            "xml": "1.0.0",
        },
        "https://www.w3.org": {
            "goog.g": "1.0.0"
        }
    }
}
```

# Package (submodule)

Say a package manifest specifies the ID "com.q.f". The following is the submodule "com.q.f.qux.bar":

```jsq
// index.jsq
public module qux;

// qux.jsq
public module bar;

// qux/bar.jsq
public function functionInBar() {}
```

# `use` item

There are four forms of `use` items:

```jsq
use q.b;
use q.b.*;

// Alias
use b = q.b;

// Equivalent to:
// module File;
// use this.File.*;
use * from "./File";
```

# Types

General:

- `void` or `undefined` are the same
- `Boolean`
- `this` refers to the actual module or type in scope
- Function (`(a: T) => R`)
- `*` is the dynamic type to which all types convert from and to

Integer:

- `sbyte`, `short`, `int`, `long`, `bigint`, `nativeint`
- Unsigned: `byte`, `ushort`, `uint`, `ulong`, `nativeuint`

IEEE 754 floating point:

- `single`, `double`

Unicode:

- `String`: Sequence of Scalar Values encoded in UTF-8 form.
- `char`: Unicode Scalar Value.

Compound:

- `[T1, T2, ...Tn]` (tuple)
- `Opt.<T>` (unifies `T` and `undefined`)
- `Throws.<T, E1, ...EN>`
- `Array.<T>` or `[T]`
  - A growable array.

# Conditional expression

```jsq
const v = if (true) x else y;
```

# Error propagation operator

The postfix `?` operator is called *error propagation* operator. It returns from a function or `try` expression if the base is `undefined` or an exception, or otherwise lets zero or more postfix operators perform computation on the success value.

```jsq
o?
```

# `Opt`

The `Opt.<T>` type allows assigning `undefined` or `T` to a variable and comparing it to `undefined` or `T` through `==`.

```jsq
var o: Opt.<T> = undefined;

// Asserts `o` is not `undefined` and calls `f`
o!.f();

// Optional chaining
try o?.f();
```

# `Throws`

The `Throws.<T, E1, ...En>` type holds either a success value or an exception value: `T` indicates the type of the success value, and all other remaining types are the possible exception types.

A function that returns `Throws` must return `T` and may throw any of the specified exception types through the `throw` statement.

```jsq
function f(): Throws.<T, TypeError, RangeError> {
    throw new TypeError("Type error");
}
try {
    f();
} catch (error: TypeError) {
    // Type error
}

// Succeed or throw
f()?;

// Optional chaining
try f()?.x;

// Non error assertion
f()!.x;
```

# Literal class

Literal classes can be initialized through the object initializer.

```jsq
[Literal]
class Options {
    public const x: double;
}
const options: Options = { x: 10 };
```

# Reflection and dynamic typing

The language includes runtime type reflection and dynamic typing.

```jsq
const v: * = v;
v.inexistent; // May throw a fatal exception
```

# Name resolution

All items are categorized in the name resolution and some expressions
such as member expressions can be ambiguously resolved.

For example:

- types;
- modules;
- properties;
- functions.

# Module paths

```jsq
use package.x;
use super.y;
// use this.z;
```

# Virtual properties

Virtual properties are also known as getters and setters. `get` and `set` are context keywords used for defining virtual properties.

```jsq
class C {
    function get property(): long (10);
    function set property(value) {}
}
```

# Generic interfaces

When implementing generic interfaces more than once, JSQ accepts multimethods, thus solving name conflict.

# Memory management

JSQ uses garbage collection for all types.

* Use the `[Reference]` meta data to indicate a type is copied and cloned by reference, implementing `Copy` and `Clone`. This meta data also implements `Equals` and `Hash`, comparing and hashing the references.
* Use the `[Value]` meta data to indicate a type is copied and cloned by value, implementing `Copy` and `Clone`.
* Types that do not contain or inherit a `[Ref]` or `[Value]` meta data are not copied implicitly.

```jsq
[Reference]
class C0 {}
[Value]
class C1 {}
```

The type `Shared` can be used for sharing certain non reference types:

```jsq
const m: Shared.<Map.<double, double>> = new Shared(new Map());

// `Shared.<T>` implements `Delegate.<T>`, delegating inexistent accesses
// to the base type.
m[64];
```

# Methods

```jsq
public class C {
    // Constructor
    public function C() {
        trace(this);
    }

    // Static method
    public static function f() {}
}
```

# Optional parameters

Optional parameters can be omitted in function calls.

# Rest parameters

A rest parameter allows specifying an optional trailing sequence of arguments at a function call.

# Multimethods

Methods that contain overloads are multimethods. Method overloads support multiple call signatures.

# Serialization

The language comes with built-in forms of serialization. Classes can derive `Serializable` in order to be serialized and deserialized into a format; the `Serializable` attribute can additionally be used to customize the serialization behavior.

# Enums

JSQ supports flexible *simple* enums and *set* enums. A single enum member consists of a (*number*, *string*) group, which is defined in an `enum` definition either by specifying only one of (*number*, *string*), or by specifying both, or by omitting both and letting the compiler dedide the values.

The following program demonstrates simple enums:

```jsq
public enum Kind {
    const GOLDEN_EGG;
    const A_BBC_TURKEY = "aBBCTurkey";
    const SPHERE = 10;
    const CUBOID = ["cuboid", 5];
}

// `Kind.GOLDEN_EGG` omitted its string in the enum, so its string was
// deduced as "goldenEgg".
const k: Kind = "goldenEgg";

// "goldenEgg" is the first member, so its number was deduced as zero (0).
assert(Kind.GOLDEN_EGG.valueOf() == 0);

assert(Kind.GOLDEN_EGG.toString() == "goldenEgg");
```

Set enums add support for efficient combinatory members, using bitwise values internally. The following program demonstrates them:

```jsq
[Set]
public enum Flags {
    const F0;
    const F1;
    const F2 = 32;
}

assert(Flags.F0.valueOf() == 1);

// Array and object initializers are valid member literals
const f: Flags = { f0: true };
const f: Flags = [ "f0" ];

// Support methods included
f.toggle("f0").filter("f0")
    .include("f0").exclude("f0")
    .has("f0");
```

# Embed

`embed` is a context keyword as in `embed "./f.txt"`.

# Inheritance

The language supports single-class inheritance as in ActionScript, featuring:

* `class C1 extends C0 {}`
* `super();`
* `super.x`
* `v is T`
* `v is not T`
* `v as T` — Optional conversion
* `C(v)` — Conversion or fatal exception

# Visibility

The visibility of item is a visibility ranging from a module to all of its descendants. The `public` modifier indicates that the item is visible to all programs, while the `internal` or `private` modifiers indicate that the item is visible to the containing module and all of its descendants.

The `[Public("q")]` meta data is used to specify the module to which an item is visible. For example, the following indicates that the function `f` is available to `package` and all of its descendants:

```jsq
[Public("package")]
function f() {}
```

# Meta data

Meta data can be attached to items. There are two categories of meta data: reserved meta data and user meta data.

# Conditional compilation

```jsq
[Config(...)]
item;
```

# Fatal exceptions

Fatal exceptions are exceptions that may be thrown at runtime and cannot be caught by the user.

```jsq
fatalError();
```

# Assertion

The language comes with built-in assertion facilities, which throw fatal exceptions when an assertion fails.

# Test

Test functions can be defined with the `[Test]` meta data. Such functions are invoked by the unit testing tool. A test fails when a fatal exception is thrown.

```jsq
[Test]
function testSomething() {
    // Test it
}
```