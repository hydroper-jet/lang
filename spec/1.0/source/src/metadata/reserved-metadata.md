# Reserved meta-data

Reserved meta-data are meta-data that cannot be overriden by user decorators. This section enumerates all reserved meta-data.

* [JetXML](#jetxml)
* [Literal](#literal)
* [Number](#number)
* [Set](#set)
* [Test](#test)

## JetXML

The `JetXML` meta-data is reserved at the `class` definition. It is used for indicating supported vector and color classes in a base class that implements `JetXML`.

## Literal

The `Literal` meta-data is reserved at the `class` definition. It is used for indicating that the class can be initialized through an object initializer.

## Number

The `Number` meta-data is reserved at the `enum` definition. It is used for selecting the number type to use for representing instances of the `enum`.

## Set

The `Set` meta-data is reserved at the `enum` definition. It is used for indicating that the `enum` is a set enumeration.

## Test

The `Test` meta-data is reserved at the `function` definition. It is used for indicating that a function is a test unit.