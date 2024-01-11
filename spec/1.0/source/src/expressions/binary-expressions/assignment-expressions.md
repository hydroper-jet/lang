# Assignment expressions

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>AssignmentExpression</i><sub>[In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ConditionalExpression</i><sub>[?In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>yield</b> [no line break] <i>AssignmentExpression</i><sub>[?In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ArrowFunction</i><sub>[?In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>DestructuringOrPostfixExpression</i><sub>[?In]</sub> <b>=</b> <i>AssignmentExpression</i><sub>[?In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>PostfixExpression</i><sub>[?In]</sub> <i>CompoundAssignmentPunctuator</i> <i>AssignmentExpression</i><sub>[?In]</sub></td>
    </tr>
</table>

> **Missing**: <i>DestructuringOrPostfixExpression</i> nonterminal. Such nonterminal means *either a destructuring pattern or a postfix expression*.