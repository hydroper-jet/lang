# Primary expressions

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>PrimaryExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>NullLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BooleanLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>NumericLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>StringLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ThisLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>RegularExpressionLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>QualifiedIdentifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLInitializer</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ParenListExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ArrayInitializer</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ObjectInitializer</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>EmbedExpression</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>NullLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>null</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>BooleanLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>true</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>false</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ThisLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>this</b></td>
    </tr>
</table>

**Verification**

<i>PrimaryExpression</i> : <i>NullLiteral</i>

* If the context type is `T?`
  * Return a `null` constant of the context type.
* Return a `null` constant of the `*` type.

<i>PrimaryExpression</i> : <i>NumericLiteral</i>

* If the context type is `N` or `N?` where `N` is a number type
  * Return a number constant consisting of the <i>NumericLiteral</i> mathematical value of the context type.
* Return a number constant consisting of the <i>NumericLiteral</i> mathematical value of the `Number` type.

<i>PrimaryExpression</i> : <i>StringLiteral</i>

* If the context type is `Char` or `Char?`
  * It is a verify error if the string value of <i>StringLiteral</i> does not consist of a single Unicode Scalar Value.
  * Return a `Char` constant of the context type whose value is the first Unicode Scalar Value of the <i>StringLiteral</i> string value.
* If the context type is `E` or `E?` where `E` is an `enum`
  * Let *s* be the string value of <i>StringLiteral</i>.
  * It is a verify error if `E` contains no `enum` member with a string equals *s*.
  * Return an `enum` constant, of the context type, identifying the `enum` member of `E` with a string equals *s*.
* Return a string constant of the `String` type consisting of the string value of <i>StringLiteral</i>.

<i>PrimaryExpression</i> : <i>QualifiedIdentifier</i>

* Let (*qual*, *key*) be the result of verifying the nonterminal symbol on right-hand side of the production.
* Let *r* be *ResolveProperty*(*current scope*, *qual*, *key*).
* It is a verify error if [*PropertyIsVisible*](*r*, *current scope*) is false.
* It is a verify error if *r* is a reference value that references a type parameterized type and the expression is not followed by <i>TypeArguments</i>.
* It is a verify error if *r* is a reference value that references a type parameterized function and the expression is not followed by <i>TypeArguments</i>.
* If *r* is a reference value to a constant *c* that sets the \[\[*ConstantInitializer*\]\] property
  * Return *c*\[\[*ConstantInitializer*\]\]
* Return *r*.

<i>PrimaryExpression</i> : <i>ThisLiteral</i>

* Let *act* be the enclosing activation.
* It is a verify error if *act* is undefined or if *act*\[\[*This*\]\] is undefined.
* Return *act*\[\[*This*\]\].

<i>PrimaryExpression</i> : <i>RegularExpressionLiteral</i>

* Return a value of type `RegExp`.

<i>PrimaryExpression</i> : <i>BooleanLiteral</i>

* If <i>BooleanLiteral</i> is <b>true</b>, return a boolean constant of value `true` of the `Boolean` type.
* Return a boolean constant of value `false` of the `Boolean` type.

<i>PrimaryExpression</i> : <i>ParenListExpression</i>

* Return the result of verifying nonterminal symbol on right-hand side of the production.

<i>PrimaryExpression</i> : <i>EmbedExpression</i>

* Return the result of verifying nonterminal symbol on right-hand side of the production.

[*PropertyIsVisible*]: ../visibility.md#propertyisvisible