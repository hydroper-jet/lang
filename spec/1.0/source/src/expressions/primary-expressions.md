# Primary expressions

<table>
    <tr>
        <td colspan="2"><i>PrimaryExpression</i></td>
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
        <td>&nbsp;</td><td><i>FunctionExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>EmbedExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ImportMetaExpression</i></td>
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

<i>PrimaryExpression</i> : <i>NumericLiteral</i>

* If the context type is `N` or `Optional.<N>` where `N` is a number type, return a number constant consisting of the <i>NumericLiteral</i> mathematical value of the context type.
* Return a number constant consisting of the <i>NumericLiteral</i> mathematical value of the `Number` type.

<i>PrimaryExpression</i> : <i>StringLiteral</i>

* If the context type is `Char` or `Optional.<Char>`
  * It is a verify error if the string value of <i>StringLiteral</i> does not consist of a single Unicode Scalar Value.
  * Return a `Char` constant of the context type whose value is the first Unicode Scalar Value of the <i>StringLiteral</i> string value.
* If the context type is `E` or `Optional.<E>` where `E` is an `enum`
  * Let *s* be the string value of <i>StringLiteral</i>.
  * It is a verify error if `E` contains no `enum` member with a string equals *s*.
  * Return an `enum` constant, of the context type, identifying the `enum` member of `E` with a string equals *s*.
* Return a string constant of the `String` type consisting of the string value of <i>StringLiteral</i>.