# Transpilation

## Interning

* Certain kinds of instances have to be interned manually. For ActionScript, primitives need not be interned manually.
  * `P?` where `P` is a primitive type
  * `Char`

## Lua

> Since Lua supported platforms are scarce in features, Jet is not considering Lua a priority.

* Thrown errors are translated to `error()` calls with a message containing the error message followed by `string.char(0) .. "jeterror"` followed by a random ID.
  * A weak-key table maps from such random ID to the error object.
  * A `try..catch` statement uses a `pcall()` with an anonymous function to catch the error by its random ID. If the caught error message contains no `\u{00}jeterror` sequence, then a new `Error` object is constructed with the same message.
    * Be careful with control flow (`return`, `break` and `continue` statements).