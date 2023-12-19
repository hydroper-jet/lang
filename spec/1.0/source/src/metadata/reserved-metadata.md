# Reserved meta-data

Reserved meta-data are meta-data that cannot be overriden by user decorators. This section enumerates all reserved meta-data.

* [Literal](#literal)
* [Metadata](#metadata)
* [Number](#number)
* [Set](#set)
* [Test](#test)

## Literal

The `Literal` meta-data is reserved at the `class` definition. It is used for indicating that the class can be initialized through an object initializer.

## Metadata

The `Metadata` meta-data is used for defining plain meta-data, as described in the [Plain meta-data](plain-metadata.md) section.

## Number

The `Number` meta-data is reserved at the `enum` definition. It is used for selecting the number type to use for representing instances of the `enum`.

## Set

The `Set` meta-data is reserved at the `enum` definition. It is used for indicating that the `enum` is a set enumeration.

## Test

The `Test` meta-data is reserved at the `function` definition. It is used for indicating that a function is a test unit.