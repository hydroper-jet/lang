# Type expressions

<table>
    <tr>
        <td colspan="2"><i>TypeExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TypeExpression</i><sup>noPrefix</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>?</b> <i>TypeExpression</i><sup>noPrefix</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>TypeExpression</i><sup>noPrefix</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>*</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Identifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>void</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>undefined</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&#x5B;</b> <i>TypeExpression</i> <b>&#x5D;</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&#x28;</b> <i>TypeExpression</i> <b>&#x29;</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TupleTypeExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FunctionTypeExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TypeExpression</i><sup>noPrefix</sup> <b>.</b> <i>IdentifierName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TypeExpression</i><sup>noPrefix</sup> <i>TypeArguments</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TypeExpression</i><sup>noPrefix</sup> <b>?</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>TypeArguments</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>.</b> <b>&lt;</b> <i>TypeArgumentsList</i> <b>&gt;</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>.</b> <b>&lt;</b> <i>TypeArgumentsList</i> [initial <b>&gt;</b> from the offending token]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>TypeArgumentsList</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TypeExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TypeExpressionList</i> <b>,</b> <i>TypeExpression</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>TupleTypeExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&#x5B;</b> <i>TupleElementTypes</i> <b>&#x5D;</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>TupleElementTypes</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i><i>TypeExpression</i> <b>,</b> <i>TypeExpression</i></i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i><i>TupleElementTypes</i> <b>,</b> <i>TypeExpression</i></i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>FunctionTypeExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>(</b> <i>FunctionTypeParameters</i> <b>)</b> <b>=></b> <i>TypeExpression</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>FunctionTypeParameters</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[empty]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FunctionTypeParameter</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FunctionTypeParameters</i> <b>,</b> <i>FunctionTypeParameter</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>FunctionTypeParameter</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TypedIdentifier</i> [lookahead ∉ {<b>?</b>}]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TypedIdentifier</i> <b>?</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>...</b> <i>TypedIdentifier</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>TypedIdentifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>IdentifierName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>IdentifierName</i> <b>:</b> <i>TypeExpression</i></td>
    </tr>
</table>

**Verification**

<i>TypeExpression</i> : <i>TypeExpression</i><sup>noPrefix</sup>

* Return the verification result of <i>TypeExpression</i><sup>noPrefix</sup>.

<i>TypeExpression</i> : <b>?</b> <i>TypeExpression</i><sup>noPrefix</sup>

* Return the verification result of <i>TypeExpression</i><sup>noPrefix</sup> if it is the `Optional` type.
* Return an `Optional` type consisting of the verification result of <i>TypeExpression</i><sup>noPrefix</sup>.

<i>TypeExpression</i><sup>noPrefix</sup> : <b>*</b>

* Return the any type.

<i>TypeExpression</i><sup>noPrefix</sup> : <i>Identifier</i>

* Let *p* be *ResolveProperty*(*current scope*, undefined, string of <i>Identifier</i>)
* It is a verify error if *p* is undefined.
* It is a verify error if [*PropertyIsVisible*](*p*, *current scope*) is false.
* It is a verify error if *p* is not a type and the rule is not followed by a postfix operator.
* Return *p*.

<i>TypeExpression</i><sup>noPrefix</sup> : <b>void</b>

* Return the void type.

<i>TypeExpression</i><sup>noPrefix</sup> : <b>undefined</b>

* Return the void type.

<i>TypeExpression</i><sup>noPrefix</sup> : <i>TupleTypeExpression</i>

* Return the verification of <i>TupleTypeExpression</i>.

<i>TypeExpression</i><sup>noPrefix</sup> : <i>FunctionTypeExpression</i>

* Return the verification of <i>FunctionTypeExpression</i>.

<i>TypeExpression</i><sup>noPrefix</sup> : <b>&#x5B;</b> <i>TypeExpression</i> <b>&#x5D;</b>

* Return an array type consisting of the verification result of <i>TypeExpression</i>.

<i>TypeExpression</i><sup>noPrefix</sup> : <b>&#x28;</b> <i>TypeExpression</i> <b>&#x29;</b>

* Return the verification result of <i>TypeExpression</i>.

<i>TypeExpression</i><sup>noPrefix</sup> : <i>TypeExpression</i><sup>noPrefix</sup> <b>.</b> <i>IdentifierName</i>

