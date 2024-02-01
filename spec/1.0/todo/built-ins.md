# Built-ins

`jet.lang.*` contains all global definitions of the Jet Language.

* [ ] `undefined`
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
  * [ ] `length()` optional method (consumes the iterator, returning the count)
* [ ] Array
  * [ ] All indices use the `Int` type
  * [ ] Like Java, methods such as `indexOf()` return `-1` occasionally.
  * [ ] `getProperty()` returns `T` and throws a `RangeError` if out of bounds, instead of returning `T?`. This makes more sense for `setProperty` and `deleteProperty` as well together.
* [ ] `String`
  * [ ] `chars()` returns `CharReader`
  * [ ] Methods such as `replace()` that accept a replacement callback function pass matches in a dedicated argument instead of passing ordinary arguments.