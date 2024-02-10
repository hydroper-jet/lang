# Types

## Primitive types

Jet considers the following to be primitive types:

* `void` type
* Number types
* `Boolean` type
* `String` type
* `Char` type

## Default value

The default value of a type *t* is determined as follows:

* For *t* = `void`, return `undefined`.
* For *t* = `T?`, return `null`.
* For *t* = number type, return zero.
* For *t* = `Boolean`, return false.
* For *t* = `String`, return the empty string.
* For *t* = `Char`, return U+0000.
* For *t* = set enumeration, return an empty set.
* Return nothing.

## Auto boxing

The language performs auto boxing of primitive types. Primitive types are represented in a memory efficient way wherever available, including within an `Array`.

Primitive types are boxed without duplicating identity:

```
var x: Object = 10
var y: Object = 10

// true
x == y
```

## Any type

The `*` type contains values from all other types. The any type is the most ascending type of all other types.

## Void type

The `void` type consists of the `undefined` constant.

## Null type

The null type consists of the `null` value. Although the null type exists in the specification, no operation in the language can result in the null type.

## Number types

*IEEE 754 floating point*:

* `Number` — Double-precision floating point
* `Single` — Single-precision floating point

*Signed integer*:

* `BigInt` — Arbitrary range integer
* `Long` — Ranges from -2<sup>64 - 1</sup> to 2<sup>64 - 1</sup> - 1 (64-bit)

## Boolean type

The `Boolean` type consists of the values `false` and `true`.

## String type

The `String` type consists of a sequence of Unicode Scalar Values whose encoding is implementation-defined.

## Char type

The `Char` type is a Unicode Scalar Value.

## Function types

Function types consist of zero or more parameters and a return type annotation.

```
function(): E

// Required parameter
function(a: T): E

// Optional parameter
function(a?: T): E

// Rest parameter
function(...a: [T]): E
```

* Function types inherit from the `Function` class.
* Function types are final classes.
* Each parameter is either a required, optional or rest parameter.
* The allowed parameter list is a list of zero or more required parameters followed by zero or more optional parameters followed by an optional rest parameter.
* The rest parameter must appear at most once.
* The rest parameter must be of type `Array`.

## Tuple types

Tuple types are in the form `[T1, T2, ...TN]` and consist of a sequence of two or more element types.

* Tuple types inherit from the `Object` class.
* Tuple types are final classes.

## Nullable type

The `T?` type is an union of `null` and `T`.

## Array type

The `Array.<T>` type is a growable collection of `T` values. `Array` may be expressed as `Array.<T>` or `[T]`.

## Object type

The `Object` type is the super type of all other classes and all enums.

## ExpectType()

The internal *ExpectType*(*symbol*) function takes the following steps:

* If *symbol* is a *PackageReferenceValue*(*base*, *prop*)
  * Return *ExpectType*(*prop*)
* If *symbol* is a *ScopeReferenceValue*(*base*, *prop*)
  * Return *ExpectType*(*prop*)
* If *symbol* is a *TypeAsReferenceValue*(*type*)
  * Return *type*
* Throw type error if *symbol* is not a type.
* Return *symbol*.