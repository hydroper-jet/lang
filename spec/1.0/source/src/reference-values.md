# Reference values

The internal reference values described in this section are used at compile-time to represent references that may be read or overwritten.

## XMLReferenceValue(base, qual, key)

The internal *XMLReferenceValue*(*base*, *qual*, *key*) reference value has the following characteristics:

* It is not read-only.
* It is not write-only.
* Its static type is `*`.

## DynamicReferenceValue(base, qual, key)

The internal *DynamicReferenceValue*(*base*, *qual*, *key*) reference value has the following characteristics:

* It is not read-only.
* It is not write-only.
* Its static type is `*`.

## StaticReferenceValue(base, prop)

The internal *StaticReferenceValue*(*base*, *prop*) reference value has the following characteristics:

* It is read-only if *prop* is read-only.
* It is write-only if *prop* is write-only.
* Its static type is [*PropertyStaticType*](#propertystatictype)(*prop*).

## InstanceReferenceValue(base, prop)

The internal *InstanceReferenceValue*(*base*, *prop*) reference value has the following characteristics:

* It is read-only if *prop* is read-only.
* It is write-only if *prop* is write-only.
* Its static type is [*PropertyStaticType*](#propertystatictype)(*prop*).

## ProxyReferenceValue(base, proxy)

The internal *ProxyReferenceValue*(*base*, *proxy*) reference value has the following characteristics:

* *proxy* is the `getProperty()` proxy.
* It is read-only if the type hierarchy of the *base* static type does not define the `setProperty()` proxy.
* It is not write-only.
* Its static type is the result type of signature of *proxy*.

## TupleReferenceValue(base, index)

The internal *TupleReferenceValue*(*base*, *index*) reference value has the following characteristics:

* *index* is a zero-based index into the *base* tuple.
* It is read-only.
* It is not write-only.
* Its static type is the type of the *i*th element of the *base* tuple given where *i* is *index*.

## ScopeReferenceValue(base, prop)

The internal *ScopeReferenceValue*(*base*, *prop*) reference value has the following characteristics:

* It is read-only if *prop* is read-only.
* It is write-only if *prop* is write-only.
* Its static type is [*PropertyStaticType*](#propertystatictype)(*prop*).

## DynamicScopeReferenceValue(base, qual, key)

The internal *DynamicScopeReferenceValue*(*base*, *qual*, *key*) reference value has the following characteristics:

* It is not read-only.
* It is not write-only.
* Its static type is `*`.

## PackageReferenceValue(base, prop)

The internal *PackageReferenceValue*(*base*, *prop*) reference value has the following characteristics:

* It is read-only if *prop* is read-only.
* It is write-only if *prop* is write-only.
* Its static type is [*PropertyStaticType*](#propertystatictype)(*prop*).

## PropertyStaticType()

The static type of a property is determined by the internal *PropertyStaticType*(*prop*) function as follows:

* If it is a variable or virtual property, return *prop*\[\[*Type*\]\].
* If it is a function, return *prop*\[\[*Signature*\]\].
* Assert that it is a type.
* Return `Class`.