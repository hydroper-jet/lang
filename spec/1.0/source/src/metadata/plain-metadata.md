# Plain meta-data

Plain meta-data are uninterpreted meta-data attached to a definition.

Plain meta-data consists of a `Name()` or `Name` form that consists of zero or more entries. The following are the possible entry forms:

* `key = "value"` — String entry
* `key = boolean` — Boolean entry
* `key = number` — Number entry
* `key = File("path/to/file")` — File entry
* `key = List(...)` — Entry consisting of a list of subsequent key-value entries
* `value` — Keyless string entry, equivalent to `"value"`
* `"value"` — Keyless string entry, equivalent to `value`
* `boolean` — Keyless boolean entry
* `number` — Keyless number entry
* `File("path/to/file")` — Keyless file entry
* `List(...)` — Keyless entry consisting of a list of subsequent key-value entries

Additional syntax and characteristics:

* The identifiers used in the meta-data form and the entries are allowed to use a `::` separator, as in `q::N`.
* `boolean` is a *BooleanLiteral*.
* `number` is a *NumericLiteral* optionally preceded by a minus token **-** and corresponds to a double-precision floating point.

```
[N1(x = "y", z, "w", File("myExtension.dll"))]
[N2]
[N3(x = List(x = "v", y = "v"), y = "v")]
class C {}
```

The entry keys are not unique and may appear more than once.

## File

The `File` value of a file entry may be in one of the following production forms:

* **File** **\(** *StringLiteral* **\)** production resolves to a file path (value of the *StringLiteral*) relative to the file path of the program.
* **File** **\(** **output** **\+** *StringLiteral* **\)** production resolves to a file path (value of the *StringLiteral*) relative to the JetPM output directory.