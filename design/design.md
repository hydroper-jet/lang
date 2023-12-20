# JetWork Language Design

JetWork is a flexible, multi-paradigm, strongly typed scripting language. It compiles to the JetWork Virtual Machine Bytecode and includes miscellaneous standard objects.

```
package sparkFusion {
    public use spark.core.*;
}
import sparkFusion.*;

public const xx = "xx";

public function xy(a: Number): Number (
    Math.sqrt(a)
);

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

Indexing by a number type is equivalent to using one of the proxies `getProperty`, `setProperty`, and `deleteProperty`.

# `in` operator

Unlike ECMAScript, the `in` operator is not property-tied: it always uses the `has` proxy.

The `in` operator does not consider the prototype inheritance model of ECMAScript.

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

# Packages

Packages are defined the same way as in ActionScript 3.

```
// Top-level package
package {}

// "org.n1" package
package org.n1 {}
```

# Types

General:

- `void` or `undefined` are the same
- `Boolean`
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

// Nullish-coalescing
(o ?? new T()).action();
```

# Function exceptions

A function may throw exceptions, specifying each exception type in the `throws` clause. Such exceptions are also referred to as *checked* exceptions.

```
function f(): T throws TypeError, RangeError {
    throw new TypeError("Type error");
}
try {
    f();
} catch (error: TypeError) {
    // Type error
}

// Succeed or throw
f()?

// Optional chaining
try f()?.x

// Non error assertion
f()!.x
```

Fatal exceptions are described later.

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

# Name resolution and packages

* Fully-qualified package names shadow all variable names.
* Packages must be imported through `use` or `import` before they are used in code.
* Item or wildcard as an `use` or `import` item never imports a subpackage; wildcard may, however, be used to alias a package, as in `import n1 = n2.*;`.

# Virtual properties

Virtual properties are also known as getters and setters. `get` and `set` are context keywords used for defining virtual properties.

```
class C {
    function get property(): Long (10);
    function set property(value) {}
}
```

# Memory management

JetWork uses garbage collection for all types.

* `[object Object].clone()` — Throws a fatal exception by default.
* `[object Object].equals()` — By default, compares object equality by reference.
* `[object Object].hash()` — Returns the hash code of an object.

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

"f0" in f
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

# Property accessibility

The accessibility of a property is either `public`, `private`, `internal`, or `protected`. 

* `public` is accessible from any program context.
* `private` is accessible from the enclosing class.
* `internal` is accessible from the enclosing package.
* `protected` ranges from the enclosing class to its subclasses.

# Meta data

Meta data can be attached to items. There are three categories of meta data: reserved meta data, user meta data and plain meta data.

* Plain meta data is uninterpreted meta data placed inside a `[Metadata()]` meta data.
* User meta data has the same semantics as per the reference in VioletScript.

## Plain meta data

* Plain meta data supports qualified names `q::N` that map to a equivalent string
* The entries are in the `x = "y"` pair form
* Keyless entries are either in the form `q::n`, `n` or `"n"` and map to a value string
* A value file is allowed by using an expression in the form `File("path/to/file")`

```
[Metadata(N1(x = "y", z, "w", File("myExtension.dll")))]
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
function testSomething(): void {
    // Test it
}
```

# Abstract classes and methods

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

# J4X

J4X stands for JetWork for XML and provides XML support. It supports much of the legacy ECMAScript for XML standard, but in a different way. It supports property and query operators.

J4X introduces the following syntax:

* Punctuators
  * `@`
  * `::`
  * `..`
* XML markup
* XML initializer
* XML list initializer
* `default xml namespace = ns;`

# Proxy

JetWork supports proxies with the `proxy` attribute to indicate custom behavior. Miscellaneous proxies are supported, including `add()`, and other proxies. Here is one example:

```
public class ProxyExample {
    proxy function getProperty(index: Number): Number (NaN);
}
```

# Variable shadowing

Variables in an activation shadow other variables in the same frame.

```
const x: Number = Infinity;
const x: String = "";
```

# Overriding a method

* Overriding a method allows for introduction of new optional parameters and/or rest parameter. This is the case for standard classes like `Number` that include a `toString()` method that takes an optional radix parameter.

# Formatting a string

The `String` data type supports an `apply()` method for replacing simple parameters:

```
"$a".apply({ a: "10" })
"$1".apply({ [1]: "10" })
```

# Object initializer

The object initializer is allowed to initialize `Map` instances:

```
type M = Map.<String, Number>;
const m: M = { x: 10 };
```

# Destructuring

The language supports simple destructuring in variable bindings and assignments

* Array destructuring
* Record destructuring

Each destructuring allow for a non-erroneous assertion operator.

# Source inclusion

Sources are simply recursively collected from specified directories and supplied to the compiler:

* Not only regular file extensions are included, but also JetXML file extensions.