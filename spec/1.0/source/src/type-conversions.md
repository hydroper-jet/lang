# Type conversions

## Implicit constant conversions

The language performs implicit compile-time type conversions from a constant to a constant of another type. They are described by the following table:

| Relationship | Description |
| ------------ | ----------- |
| `undefined` to `*`, `Optional`, `Set` `enum` | For `Set` enum, results into an empty set. For other types, results into `undefined`. |
| `N` constant to `*`, `Object` | Results into a `N` number constant of a covariant type. |
| `NF1` constant to `NF2` or `Optional.<NF2>` | Results into a floating point constant with the same numeric value, where `NF2` is a floating point type whose range is greater than that of `NF1`. |
| `NI1` constant to `NI2` or `Optional.<NI2>` | Results into an integer constant with the same numeric value, where `NI2` is a integer type whose range is greater than that of `NI1`. |
| `NI` constant to `Number` or `Optional.<Number>` | Results into a number constant with the same numeric value, where `NI` is one of \{ `Byte`, `UnsignedByte`, `Short`, `UnsignedShort`, `Int` or `UnsignedInt` \}. |
| `NaN` constant to `NI` or `Optional.<NI>` | Results into a zero (0) constant where `NI` is an integer type. |
| `-Infinity` constant to `NI` or `Optional.<NI>` | Results into the minimum integer constant where `NI` is an integer type. |
| `+Infinity` constant to `NI` or `Optional.<NI>` | Results into the maximum integer constant where `NI` is an integer type. |

## Implicit conversions

## Explicit conversions