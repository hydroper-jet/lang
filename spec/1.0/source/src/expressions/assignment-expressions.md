# Assignment expressions

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>AssignmentExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ConditionalExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>yield</b> [no line break] <i>AssignmentExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FunctionExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>AssignmentLeftHandSide</i> <b>=</b> <i>AssignmentExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>PostfixExpression</i> <i>CompoundAssignmentPunctuator</i> <i>AssignmentExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>PostfixExpression</i> <n>/=</b> <i>AssignmentExpression</i><sup>β</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>AssignmentLeftHandSide</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ArrayDestructuring</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ObjectDestructuring</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>PostfixExpression</i> [but not <i>ArrayDestructuring</i> or <i>ObjectDestructuring</i>]</td>
    </tr>
</table>