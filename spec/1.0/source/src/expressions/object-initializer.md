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
* Throw a verify error if *r* is undefined.
* Throw a verify error if *PropertyIsVisible*(*ref*, current scope) is false.
* Throw a verify error if *r* is a reference value that references a type parameterized type.
* Throw a verify error if *r* is a reference value that references a type parameterized function.
* Return *r*

*ResolveInstanceVariable*(`C`, *name*) internal function

* Let *variable* be a non-inherited instance variable of `C` whose \[\[*Name*\]\] equals the *name* string.
* Throw a verify error if *variable* is undefined.
* Throw a verify error if *PropertyIsVisible*(*variable*, current scope) is false.
* Return *variable*.

*AnyOrObject*(*ctxType*) internal matcher

* If *ctxType* is not one of { `*`, `Object`, `Object?`, `Map.<*, *>`, `Map.<*, *>?` }, return match failure.
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

* If *ctxType* is not `M` or `M?`, where `M` is `Map.<K, V>`, return match failure.
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

*SetEnum*(*ctxType*) internal matcher

* If *ctxType* is not `E` or `E?`, where `E` is a set enumeration, return match failure.
* Let *c* be zero.
* Let *isConst* be true.
* For each field item *field*
  * If *field* is *InitializerRest*
    * Let *c1* be the result of limiting the type of the expression of *field* to `E`.
    * If *c1* is an `enum` constant and *isConst* is true
      * Assign *c* = bitwise OR(*c*, number of *c1*)
    * Else assign *isConst* = false
  * Else if the *field* is a shorthand field *IdentifierName*
    * Let *shortRef* be *ResolveShorthand*(*IdentifierName*).
    * Limit the static type of *shortRef* to `Boolean`.
    * Let *member* be an enumeration member of `E` whose string equals the *IdentifierName* string
    * Throw a verify error if *member* is undefined.
    * If *shortRef* is a boolean constant and *isConst* is true
      * If *shortRef* boolean is true
        * Assign *c* = bitwise OR(*c*, number of *member*)
      * Else assign *c* = erase bits of (number of *member*) from *c* if all bits are included
    * Else assign *isConst* = false
  * Else
    * Let *c1* be the result of limiting the type of the <i>AssignmentExpression</i><sup>allowIn</sup> symbol of the *InitializerField* to `E`.
    * If the <i>FieldName</i> of *field* is a *Brackets* symbol
      * Limit the type of the *Brackets* expression to `String`.
      * Assign *isConst* = false
    * Else if the <i>FieldName</i> of *field* is an *IdentifierName* symbol or a *StringLiteral* symbol
      * Let *member* be an enumeration member of `E` whose string equals the string of the *IdentifierName* symbol or *StringLiteral* symbol.
      * Throw a verify error if *member* is undefined.
      * If *c1* is a boolean constant and *isConst* is true
        * If *c1* boolean is true
          * Assign *c* = bitwise OR(*c*, number of *member*)
        * Else assign *c* = erase bits of (number of *member*) from *c* if all bits are included
      * Else assign *isConst* = false
    * Else if the <i>FieldName</i> of *field* is a *NumericLiteral* symbol
      * Throw a verify error.
* If *isConst* is true
  * Return an `enum` constant with number *c* and static type as *ctxType*.
* Return a value of the *ctxType* type.

*LiteralClass*(*ctxType*) internal matcher

* If *ctxType* is not `C` or `C?`, where `C` is a `class` and `C`\[\[*AllowLiteral*\]\] is true, return match failure.
* Let *missing* be a set containing all non optional non-inherited instance variables of `C`.
* For each field item *field*
  * If *field* is *InitializerRest*
    * Limit the type of the expression of *field* to `C`.
    * Assign *missing* = empty set
  * Else if the *field* is a shorthand field *IdentifierName*
    * Let *variable* be *ResolveInstanceVariable*(`C`, *IdentifierName* string).
    * Remove *variable* from the *missing* set.
    * Let *shortRef* be *ResolveShorthand*(*IdentifierName*).
    * Limit the static type of *shortRef* to *variable*\[\[*Type*\]\].
  * Else
    * If the <i>FieldName</i> of *field* is a *Brackets* symbol
      * Limit the type of the *Brackets* expression to `String`.
      * Verify the <i>AssignmentExpression</i><sup>allowIn</sup> symbol of the *InitializerField*.
    * Else if the <i>FieldName</i> of *field* is an *IdentifierName* symbol or a *StringLiteral* symbol
      * Let *variable* be *ResolveInstanceVariable*(`C`, *IdentifierName* string or *StringLiteral* string).
      * Remove *variable* from the *missing* set.
      * Limit the type of the <i>AssignmentExpression</i><sup>allowIn</sup> symbol of the *InitializerField* to *variable*\[\[*Type*\]\].
    * Else if the <i>FieldName</i> of *field* is a *NumericLiteral* symbol
      * Verify the <i>AssignmentExpression</i><sup>allowIn</sup> symbol of the *InitializerField*.
      * Throw a verify error.
* Throw a verify error if *missing* is a non empty set.
* Return a value of the *ctxType* type.