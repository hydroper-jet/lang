# Type expressions

<table>
    <tr>
        <td colspan="2"><i>TypeExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>NoQuestionPrefixTypeExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>?</b> <i>NoQuestionPrefixTypeExpression</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>NoQuestionPrefixTypeExpression</i></td>
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
        <td>&nbsp;</td><td><i>NoQuestionPrefixTypeExpression</i> <b>.</b> <i>IdentifierName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>NoQuestionPrefixTypeExpression</i> <i>TypeArguments</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>NoQuestionPrefixTypeExpression</i> <b>?</b></td>
    </tr>
</table>

**Verification**

<i>TypeExpression</i> : <b>?</b> <i>NoQuestionPrefixTypeExpression</i>

* Return the verification result of <i>NoQuestionPrefixTypeExpression</i> if it is the `Optional` type.
* Return an `Optional` type consisting of the verification result of <i>NoQuestionPrefixTypeExpression</i>.

<i>NoQuestionPrefixTypeExpression</i> : <b>*</b>

* Return the any type.

<i>NoQuestionPrefixTypeExpression</i> : <i>Identifier</i>

* Let *p* be *ResolveProperty*(*current scope*, undefined, string of <i>Identifier</i>)
* It is a verify error if *p* is undefined.
* It is a verify error if [*PropertyIsVisible*](*p*, *current scope*) is false.
* Return *p*.

<i>NoQuestionPrefixTypeExpression</i> : <b>void</b>

* Return the void type.

<i>NoQuestionPrefixTypeExpression</i> : <b>undefined</b>

* Return the void type.

<i>NoQuestionPrefixTypeExpression</i> : <i>TupleTypeExpression</i>

* Return the verification of <i>TupleTypeExpression</i>.

<i>NoQuestionPrefixTypeExpression</i> : <i>FunctionTypeExpression</i>

* Return the verification of <i>FunctionTypeExpression</i>.

<i>NoQuestionPrefixTypeExpression</i> : <b>&#x5B;</b> <i>TypeExpression</i> <b>&#x5D;</b>

* Return an array type consisting of the verification result of <i>TypeExpression</i>.

<i>NoQuestionPrefixTypeExpression</i> : <b>&#x28;</b> <i>TypeExpression</i> <b>&#x29;</b>

* Return the verification result of <i>TypeExpression</i>.

<i>NoQuestionPrefixTypeExpression</i> : <i>NoQuestionPrefixTypeExpression</i> <b>.</b> <i>IdentifierName</i>

* Let *base* be the verification result of <i>NoQuestionPrefixTypeExpression</i>.
* Let *p* be *ResolveProperty*(*base*, undefined, string of <i>IdentifierName</i>)
* It is a verify error if *p* is undefined.
* It is a verify error if [*PropertyIsVisible*](*p*, *current scope*) is false.
* Return *p*.

[*PropertyIsVisible*]: visibility.md#propertyisvisible