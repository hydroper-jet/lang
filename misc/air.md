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

## \[\[avm::Class\]\]

The `[[avm::Class]]` meta-data identifies an ActionScript class by its fully qualified name in the `public` namespace of a package.

## \[\[avm::OpenPackages\]\]

The `[[avm::OpenPackages]]` meta-data opens `public` namespaces of specified ActionScript packages for an entire definition and all of its subsequent sections.

```
[[avm::OpenPackages("flash.events", "flash.utils")]]
function f(): T {}
```

## Optimizations

* `for..in` and `for each` should be optimized for `Array`, `Map` and `avm.lang.Array`
  * `for..in`: For `Map`, given that it is implemented as a `flash.utils.Dictionary` where string keys have a dollar prefix, skip such prefix in string keys.

## Type descriptions

* Operations on dynamically typed bases require lookuping into a type description dictionary by the constructor (`base.constructor`). It is a `TypeError` if the base is undefined or null before the lookup.