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