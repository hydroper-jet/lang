# Jet Language Design

Jet is a flexible, multi-paradigm, strongly typed scripting language. It compiles to the Jet Virtual Machine Bytecode and includes miscellaneous standard objects.

```
package spark.fusion {
    public use spark.core.*;
    public use spark.misc.*;
}
import spark.fusion.*;

public const xx = "xx";

public function xy(a: Number): Number (
    Math.sqrt(a)
);

var x = y; // Writable variable
const x = y; // Read-only variable
```

# File extension

The identifying file extensions for Jet programs are:

* `.jet`

# Properties

Property access operators are similiar to ECMAScript property operators.

Indexing by a number value is equivalent to using one of the proxies `getProperty`, `setProperty`, and `deleteProperty`.

# `in` operator

Unlike ECMAScript, the `in` operator is not property-tied: it always uses the `has` proxy.

The `in` operator does not consider the prototype inheritance model of ECMAScript.

# Package (platform)

A package manifest specifies dependencies from a single *platform*.

```json
{
    "id": "org.q.f",
    "platform": "http://ns.w3.org/web",
    "dependencies": {
        "goog.g": "1.0.0"
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

- `void`
- `Boolean`
- Function (`function(a: T): R`)
- `*` is the dynamic type to which all types convert from and to

Integer:

- `Byte`, `Short`, `Int`, `Long`, `BigInt`, `NativeInt`
- Unsigned: `UnsignedT` where `T` is an integer data type

IEEE 754 floating point:

- `Single`, `Number` (double-precision)

Unicode:

- `String`: Sequence of Scalar Values using an implementation-specific encoding
- `Char`: Unicode Scalar Value.

Compound:

- `[T1, T2, ...Tn]` (tuple)
- `T?` (unifies `T` and `null`)
- `Array.<T>` or `[T]`
  - A growable array.

# `T?`

A `T?` type allows assigning `null` or `T` to a variable and comparing it to `null` or `T` through `==`.

```
var o: T? = null;

// Asserts `o` is not `null` and calls `f`
o!.f();

// Optional chaining
o?.f();

// Nullish-coalescing
(o ?? new T()).action();
```

# Function exceptions

A function is allowed to throw errors normally as in ActionScript.

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
v.inexistent; // May throw a ReferenceError
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

Jet uses garbage collection for all types.

* `[object Object].clone()` — Throws a `TypeError` by default.
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

Jet supports flexible *simple* enums and *set* enums. A single enum member consists of a (*number*, *string*) group, which is defined in an `enum` definition either by specifying only one of (*number*, *string*), or by specifying both, or by omitting both and letting the compiler dedide the values.

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

# Inheritance

The language supports single-class inheritance as in ActionScript, featuring:

* `class C1 extends C0 {}`
* `super();`
* `super.x`
* `v is T`
* `v is not T`
* `v as T` — Optional conversion
* `C(v)` — Converts or throws `TypeError`

# Property accessibility

The accessibility of a property is either `public`, `private`, `internal`, or `protected`. 

* `public` is accessible from any program context.
* `private` is accessible from the enclosing class.
* `internal` is accessible from the enclosing package.
* `protected` ranges from the enclosing class to its subclasses.

# Meta data

Meta data can be attached to items. There are two categories of meta data: reserved meta data and plain meta data.

* Plain meta data is uninterpreted meta data placed inside a `[...]` notation.

## Plain meta data

* Plain meta data supports qualified names `q::N` that map to a equivalent string
* The entries are in the `x = "y"` pair form
* Keyless entries are either in the form `q::n`, `n` or `"n"` and map to a value string
* A value file is allowed by using an expression in the form `File("path/to/file")`
* Map values consisting of further key-value entries are allowed using the `Map(...)` group

```
[N1(x = "y", z, "w", File("myExtension.dll"))]
```

# Assertion

The language comes with built-in assertion facilities, which throw `AssertionError` errors when an assertion fails.

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
const listener = object.addEventListener(function(event: Event): void {
    /* Handle event */
});
listener.remove();
```

# Jet for XML

Jet for XML (J4X) provides XML support. It supports much of the legacy ECMAScript for XML standard, but in a different way. It supports property and query operators.

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

Jet supports proxies with the `proxy` attribute to indicate custom behavior. Miscellaneous proxies are supported, including `add()`, and other proxies. Here is one example:

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

Sources are simply recursively collected from specified directories and supplied to the compiler.