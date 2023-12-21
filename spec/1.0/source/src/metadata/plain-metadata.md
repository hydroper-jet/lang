# Plain meta-data

Plain meta-data are uninterpreted meta-data attached to a definition, using the `Metadata` meta-data.

Plain meta-data consists of a `Name()` or `Name` form that consists of zero or more entries. The following are the possible entry forms:

* `key = "value"`
* `key = File("path/to/file")` — File entry
* `value` — Keyless entry, equivalent to `"value"`
* `"value"` — Keyless entry, equivalent to `value`
* `File("path/to/file")` — Keyless file entry

The identifiers used in the meta-data form and the entries are allowed to use a `::` separator, as in `q::N`.

```
[Metadata(N1(x = "y", z, "w", File("myExtension.dll")))]
[Metadata(N2)]
class C {}
```

## File

A `File` value may be in one of the forms:

* `File("path/to/file")`
* `File(import.meta.outputDirectory, "path/to/file")` — Resolves file from the output directory of the JetPM build process.