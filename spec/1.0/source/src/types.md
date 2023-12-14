# Types

## Primitive types

JetWork considers the following to be primitive types:

* `undefined` type, or the equivalent `void`
* Number types
* `Boolean` type
* `String` type
* `Char` type
* `CharIndex` type

## Default value

The default value of a type is determined as follows:

* If the type is `undefined`, return `undefined`.
* If the type is `Optional`, return `undefined`.
* If the type is a number type, return zero.
* If the type is `Boolean`, return false.
* If the type is `String`, return the empty string.
* If the type is `Char`, return U+0000.
* If the type is `CharIndex`, return (*empty string*, *zero*).

## Any type

The `*` type contains values from all other types.

## Undefined type

The `undefined` or `void` type consists of the `undefined` constant.

## Never type

The `never` type contains no value.

## Number types

*IEEE 754 floating point*:

* `Number` — Double-precision floating point
* `Single` — Single-precision floating point

*Signed integer*:

* `BigInt` — Arbitrary range integer
* `Long` — Ranges from -2<sup>64 - 1</sup> to 2<sup>64 - 1</sup> - 1 (64-bit)
* `Int` — Ranges from -2<sup>32 - 1</sup> to 2<sup>32 - 1</sup> - 1 (32-bit)
* `Short` — Ranges from -2<sup>16 - 1</sup> to 2<sup>16 - 1</sup> - 1 (16-bit)
* `Byte` — Ranges from -2<sup>8 - 1</sup> to 2<sup>8 - 1</sup> - 1 (8-bit)

*Unsigned integer*:

* `UnsignedLong` — Ranges from 0 to 2<sup>64</sup> - 1 (64-bit)
* `UnsignedInt` — Ranges from 0 to 2<sup>32</sup> - 1 (32-bit)
* `UnsignedShort` — Ranges from 0 to 2<sup>16</sup> - 1 (16-bit)
* `UnsignedByte` — Ranges from 0 to 2<sup>8</sup> - 1 (8-bit)

## Boolean type

The `Boolean` type consists of the values `false` and `true`.

## String type

The `String` type consists of a sequence of Unicode Scalar Values whose encoding is implementation-defined.

## Char type

The `Char` type is a Unicode Scalar Value.

## CharIndex type

The `CharIndex` type is a group (*string*, *index*) where *string* is a `String` and *index* is an `UnsignedInt` identifying a zero based index into *string*.

## Function types

Function types consist of zero or more parameters and a return type annotation. Function types appear in the forms:

```
(a: T) => E
(a?: T) => E
(...a: [T]) => E
```

* Function types inherit from the `Function` class.
* Each parameter is either a required, optional or rest parameter.
* The allowed parameter list is a list of zero or more required parameters followed by zero or more optional parameters followed by an optional rest parameter.
* The rest parameter must appear at most once.
* The rest parameter must be of type `Array`.
* A trailing `throws` clause may be used to wrap `E` into a `Result` type with a list of exception types, as in `() => void throws SyntaxError, RangeError`.

## Tuple types

Tuple types are in the form `[T1, T2, ...TN]`.

## Optional type

The `Optional.<T>` type is an union of `undefined` and `T`. `Optional.<T>` may be expressed as `Optional.<T>`, `T?`, or `?T`.

## Result type

The `Result.<T, E1, ...EN>` type is an union of `T` and one or more exception types.

## Array type

The `Array.<T>` type is a growable collection of `T` values. `Array` may be expressed as `Array.<T>` or `[T]`.