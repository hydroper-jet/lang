# Types

## Default Value

The default value of a type is determined according to the following table:

| Type | Default value |
| ---- | ------------- |
| **\***            | **undefined** |
| **void**          | **undefined** |
| **T?**            | **null** |
| **Number**        | **0** |
| **Single**        | **0** |
| **Long**          | **0** |
| **BigInt**        | **0** |
| **Boolean**       | **false** |
| **String**        | **""** |
| **Char**          | **"\\x00"** |
| Set enumeration   | Empty set |

## Auto Boxing

The language performs auto boxing of primitive types. Primitive types are represented in a memory efficient way wherever available, including within an **Array**.

Primitive types are boxed without duplicating identity:

```
var x: Object = 10
var y: Object = 10

// true
x == y
```

## Any Type

The any type **\*** contains values from all other types. The **\*** type is the most ascending type of all other types.

## Void Type

The **void** type consists of the **undefined** value.

## Null Type

The **null** type consists of the **null** value. Although the null type exists in the specification, no operation in the language can result in the null type.

## Number Types

| Type | Description |
| ---- | ----------- |
| **Number**   | IEEE 754 double-precision floating point |
| **Single**   | IEEE 754 single-precision floating point |
| **BigInt**   | Arbitrary range integer |
| **Long**     | Ranges from -2<sup>64 - 1</sup> to 2<sup>64 - 1</sup> - 1 (64-bit) |

## Boolean Type

The **Boolean** type consists of the values **false** and **true**.

## String Type

The **String** type consists of a sequence of Unicode Scalar Values whose encoding is implementation-defined.

## Char Type

The **Char** type represents a character as an Unicode scalar value.

## Function Types

A function type consists of zero or more parameters and a result type.

```
type F = function(): T
```

**Inheritance**

A function type inherits from the **Function** class.

A function type is a final class.

**Grammar**

Each parameter is either a required, optional, or rest parameter.

The formal parameter list is a list of zero or more required parameters followed by zero or more optional parameters followed by an optional rest parameter.

The rest parameter must appear at most once.

**Restrictions**

The rest parameter, if any, must be of the **Array** type.

## Tuple Types

A tuple type represents a sequence of two or more element types.

```
type T1 = [E1, E2]

type T2 = [E1, E2, EN]
```

**Inheritance**

A tuple type inherits the **Object** class.

A tuple type is a final class.

**Access**

Tuple types consist of mutable elements and are compared by reference.

```
type T = [Number, Number]
const v: T = [10, 10]
v[0] += 1
v != [11, 10]
```

## Nullable Type

**T?** or **?T** is an union between **null** and **T**.

## Array Type

The **Array.&lt;T>** type is a dynamic collection of **T** values. Array may be denoted by either **Array.&lt;T>** or **\[T]**.

```
type A1 = [T1]

type A2 = Array.<T2>
```

## Object Type

The **Object** type is the ascending type of all other classes and all enumerations.

## Internal Functions

<sectionLabel>sec-expecttype</sectionLabel>

### ExpectType()

The internal *ExpectType*(*symbol*) function takes the following steps:

* If *symbol* is *PackageReferenceValue*(*base*, *prop*)
  * Return *ExpectType*(*prop*)
* If *symbol* is *ScopeReferenceValue*(*base*, *prop*)
  * Return *ExpectType*(*prop*)
* If *symbol* is *TypeAsReferenceValue*(*type*)
  * Return *type*
* Throw type error if *symbol* is not a type.
* Return *symbol*.