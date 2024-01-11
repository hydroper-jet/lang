# Plain meta-data

Plain meta-data are uninterpreted meta-data attached to a definition, using double bracketed notation (`[[]]`).

Plain meta-data consists of a `Name()` or `Name` form that consists of zero or more entries. The following are the possible entry forms:

* `key = "value"` — String entry
* `key = boolean` — Boolean entry
* `key = number` — Number entry
* `key = File("path/to/file")` — File entry
* `key = (...)` — Entry consisting of a collection of other key-value entries
* `value` — Keyless string entry, equivalent to `"value"`
* `"value"` — Keyless string entry, equivalent to `value`
* `boolean` — Keyless boolean entry
* `number` — Keyless number entry
* `File("path/to/file")` — Keyless file entry
* `(...)` — Keyless entry consisting of a collection of other key-value entries

Additional syntax and characteristics:

* The identifiers used in the meta-data form and the entries are allowed to use a `::` separator, as in `q::N`.
* `boolean` is a *BooleanLiteral*.
* `number` is a *NumericLiteral* and corresponds to a double-precision floating point.

```
[[N1(x = "y", z, "w", File("myExtension.dll"))]]
[[N2]]
[[N3(x = (x = "v", y = "v"), y = "v")]]
class C {}
```

The entry keys are not unique and may appear more than once.

## File

The `File` value of a file entry may be in one of the forms:

* `File("path/to/file")`
* `File(outputDirectory, "path/to/file")` — Resolves file from the output directory of the JetWorkPM build process.