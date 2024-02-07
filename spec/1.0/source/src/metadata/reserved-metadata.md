# Reserved meta-data

Reserved meta-data are meta-data that cannot be overriden by plain meta-data. This section enumerates all reserved meta-data.

* [`[Literal]`](#literal)
* [`[Set]`](#set)
* [`[Test]`](#test)

## Literal

The `Literal` meta-data is reserved at the `class` definition. It is used for indicating that the class can be initialized through an object initializer.

## Set

The `Set` meta-data is reserved at the `enum` definition. It is used for indicating that the `enum` is a set enumeration.

## Test

The `Test` meta-data is reserved at the `function` definition. It is used for indicating that a function is a test unit.