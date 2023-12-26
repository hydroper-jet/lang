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
        <td>&nbsp;</td><td><i>FunctionTypeExpression</i></td>
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
        <td colspan="2"><i>TupleTypeExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i><b>&#x5B;</b> <i>AtLeast2TypeExpressions</i> <b>&#x5D;</b></i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>AtLeast2TypeExpressions</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i><i>TypeExpression</i> <b>,</b> <i>TypeExpression</i></i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i><i>AtLeast2TypeExpressions</i> <b>,</b> <i>TypeExpression</i></i></td>
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

[*PropertyIsVisible*]: visibility.md#propertyisvisible