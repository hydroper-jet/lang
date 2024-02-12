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

*ResolveShorthand*(*IdentifierName*) internal function

* Let *r* be *ResolveProperty*(current scope, undefined, *IdentifierName* string).
* It is a verify error if *r* is undefined.
* It is a verify error if *PropertyIsVisible*(*ref*, current scope) is false.
* It is a verify error if *r* is a reference value that references a type parameterized type.
* It is a verify error if *r* is a reference value that references a type parameterized function.
* Return *r*

*AnyOrObject*(*ctxType*) internal matcher

* If *ctxType* is not one of { `*`, `Object`, `Object?` }, return match failure.
* For each field item *field*
  * If *field* is *InitializerRest*
    * Limit the type of the expression of *field* to `Map.<*, *>`.
  * Else if the *field* is a shorthand field *IdentifierName*
    * Call *ResolveShorthand*(*IdentifierName*).
  * Else
    * If the <i>FieldName</i> of *field* is a *Brackets* symbol
      * Verify the *Brackets* symbol.
    * Verify the <i>AssignmentExpression</i><sup>allowIn</sup> symbol of the *InitializerField*.
* Return a value of the *ctxType* type.

*Map*(*ctxType*) internal matcher

* If *ctxType* is not `M` or `M`?, where `M` is `Map.<K, V>`, return match failure.
* For each field item *field*
  * If *field* is *InitializerRest*
    * Limit the type of the expression of *field* to `Map.<K, V>`.
  * Else if the *field* is a shorthand field *IdentifierName*
    * Let *shortRef* be *ResolveShorthand*(*IdentifierName*).
    * Limit the static type of *shortRef* to `V`.
    * Throw a verify error if `K` is not one of { `*`, `Object`, `String` }.
  * Else
    * If the <i>FieldName</i> of *field* is a *Brackets* symbol
      * Limit the type of the *Brackets* expression to `K`.
    * Else if the <i>FieldName</i> of *field* is an *IdentifierName* symbol
      * Throw a verify error if `K` is not one of { `*`, `Object`, `String` }.
    * Else if the <i>FieldName</i> of *field* is a *StringLiteral* symbol
      * Throw a verify error if `K` is not one of { `*`, `Object`, `String` }.
    * Else if the <i>FieldName</i> of *field* is a *NumericLiteral* symbol
      * Throw a verify error if `K` is not one of { `*`, `Object`, `Number` }.
    * Limit the type of the <i>AssignmentExpression</i><sup>allowIn</sup> symbol of the *InitializerField* to `V`.
* Return a value of the *ctxType* type.