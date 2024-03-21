# Enumerations

An enumeration is an user-defined type whose main composition is a set of possible variants called **members**. An enumeration is denoted by the **enum** keyword.

An enumeration represents a final class that inherits the **Object** type.

Unlike in general languages, members of an enumeration in Jet consist of a (*string*, *number*) group. Efficient implementations represent a variable of an enumeration data type as a number, if not in boxed form.

```
enum E1 {
    const M1, M2
}
const v: E1 = "m1"
const v: E1 = "m2"
```

Set enumerations contain the **Set** meta-data and have special behaviour in that a value of the enumeration data type may include zero or more mutual members.

```
[Set]
enum E1 {
    const M1, M2
}
const set: E1 = ["m1", "m2"]
trace("m1" in set)
trace("m2" in set)
```

## Enum Block

The **enum** block supports defining properties other than enumeration members, including instance methods, static methods, static properties and proxies.

Unlike with a **class** block, the **enum** block does not support defining a constructor.

```
enum E1 {
    const M1, M2
    function math(): Number (
        valueOf() * 16
    )
}
```

## Members

An enumeration member consists of a (*string*, *number*) group.

Members within the **enum** block are defined using variable definitions that do not contain the **static** attribute.

The *string* and *number* values are corresponding to a **String** and a number.

Defining a member, in addition to contributing a member, shall also contribute a static constant to the enumeration whose name is that of the binding identifier and whose value identifies the enumeration member.

```
E.M
```

The value for *string* and *number* may be specified in different forms. If in any of the forms a component is omitted, the value is automatically assigned to that component. The values for the (*string*, *number*) group are given in the initializer of the **const** definition, as in the following block:

```
const M
const M = "string"
const M = number
const M = ["string", number]
const M = [number, "string"]
```

In the presented forms, **number** must be a constant expression that is a number constant whose data type is the numeric type of the enumeration.

**Restrictions**

It is a syntax error if any of the following conditions are true:

* A member definition is not denoted by the **const** keyword.
* A variable binding of a member definition includes destructuring.
* A variable binding of a member definition includes a type annotation.

It is a verify error if any of the following conditions are true:

* The member name already exists.
* The *string* already belongs to another member.
* The *number* already belongs to another member.
* If it is a set enumeration and *number* is not one or a power of two.

### Automatic String

If the *string* component is omitted when defining a member, its value is a screaming snake case to camel case transformation of the member name, as illustrated in the following table:

| Member name   | Member string  |
| ------------- | -------------- |
| M             | "m"          |
| SOME_MEMBER   | "someMember" |

### Automatic Number

If the *number* component is omitted when defining a member, its value is selected based on the previous member definition.

For non **Set** enumerations, the initial member number is zero (0) and the next member number is an increment of 1 of the previous member number:

```
const M1 // = 0
const M2 // = 1
```

For **Set** enumerations, the initial member number is one (1) and the next member number is the double of the previous member number:

```
const M1 // = 1
const M2 // = 2
const M4 // = 4
```

## Numeric Type

An enumeration uses the same numeric type for all of its members. Such numeric type may be specified by the **as** clause.

By default, an enumeration uses **Number** as its numeric type.

```
enum E1 as Long {
    const M1
}
```

## Set Enumerations

Set enumerations are defined with the **Set** meta-data. Set enumerations are immutable data types represented by zero or more members, using bitwise capabilities.

```
[Set]
enum E1 { const M1, M2 }
```

## Enumeration Inference

The programmer is allowed to use a string literal to identify an enumeration member by its *string* value wherever the enumeration is expected at compile-time.

```
enum E1 {
    const M1, M2;
}
function f(a: E1) a == "m1";
trace(f("m1"));
```

Set enumerations can be initialized within an array literal or object initializer.

## Conversion

It is allowed to convert to an enumeration using the call operator (**E(v)**). The conversion accepts a **String** or a number of the numeric type.

It is a **TypeError** if such conversions fail due to unrecognized **String** or number.

For set enumerations, converting from a number always succeeds, as the members are identified by the corresponding bits and the unrecognized bits are ignored.

```
E(v)
```

## Implicit Definitions

### valueOf()

The instance method **valueOf**() of an enumeration returns the number corresponding to the enumeration object.

### toString()

For a common enumeration, the instance method **toString**() returns the string corresponding to the enumeration object.

For a set enumeration, the instance method **toString**() returns a string as a comma-separated list corresponding to the included members.

### all

For set enumerations, the static constant **all** is a set containing all the members of the enumeration.

### with()

For set enumerations, the instance method **with**(*other* : *E*, *value* : Boolean) : *E* where *E* is the enumeration, produces the same result as the expression:

```
value ? include(other) : exclude(other)
```

### include()

For set enumerations, the instance method **include**(*other* : *E*) : *E* where *E* is the enumeration, produces the same result as the expression:

```
E(valueOf() | other.valueOf())
```

### exclude()

For set enumerations, the instance method **exclude**(*other* : *E*) : *E* where *E* is the enumeration, produces the same result as the expression:

```
E(other in this ? valueOf() ^ other.valueOf() : valueOf())
```

### toggle()

For set enumerations, the instance method **toggle**(*other* : *E*) : *E* where *E* is the enumeration, produces the same result as the expression:

```
E(valueOf() ^ other.valueOf())`
```

### filter()

For set enumerations, the instance method **filter**(*other* : *E*) : *E* where *E* is the enumeration, produces the same result as the expression:

```
E(valueOf() & other.valueOf())`
```

### proxy::has()

For set enumerations, the proxy **has**(*value* : *E*) where *E* is the enumeration, produces the same result as the expression **valueOf() \& value.valueOf() != 0**.

```
m in o
```