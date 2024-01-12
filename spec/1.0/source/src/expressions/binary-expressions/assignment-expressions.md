# Assignment expressions

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>AssignmentExpression</i><sub>[allowIn]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ConditionalExpression</i><sub>[allowIn]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>yield</b> [no line break] <i>AssignmentExpression</i><sub>[allowIn]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ArrowFunction</i><sub>[allowIn]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>DestructuringOrPostfixExpression</i> <b>=</b> <i>AssignmentExpression</i><sub>[allowIn]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>PostfixExpression</i><sub>[allowIn]</sub> <i>CompoundAssignmentPunctuator</i> <i>AssignmentExpression</i><sub>[allowIn]</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>DestructuringOrPostfixExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Destructuring</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>PostfixExpression</i></td>
    </tr>
</table>