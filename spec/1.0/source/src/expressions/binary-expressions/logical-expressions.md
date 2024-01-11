# Logical expressions

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>LogicalAndExpression</i><sub>[In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseOrExpression</i><sub>[?In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LogicalAndExpression</i><sub>[?In]</sub> <b>&amp;&amp;</b> <i>BitwiseOrExpression</i><sub>[?In]</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>LogicalXorExpression</i><sub>[In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LogicalAndExpression</i><sub>[?In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LogicalXorExpression</i><sub>[?In]</sub> <b>^^</b> <i>LogicalAndExpression</i><sub>[?In]</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>LogicalOrExpression</i><sub>[In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LogicalXorExpression</i><sub>[?In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LogicalOrExpression</i><sub>[?In]</sub> <b>||</b> <i>LogicalXorExpression</i><sub>[?In]</sub></td>
    </tr>
</table>