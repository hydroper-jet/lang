# Type Conversions

Type conversions occur either implicitly or explicitly.

An explicit type conversion occurs through one of the following expressions:

```
v as T
T(v)
```

**v as T** is an optional type conversion which, if a failure, results in **null**.

## Implicit Constant Conversions

The language performs implicit compile-time conversions from a constant to a constant of another type. These conversions are described by the following table:

| Relationship | Description |
| ------------ | ----------- |
| **undefined** to **\***, **T?**, or set enumeration | For **T?**, results into **null**. For set enumeration, results into an empty set. For **\***, results into **undefined**. |
| **null** to **\*** or **T?** | Results into **null**. |
| **N** constant to **\***, **Object** or **Object?** | Results into a **N** number constant of a covariant type. |
| **NF1** constant to **NF2** or **NF2?** | Results into a floating point constant with the same numeric value, where **NF2** is a floating point type whose range is wider than that of **NF1**. |
| **NI1** constant to **NI2** or **NI2?** | Results into an integer constant with the same numeric value, where **NI2** is a integer type whose range is wider than that of **NI1**. |
| **NaN** constant to **NI** or **NI?** | Results into a zero (0) constant where **NI** is an integer type. |
| **\-Infinity** constant to **NI** or **NI?** | Results into the minimum integer constant where **NI** is an integer type but not **BigInt**. |
| **\+Infinity** constant to **NI** or **NI?** | Results into the maximum integer constant where **NI** is an integer type but not **BigInt**. |
| Non nullable **T** constant to **T?** | Results into the same constant but wrapped in a nullable type. |

## Implicit Conversions

An implicit conversion is followed by an attempt of an implicit constant conversion. Implicit conversions are described by the following table:

| Relationship | Description |
| ------------ | ----------- |
| From **\*** | Converts to type from the **\*** type by using an explicit conversion or a conversion failure if the conversion fails at runtime. |
| To **\*** | Converts to the **\*** type. |
| **N1** to **N2**, **N1?** to **N2?** or **N1** to **N2?** | Results into a number value with the same numeric value, where **N2** is a number type whose range is wider than that of **N1**. |
| Non-nullable to covariant type | Results into a reference of a covariant type. |
| Nullable to nullable covariant type | Results into a reference of a nullable covariant type. |
| **interface** to **Object** | Results into an **Object** reference. |
| **interface?** to **Object?** | Results into an **Object?** reference. |
| **T** to **C?** | Implicit conversion from **T** to **C** resulting into a nullable **C**. |

## Explicit Conversions

An explicit conversion is followed by an attempt of an implicit conversion. Explicit conversions are described by the following table:

| Relationship | Description |
| ------------ | ----------- |
| To **T** through **proxy::to()** | Converts to type **T** by invoking a **to** proxy whose result type is **T** or a subtype of **T**. |
| Non-nullable to contravariant type | Results into a reference of a contravariant type or a conversion failure if destination is incompatible. |
| Nullable to non-nullable contravariant type | Results into a reference of a contravariant type or a conversion failure if destination is incompatible. |
| **Array** to contravariant **Array** | Constructs a new array filtering out covariant elements. |
| **Array** to covariant **Array** | Constructs a new array of a covariant type. |
| **N1** to **N2**, **N1?** to **N2?** or **N1** to **N2?** | Converts from a number type to another number type. The result is implementation-defined. |
| **String** to **enum** | Converts to **enum** by identifying a member by its string component. It is a failure if the member is not found. |
| Number to **enum** | For a non set enumeration, converts to the **enum** by identifying a member by its number component. It is a failure if the member is not found. For a set enumeration, converts to the **enum** by filtering out unrecognized bits. |
| **undefined** value to nullable type | Results into **null**. |
| **String** to **Char** | Results into a **Char** containing the first Unicode Scalar Value of a **String** or U+00 if empty. |
| **Char** to **String** | Results into a **String** containing a character. |
| **Char** to **Number** | Results into a number representing the Unicode value of a character. |
| **Number** to **Char** | It is failure if the number identifies an invalid Unicode Scalar Value, otherwise results into a character by its Unicode value. |
| Type parameter **T** to **W** | Conversion equivalent to **W(v as \*)** or **v as \* as W** where **v : T**. |
| **Map.&lt;\*, \*>** to **C** where **C** is a class and **C**.\[\[*AllowLiteral*\]\] = true | Constructs a **C** object. It is a conversion failure when a **C** instance variable is unrecognized or an explicit conversion to a variable's static type fails. |
| **C** to **Map.&lt;\*, \*>** where **C** is a class and **C**.\[\[*AllowLiteral*\]\] = true | Constructs a **Map.&lt;\*, \*>** from a **C** object consisting of the instance variables as **Map** entries. |
| **null** to **T** | Where **T** includes **null**, results into **null**.  |
| **T** to **C?** | Explicit conversion from **T** to **C** resulting into a nullable **C**. |
| **Promise.&lt;\*>** to **Promise.&lt;T>** | Creates a new **Promise.&lt;T>** object by explicitly converting the resulting value, if any, into **T** |

The contravariant and covariant **Array** conversions do not take nullable types except for a conversion from **\[*\]** to **\[T?\]**.