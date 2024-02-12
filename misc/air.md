# AIR

## Miscellaneous

* Check whether this project had any relevant tip
  * https://github.com/hydroper-6jB4v9P1FIX/draft/tree/main/1

## jet.lang.Array versus avm.lang.Array

`jet.lang.Array.<T>` is equivalent to `Vector.<T>` of the AIR API, while `avm.lang.Array` is equivalent to `Array` of the AIR API.

## Numeric types

Jet does not support the ActionScript `uint` and `int` types natively; therefore, `avm.lang` defines `avm.lang.UnsignedInt` and `avm.lang.Int` as the equivalent of both, providing interoperability with `Number`, as well as optimizations where possible when building in release mode.

Additionally, it may be necessary for ActionScript functions to use the `[AVMOptParameters]` meta-data to map default values for optional parameters that are of ActionScript `uint` or `int` type.

```
[AVMProperty("f")]
[AVMOptParameters(a = -1)]
public native function f(a: Int);
```

## Rest parameter

The rest parameter must be of type `jet.lang.Array.<*>` (that is, `AS3.__vec__.Vector.<*>`) and the compiler will automatically convert array types as necessary.

## avm.lang

### avm.lang.Array

avm.lang.Array represents the ActionScript `Array` class. Such class converts from and to `jet.lang.Array`.

## avm.intrinsics

```
avm.intrinsics.getProperty(object, key)
avm.intrinsics.setProperty(object, key)
avm.intrinsics.deleteProperty(object, key)
// "arguments" is passed as an "[*]" array, however optimized
// when using an array initializer directly.
avm.intrinsics.callProperty(object, key, arguments)
```

AVM2 domain memory operations such as `li8()` translate to the respective AVM2 instruction.

## \[AVMProperty\]

The `[AVMProperty("name")]` meta-data identifies an ActionScript property by its name, causing a Jet definition to translate to such.

If it contains at least a dot, it identifies a property in the `public` namespace of a package by a fully qualified name (`q.C`).

If the name starts with `(toplevel).`, it identifies a property in the `public` namespace of the top-level package.

## Open namespaces

The `[AVMImport]` meta-data opens `public` namespaces of specified ActionScript packages for an entire region.

```
[AVMImport("flash.events", "flash.utils")] {
    // Action
}
```

The top-level package `public` namespace is always open at all regions.

## Optimizations

* `for..in` and `for each` should be optimized for `Array`, `Map` and `avm.lang.Array`
  * `for..in`: For `Map`, given that it is implemented as a `flash.utils.Dictionary` where string keys have a dollar prefix, skip such prefix in string keys.

## Type descriptions

* Operations on dynamically typed bases require lookuping into a type description dictionary by the constructor (`base.constructor`). It is a `TypeError` if the base is undefined or null before the lookup.