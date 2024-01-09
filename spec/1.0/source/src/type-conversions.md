# Type conversions

## Implicit constant conversions

The language performs implicit compile-time type conversions from a constant to a constant of another type. They are described by the following table:

| Relationship | Description |
| ------------ | ----------- |
| `undefined` to `*`, `Optional`, Set `enum` | For Set `enum`, results into an empty set. For other types, results into `undefined`. |
| `N` constant to `*`, `Object` | Results into a `N` number constant of a covariant type. |
| `NF1` constant to `NF2` or `Optional.<NF2>` | Results into a floating point constant with the same numeric value, where `NF2` is a floating point type whose range is wider than that of `NF1`. |
| `NI1` constant to `NI2` or `Optional.<NI2>` | Results into an integer constant with the same numeric value, where `NI2` is a integer type whose range is wider than that of `NI1`. |
| `NI` constant to `Number` or `Optional.<Number>` | Results into a number constant with the same numeric value, where `NI` is one of \{ `Byte`, `UnsignedByte`, `Short`, `UnsignedShort`, `Int`, `UnsignedInt` \}. |
| `NaN` constant to `NI` or `Optional.<NI>` | Results into a zero (0) constant where `NI` is an integer type. |
| `-Infinity` constant to `NI` or `Optional.<NI>` | Results into the minimum integer constant where `NI` is an integer type but not `BigInt`. |
| `+Infinity` constant to `NI` or `Optional.<NI>` | Results into the maximum integer constant where `NI` is an integer type but not `BigInt`. |
| From non `Optional` constant to `Optional.<T>` | Results into the same constant but wrapped in the `Optional` type. |

## Implicit conversions

An implicit conversion is followed by an attempt of an implicit constant conversion. Implicit conversions are described by the following table:

| Relationship | Description |
| ------------ | ----------- |
| From `*` | Converts to type from the `*` type or a conversion failure if the conversion fails at runtime. |
| To `*` | Converts to the `*` type. |
| `N1` to `N2` | Results into a number constant with the same numeric value, where `N2` is a number type whose range is wider than that of `N1`. |
| To covariant type | Results into a reference of a covariant type. |
| From `T` to `Optional.<T>` | Results into a `Optional.<T>` value containing a `T` value. |
| From `ìnterface` to `Object` | Results into an `Object` reference. |

## Explicit conversions

An explicit conversion is followed by an attempt of an implicit conversion. Explicit conversions are described by the following table:

| Relationship | Description |
| ------------ | ----------- |
| To `T` through `proxy::to` | Converts to type `T` by invoking the `to` proxy if present. |
| To `T` through `proxy::toOptional` | Converts to type `T` by invoking the `toOptional` proxy if present. It is a conversion failure if `toOptional` returns undefined. |
| To contravariant type | Results into a reference of a contravariant type or a conversion failure if destination is incompatible. |
| `Array` to contravariant `Array` | Constructs a new array filtering out covariant elements. |
| `Array` to covariant `Array` | Constructs a new array of a covariant type. |
| Between number types | Converts from a number type to another number type. The result is implementation-defined. |
| From `String` to `enum` | Converts to `enum` by identifying a member by its string component. It is a failure if the member is not found. |
| From number to `enum` | For a non Set `enum`, converts to the `enum` by identifying a member by its number component. It is a failure if the member is not found. For a Set `enum`, converts to the `enum` by filtering out unrecognized bits. |
