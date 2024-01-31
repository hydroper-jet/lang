# AIR

## jet.lang.Array versus avm.lang.Array

`jet.lang.Array.<T>` is equivalent to `Vector.<T>` of the AIR API, while `avm.lang.Array` is equivalent to `Array` of the AIR API.

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

## \[\[avm::Property\]\]

The `[[avm::Property("name")]]` meta-data identifies an ActionScript property by its name, causing a Jet definition to translate to such.

If it is applied to a package property, it identifies a property in the `public` namespace of a package by a fully qualified name (`q.C`).

## Open namespaces

The `[[avm::Import]]` meta-data opens `public` namespaces of specified ActionScript packages for an entire region.

```
[[avm::Import("flash.events", "flash.utils")]]
{
    // Action
}
```

The top-level package `public` namespace is always open at all regions.

## Optimizations

* `for..in` and `for each` should be optimized for `Array`, `Map` and `avm.lang.Array`
  * `for..in`: For `Map`, given that it is implemented as a `flash.utils.Dictionary` where string keys have a dollar prefix, skip such prefix in string keys.

## Type descriptions

* Operations on dynamically typed bases require lookuping into a type description dictionary by the constructor (`base.constructor`). It is a `TypeError` if the base is undefined or null before the lookup.