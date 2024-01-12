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

> **Missing**: <i>DestructuringOrPostfixExpression</i> nonterminal. Such nonterminal means *either a destructuring pattern or a postfix expression*.