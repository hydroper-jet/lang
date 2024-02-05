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
    source: output + "path/to/data.bin",
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
</table>

**Semantics**

The *ObjectInitializer* is read as a compile-time description pointing to a file as the `source` property and its result type as the `type` property. The result type must be either `String` or `ByteArray`.

* A result type of `String` indicates that the file is read as an UTF-8 encoded text.
* A result type of `ByteArray` indicates that the file is read as binary data.

The `source` property of *ObjectInitializer* may be specified in one of the following forms:

* A *StringLiteral* production resolving to a file path (value of the *StringLiteral*) relative to the file path of the program.
* An **output** **\+** *StringLiteral* production resolving to a file path (value of the *StringLiteral*) relative to the JetPM output directory.