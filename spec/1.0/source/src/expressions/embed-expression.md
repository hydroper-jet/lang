# Embed expression

The embed expression is used to embed static files in the program at compile time. It may be used to embed a file either as a `ByteArray` object or as an UTF-8 encoded `String` text.

```
const text = embed {
    source: "path/to/data.txt",
    type: String,
}
const byteArray = embed {
    source: "path/to/data.bin",
    type: ByteArray,
}
```

The embed expression allows resolving files from the JetPM output directory:

```
const byteArray = embed {
    source: output + "auto/generated.bin",
    type: ByteArray,
}
```

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>EmbedExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>embed</b> <i>ObjectInitializer</i></td>
    </tr>
</table>

**Semantics**

The *ObjectInitializer* symbol as part of the `embed` expression is read as a compile-time description pointing to a file as the `source` property and its result type as the `type` property. The result type must be either `String` or `ByteArray`.

* A result type of `String` indicates that the file is read as an UTF-8 encoded text.
* A result type of `ByteArray` indicates that the file is read as binary data.

The `source` property of *ObjectInitializer* may be specified in one of the following forms:

* A *StringLiteral* production resolving to a file path (value of the *StringLiteral*) relative to the file path of the program.
* An **output** **\+** *StringLiteral* production resolving to a file path (value of the *StringLiteral*) relative to the JetPM output directory.

If the result type is unspecified, it is set to the context type.

**Verification**

* It is a verify error if fields other than `source` and `type` are present.
* It is a verify error if the `source` field is unspecified.
* Let *filePath* be a string
* If the `source` field consists of a *StringLiteral* production
  * Assign *filePath* = resolution from the file path of the source file to the file path specified by the *StringLiteral* string value.
* Else if the `source` field consists of a **output** **\+** *StringLiteral* production
  * Assign *filePath* = resolution from the JetPM output directory to the file path specified by the *StringLiteral* string value.
* Else it is a verify error.
* Let *resultType* be undefined.
* The value of the `type` field of *ObjectInitializer* is refined into a *TypeExpression* and is verified resolving to a type assigned to *resultType*.
* If *resultType* is undefined, assign *resultType* = context type.
* *resultType* is converted to a non-nullable type if it is explicitly nullable.
* It is a verify error if *resultType* is undefined or *resultType* is not one of { `ByteArray`, `String` }.
* Verifying *EmbedExpression* results into a `embed` value of type *resultType*. The resulting `embed` value contains content as either a byte array, if *resultType* is `ByteArray`, or UTF-8 encoded text, if *resultType* is `String`. The content is read from the file path *filePath* or it is a verify error otherwise.