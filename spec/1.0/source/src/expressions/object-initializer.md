# Object initializer

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>ObjectInitializer</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>{</b> <i>FieldList</i> <b>}</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>FieldList</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>NonEmptyFieldList</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>NonEmptyFieldList</i> <b>,</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>NonEmptyFieldList</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>InitializerField</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>InitializerRest</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>NonEmptyFieldList</i> <b>,</b> <i>InitializerField</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>NonEmptyFieldList</i> <b>,</b> <i>InitializerRest</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>InitializerRest</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>...</b> <i>AssignmentExpression</i><sup>allowIn</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>InitializerField</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FieldName</i> <b>:</b> <i>AssignmentExpression</i><sup>allowIn</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>IdentifierName</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>FieldName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>IdentifierName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Brackets</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>StringLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>NumericLiteral</i></td>
    </tr>
</table>

The verification for the object initializer requires a context type. The object initializer may be used to initialize the following context types:

* `*`
* `Object` or `Object?`
* `M` or `M?` where `M` is the `Map` type
* `E` or `E?` where `E` is a Set `enum`
* `C` or `C?` where `C` is a `class` and `C`\[\[*AllowLiteral*\]\] is true

Initializing a context type that is one of { `*`, `Object`, `Object?` } results into a `Map.<*, *>` object.