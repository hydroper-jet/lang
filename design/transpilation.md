# Transpilation

## Interning

* Instances have to be interned manually. For ActionScript, primitives need not be interned manually.
  * `Optional.<P>` where `P` is a primitive type
  * `Char`
  * `CharIndex`

## Lua

* Thrown errors are translated to `error()` calls with a message containing `"jeterror" .. string.char(0)` followed by a random ID.
  * A weak-key table maps from such random ID to the error object.
  * A `try..catch` statement uses a `pcall()` with an anonymous function to catch the error by its random ID. If the caught error message hasn't the `jeterror\u{00}` prefix, then a new `Error` object is constructed with the same message.