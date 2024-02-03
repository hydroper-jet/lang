# Built-ins

`jet.lang.*` contains all global definitions of the Jet Language.

* [ ] `undefined: *`
* [ ] `Infinity`
* [ ] `NaN`
* [ ] `Object`
  * [ ] `constructor`
  * [ ] `toString()`
  * [ ] `valueOf()`
* [ ] `Class`
* [ ] `CharReader`
  * [ ] Includes several methods suitable for tokenizers: `remaining()`, `lookahead()`, `lookaheadSequence()`, `skip()`, `skipNumber(n)`
  * [ ] `index` property (read-only)
  * [ ] `lookbehind()`
  * [ ] `clone()`
  * [ ] Implements `Iterator`
* [ ] `Iterator`
  * [ ] `length()` optional method (consumes the iterator, returning the count as `Number`)
  * [ ] `toArray()`
* [ ] Array
  * [ ] All indices use the `Number` data type (not `Int` or `UnsignedInt`)
  * [ ] `length` returns `Number`
  * [ ] Like Java, methods such as `indexOf()` return `-1` occasionally.
  * [ ] `getProperty()` returns `T` and throws a `RangeError` if out of bounds, instead of returning `T?`. This makes more sense for `setProperty` and `deleteProperty` as well together.
* [ ] `String`
  * [ ] `length` returns a `Number` (not an integer data type) indicating the number of encoding units of the string.
  * [ ] `chars()` returns `CharReader`
  * [ ] Add example demonstrating `"string".chars().length()` versus `"string".length` (result varies across platforms).
  * [ ] Methods such as `replace()` that accept a replacement callback function pass matches in a dedicated argument instead of passing ordinary arguments.

## Indices in general

In general, indices are represented by the `Number` data type in the standard objects, since it is the type that the numeric literal produces by default.