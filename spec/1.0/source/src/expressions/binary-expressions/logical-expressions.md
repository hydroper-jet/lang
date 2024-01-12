# Logical expressions

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>LogicalAndExpression</i><sub>[allowIn]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseOrExpression</i><sub>[allowIn]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LogicalAndExpression</i><sub>[allowIn]</sub> <b>&amp;&amp;</b> <i>BitwiseOrExpression</i><sub>[allowIn]</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>LogicalXorExpression</i><sub>[allowIn=true]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LogicalAndExpression</i><sub>[allowIn]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LogicalXorExpression</i><sub>[allowIn]</sub> <b>^^</b> <i>LogicalAndExpression</i><sub>[allowIn]</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>LogicalOrExpression</i><sub>[allowIn=true]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LogicalXorExpression</i><sub>[allowIn]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LogicalOrExpression</i><sub>[allowIn]</sub> <b>||</b> <i>LogicalXorExpression</i><sub>[allowIn]</sub></td>
    </tr>
</table>