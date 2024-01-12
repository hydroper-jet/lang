# Logical expressions

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>LogicalAndExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseOrExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LogicalAndExpression</i><sup>β</sup> <b>&amp;&amp;</b> <i>BitwiseOrExpression</i><sup>β</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>LogicalXorExpression</i><sup>allowIn</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LogicalAndExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LogicalXorExpression</i><sup>β</sup> <b>^^</b> <i>LogicalAndExpression</i><sup>β</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>LogicalOrExpression</i><sup>allowIn</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LogicalXorExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LogicalOrExpression</i><sup>β</sup> <b>||</b> <i>LogicalXorExpression</i><sup>β</sup></td>
    </tr>
</table>