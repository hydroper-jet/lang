# Enumerations

The language supports user enumerations based on (*string*, *number*) groups. Enumerations are defined using the `enum` keyword.

An enumeration is a final class that inherits the `Object` type.

```
enum FoodType {
    const LIQUID;
    const SOLID;
}
```

## Members

A single enumeration member consists of a (*string*, *number*) group. Members within the `enum` block are defined using non `static`, `const` definitions, without destructuring and without a type annotation. The *string* and *number* values are corresponding to a `String` and a number.

The value for *string* and *number* may be specified in different forms. If in any of the forms a component is omitted, the value is automatically assigned to that component. The values for the (*string*, *number*) group are given in the initializer of the `const` definition, as follows:

```
const M;
const M = "string";
const M = number;
const M = ["string", number];
const M = [number, "string"];
```

In the presented forms, `number` must be a constant expression that is a number constant whose type is the representation type.

It is a verify error if any of the following conditions are true:

* The member name already exists.
* The *string* already belongs to another member.
* The *number* already belongs to another member.
* If it is a `Set` enumeration and the *number* is not one or a power of two.

### Automatic string

If the *string* component is omitted when defining a member, its value is a screaming snake case to camel case transformation of the member name, as illustrated in the following table:

| Member name   | Member string  |
| ------------- | -------------- |
| `M`           | `"m"`          |
| `SOME_MEMBER` | `"someMember"` |
| `SOME_BBQ`    | `"someBbq"`    |

### Automatic number

If the *number* component is omitted when defining a member, its value is selected based on the previous member definition.

For non `Set` enumerations, the initial member number is zero (0) and the next member number is an increment of 1 of the previous member number:

```
const M1 // = 0
const M2 // = 1
```

For `Set` enumerations, the initial member number is one (1) and the next member number is the double of the previous member number:

```
const M1 // = 1
const M2 // = 2
const M4 // = 4
```

## Representation type

Enumerations consist of a representation number type. The representation number type may be specified by the `Number` meta-data, given an identifier identifying the number type.

By default, an enumeration uses `Number` as the representation number type.

```
[Number(UnsignedInt)]
enum ExampleEnum {
    const EXAMPLE_MEMBER;
}
```

## Set enumerations

Set enumerations are defined with the `Set` meta-data. Set enumerations are represented by zero or more members, using bitwise capabilities.

```
[Set]
enum Toggles {
    const TOGGLE_1;
    const TOGGLE_2;
}
```

## Enumeration inference

Throughout JetWork code, the user is allowed to use a string literal to identify an enumeration member by its *string* value wherever the enumeration is expected at compile-time.

```
function peopleEat(foodType: FoodType): Boolean (
    foodType == "solid"
);
trace(peopleEat("solid"));
```

Set enumerations can additionally be initialized through an array or object initializer.

## Conversion

It is allowed to convert to an enumeration using the call operator. The conversion accepts a `String` or a number of the representation type. It is a fatal exception if such conversions fail due to unrecognized `String` or number. For set enumerations, converting from a number always succeeds, as the members are identified by the corresponding bits and the unrecognized bits are ignored.

```
E(v)
```

## Native methods

Enumerations automatically define the following methods, where `N` is the representation type:

```
/**
 * The number value.
 */
public native function valueOf(): N;

/**
 * The string value(s). For a set enumeration, returns a comma-separated string list.
 */
override public native function toString(): String;
```

Set enumerations automatically define the following constants, where `E` is the enumeration:

```
/**
 * A set containing all members.
 */
public static const all: E;
```

Set enumerations automatically define the following methods, where `E` is the enumeration:

```
public function include(other: E): E (
    E(this.valueOf() | other.valueOf())
);

public function exclude(other: E): E (
    E(if (other in this) this.valueOf() ^ other.valueOf() else this.valueOf())
);

public function toggle(other: E): E (
    E(this.valueOf() ^ other.valueOf())
);

public function filter(other: E): E (
    E(this.valueOf() & other.valueOf())
);

proxy function has(value: E): Boolean (
    this.valueOf() & value.valueOf() != 0
);
```