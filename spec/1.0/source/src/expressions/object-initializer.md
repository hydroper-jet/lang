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

**Semantics**

The object initializer may be used to initialize the following types:

* `*`
* `Object`
* `Map.<K, V>`
* Set enumerations
* Classes containing the `[Literal]` meta-data

Initializing a type that is one of { `*`, `Object`, `Object?` } results into a `Map.<*, *>` object.

The default context type is the `Map.<*, *>` type.

**Verification**

A field item is either an *InitializerRest* or an <i>InitializerField</i>, from left-to-right.

*ObjectInitializer*

* Let *ctxType* be the initially given context type or `Map.<*, *>` otherwise.
* Match the nonterminal symbol with *AnyOrObject*(*ctxType*).
* Otherwise match the nonterminal symbol with *Map*(*ctxType*).
* Otherwise match the nonterminal symbol with *SetEnum*(*ctxType*).
* Otherwise match the nonterminal symbol with *LiteralClass*(*ctxType*).
* Otherwise throw a verify error.

*AnyOrObject*(*ctxType*) internal matcher

* ...