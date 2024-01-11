# Postfix expressions

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>PostfixExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ShortNewExpression</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>FullPostfixExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>PrimaryExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>MetaProperty</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullNewExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i> <i>PropertyOperator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SuperExpression</i> <i>PropertyOperator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i> <b>!</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i> <i>Arguments</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i> <i>TypeArguments</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i> <i>QueryOperator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i> [no line break] <b>++</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i> [no line break] <b>--</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i> <i>OptionalChaining</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>OptionalChaining</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>?.</b> <i>QualifiedIdentifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>?.</b> <i>Brackets</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>?.</b> <i>Arguments</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>OptionalChaining</i> <i>PropertyOperator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>OptionalChaining</i> <b>!</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>OptionalChaining</i> <i>Arguments</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>OptionalChaining</i> <i>TypeArguments</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>OptionalChaining</i> <i>QueryOperator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>OptionalChaining</i> <i>OptionalChaining</i></td>
    </tr>
</table>