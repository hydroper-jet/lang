# New expressions

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>FullNewExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>new</b> <i>FullNewSubexpression</i> <i>Arguments</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>FullNewSubexpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>PrimaryExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullNewExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullNewSubexpression</i> <i>PropertyOperator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SuperExpression</i> <i>PropertyOperator</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ShortNewExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>new</b> <i>ShortNewSubexpression</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ShortNewSubexpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullNewSubexpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ShortNewExpression</i></td>
    </tr>
</table>

**Semantics**

The new expression is used to instantiate a class.

The new expression may not be used to instantiate static classes.