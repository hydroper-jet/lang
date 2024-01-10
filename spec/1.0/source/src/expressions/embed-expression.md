# Embed expression

The embed expression is used to embed static files in the program at compile time. It may be used to embed a file either as a `ByteArray` object or as an UTF-8 encoded `String` text.

```
const text = embed "path/to/data.txt" as String;
const byteArray = embed "path/to/data.bin" as ByteArray;
```

The embed expression allows resolving files from the JWPM output directory by using the `from` clause:

```
const byteArray = embed "path/to/data.bin" from outputDirectory as ByteArray;
```

<table>
    <tr>
        <td colspan="2"><i>EmbedExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>embed</b> <i>StringLiteral</i> <i>EmbedPostfixes</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>EmbedPostfixes</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[lookahead ∉ {<b>as</b>}]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>EmbedFromPostfix</i><sub>opt</sub> <i>EmbedAsPostfix</i><sub>opt</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>EmbedFromPostfix</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>from</b> <i>IdentifierName</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>EmbedAsPostfix</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>as</b> <i>TypeExpression</i></td>
    </tr>
</table>