* Let *base* be the verification result of <i>TypeExpression</i><sup>noPrefix</sup>.
* Let *p* be *ResolveProperty*(*base*, undefined, string of <i>IdentifierName</i>)
* It is a verify error if *p* is undefined.
* It is a verify error if [*PropertyIsVisible*](*p*, *current scope*) is false.
* Return *p*.

<i>TypeExpression</i><sup>noPrefix</sup> : <i>TypeExpression</i><sup>noPrefix</sup> <i>TypeArguments</i>

* Let *base* be the verification result of <i>TypeExpression</i><sup>noPrefix</sup>.
* It is a verify error if *base* is not a type with \[\[*TypeParameters*\]\].
* It is a verify error if *base*\[\[*TypeParameters*\]\] is empty.
* Let *a* be the verification sequence of <i>TypeArguments</i>.
* If *base* is `Optional` and *a*<sub>0</sub> is `Optional`
  * Return *a*<sub>0</sub>
* Return a type substitution in *base* with *a* as type arguments.

<i>TypeExpression</i><sup>noPrefix</sup> : <i>TypeExpression</i><sup>noPrefix</sup> <b>?</b>

* Return the verification result of <i>TypeExpression</i><sup>noPrefix</sup> if it is the `Optional` type.
* Return an `Optional` type consisting of the verification result of <i>TypeExpression</i><sup>noPrefix</sup>.

<i>TupleTypeExpression</i> : <b>&#x5B;</b> <i>TupleElementTypes</i> <b>&#x5D;</b>

* Let *e* be an empty list.
* For each *e*<sub>0</sub> <i>TypeExpression</i> in <i>TupleElementTypes</i>
  * Append to *e* the verification result of *e*<sub>0</sub>
* Return a tuple type consisting of the element types *e*.

<i>FunctionTypeExpression</i> : <b>(</b> <i>FunctionTypeParameters</i> <b>)</b> <b>=></b> <i>TypeExpression</i>

* It is a verify error if <i>FunctionTypeParameters</i> is not a sequence of zero or more <i>TypedIdentifier</i> \[lookahead ∉ \{<b>?</b>\}\] followed by zero or more <i>TypedIdentifier</i> <b>?</b> followed by optional <b>...</b> <i>TypedIdentifier</i>.
* Let *p*<sub>0</sub> be an empty list.
* Let *p*<sub>1</sub> be an empty list.
* Let *p*<sub>2</sub> be undefined.
* For each <i>TypedIdentifier</i> \[lookahead ∉ \{<b>?</b>\}\] as *typedId* in <i>FunctionTypeParameters</i>
  * Let (*name*, *type*) be the verification of *typedId*.
  * Contribute (*name*, *type*) to *p*<sub>0</sub>.
* For each <i>TypedIdentifier</i> <b>?</b> as *typedId* in <i>FunctionTypeParameters</i>
  * Let (*name*, *type*) be the verification of *typedId*.
  * Contribute (*name*, *type*) to *p*<sub>0</sub>.
* If <i>FunctionTypeParameters</i> contains <b>...</b> <i>TypedIdentifier</i> as *typeId*
  * Let (*name*, *type*) be the verification of *typedId*.
  * It is a verify error if *type* is not the `Array` type.
  * Assign *p*<sub>2</sub> = (*name*, *type*)
* Let *returnType* be the verification of <i>TypeExpression</i> preceded by <b>=></b>.
* Return a function type consisting of required parameters *p*<sub>0</sub>, optional parameters *p*<sub>1</sub>, rest parameter *p*<sub>2</sub> and return type *returnType*.

<i>TypedIdentifier</i> : <i>IdentifierName</i>

* It is a verify error if no context type is given.
* Return (string of <i>IdentifierName</i>, context type)

<i>TypedIdentifier</i> : <i>IdentifierName</i> <b>:</b> <i>TypeExpression</i>

* Return (string of <i>IdentifierName</i>, verification of <i>TypeExpression</i>)

<i>TypeArguments</i> : <b>.</b> <b>&lt;</b> <i>TypeArgumentsList</i> <b>&gt;</b><br>
<i>TypeArguments</i> : <b>.</b> <b>&lt;</b> <i>TypeArgumentsList</i> <b>&gt;</b> \[initial <b>&gt;</b> from the offending token\]

* Return the verification of each <i>TypeExpression</i> in <i>TypeArgumentsList</i> in a sequence.

[*PropertyIsVisible*]: visibility.md#propertyisvisible