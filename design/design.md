# JetWork Language Design

JetWork is a flexible, multi-paradigm, strongly typed scripting language. It compiles to the JetWork Virtual Machine Bytecode and includes miscellaneous standard objects.

```
use spark.*;
public use s = spark;

public const xx = "xx";

public function xy(a: Number) {
    return Math.sqrt(a);
}

var x = y; // Writable variable
const x = y; // Read-only variable
```

# File extension

The identifying file extensions for Jetwork programs are:

* `.jet`
* `.jetwork`
* `.jetxml` (JetXML class)

# Properties

Property access operators are similiar to ECMAScript property operators, with the exclusion of implicit conversion. Solely string and number types can be used to index.

Indexing by a number type is equivalent to using one of the interfaces `jetwork.operators.Get`, `jetwork.operators.Set`, and `jetwork.operators.Delete`.

Unlike ECMAScript, the `in` operator is not property-tied: it always uses the `jetwork.operators.Has` interface.

# Package (registry namespace)

A package manifest specifies dependencies by a *registry namespace*. Packages that do not specify a registry namespace belong to the `*` registry namespace. The namespace "http://www.w3.org/web" is generally used for websites or web applications.

```json
{
    "id": "org.q.f",
    "registryNamespace": "http://www.w3.org/web",
    "dependencies": {
        "*": {
            "xml": "1.0.0",
        },
        "http://www.w3.org/web": {
            "goog.g": "1.0.0"
        }
    }
}
```

# Package (submodule)

Say a package manifest specifies the ID "com.q.f". The following is the submodule "com.q.f.qux.bar":

```
// index.jet
public module qux;

// qux.jet
public module bar;

// qux/bar.jet
public function functionInBar() {}
```

# `use` item

There are four forms of `use` items:

```
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

- `Byte`, `Short`, `Int`, `Long`, `BigInt`, `NativeInt`
- Unsigned: `UnsignedT` where `T` is an integer data type

IEEE 754 floating point:

- `Single`, `Number` (double-precision)

Unicode:

- `String`: Sequence of Scalar Values using an implementation-specific encoding.
- `CharIndex`: Represents a Scalar Value index into a string.
- `Char`: Unicode Scalar Value.

Compound:

- `[T1, T2, ...Tn]` (tuple)
- `Optional.<T>` (unifies `T` and `undefined`)
- `Result.<T, E1, ...EN>`
- `Array.<T>` or `[T]`
  - A growable array.

# Conditional expression

```
const v = if (true) x else y;
```

# Error propagation operator

The postfix `?` operator is called *error propagation* operator. It returns from a function or `try` expression if the base is `undefined` or an exception, or otherwise lets zero or more postfix operators perform computation on the success value.

```
o?
```

# `Optional.<T>`

The `Optional.<T>` type (or `T?`) allows assigning `undefined` or `T` to a variable and comparing it to `undefined` or `T` through `==`.

```
var o: T? = undefined;

// Asserts `o` is not `undefined` and calls `f`
o!.f();

// Optional chaining
try o?.f();
```

# `Result`

The `Result.<T, E1, ...En>` type holds either a success value or an exception value: `T` indicates the type of the success value, and all other remaining types are the possible exception types.

A function that returns `Result` must return `T` and may throw any of the specified exception types through the `throw` statement.

```
function f(): Result.<T, TypeError, RangeError> {
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

The language supports a `throws` clause in function signatures, which wraps the return type into `Result`:

```
function f(): T throws TypeError, RangeError {}
```

# Literal class

Literal classes can be initialized through the object initializer.

```
[Literal]
class Options {
    public const x: Number;
}
const options: Options = { x: 10 };
```

# Reflection and dynamic typing

The language includes runtime type reflection and dynamic typing.

```
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

```
use package.x;
use super.y;
// use this.z;
```

# Virtual properties

Virtual properties are also known as getters and setters. `get` and `set` are context keywords used for defining virtual properties.

```
class C {
    function get property(): Long (10);
    function set property(value) {}
}
```

# Generic interfaces

When implementing generic interfaces more than once, JetWork accepts multimethods, thus solving name conflict.

# Memory management

JetWork uses garbage collection for all types.

* Use the `[Reference]` meta data to indicate a type is copied, cloned and compared by reference, automatically implementing `Copy`, `Clone`, `Equals`, and `Hash`.
* Use the `[Value]` meta data to indicate a type is copied and cloned by value, automatically implementing `Copy` and `Clone`.
* Types that do not contain or inherit a `[Reference]` or `[Value]` meta data are not copied implicitly.

```
[Reference]
class C0 {}
[Value]
class C1 {}
```

The type `Shared` can be used for sharing certain non reference types:

```
const m: Shared.<Map.<Number, Number>> = new Shared(new Map());

// `Shared.<T>` implements `Delegate.<T>`, delegating inexistent accesses
// to the base type.
const v = m[k];
```

# Methods

```
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

# Interface derivation

Native interfaces such as `Hash`, `Clone` and `Serializable` can be implemented automatically through the `Derive` meta data.

```
[Derive(Serializable)]
public class C {}
```

# Serialization

The language comes with built-in forms of serialization. Classes can derive `Serializable` in order to be serialized and deserialized into a format; the `Serializable` attribute can additionally be used to customize the serialization behavior.

# Enums

JetWork supports flexible *simple* enums and *set* enums. A single enum member consists of a (*number*, *string*) group, which is defined in an `enum` definition either by specifying only one of (*number*, *string*), or by specifying both, or by omitting both and letting the compiler dedide the values.

The following program demonstrates simple enums:

```
public enum Kind {
    const GOLDEN_EGG;
    const A_BBQ_TURKEY = "aBBQTurkey";
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

Set enums add support for efficient combinatory members, using internal bitwise values. The following program demonstrates them:

```
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

The visibility of item is either a visibility ranging from a module to all of its descendants, or a `protected` visibility that ranges from the enclosing class to its subclasses. The `public` modifier indicates that the item is visible to all programs, while the `internal` or `private` modifiers indicate that the item is visible to the containing module and all of its descendants.

The `[Public(q)]` meta data is used to specify the module to which an item is visible. For example, the following indicates that the function `f` is available to `package` (the top module of the package) and all of its descendants:

```
[Public(package)]
function f() {}
```

# Meta data

Meta data can be attached to items. There are two categories of meta data: reserved meta data and user meta data.

User meta data has the same semantics as per the reference in my previous language.

# Conditional compilation

```
[Config(...)]
item;
```

# Fatal exceptions

Fatal exceptions are exceptions that may be thrown at runtime and cannot be caught by the user.

```
fatalError();
fatalError("Error message");
```

# Assertion

The language comes with built-in assertion facilities, which throw fatal exceptions when an assertion fails.

# Test

Test functions can be defined with the `[Test]` meta data. Such functions are invoked by the unit testing tool. A test fails when a fatal exception is thrown.

```
[Test]
function testSomething() {
    // Test it
}
```

# Abstract clasases and methods

Abstract classes and abstract methods are supported. Abstract methods allow for exhaustive implementation of an operation across all subclasses of a class.

```
abstract class Co {
    protected abstract function doIt(): void;
}
```

# Function bodies

A function body is allowed to be a parenthesized expression in `function` definitions and `function` expressions.

```
(function(): Number (0));
```

# Events

The `EventEmitter` class is already part of the language.

```
const listener = onFu.addEventListener(event => {
    /* event: FuEvent */
});
listener.remove();
```

# Character indices

* *CharIndex* holds (*string*, *index*).
* The zero constant implicitly converts to *CharIndex*.