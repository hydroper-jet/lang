# Bitwise expressions

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>BitwiseAndExpression</i><sub>[In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>EqualityExpression</i><sub>[?In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseAndExpression</i><sub>[?In]</sub> <b>&amp;</b> <i>EqualityExpression</i><sub>[?In]</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>BitwiseXorExpression</i><sub>[In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseAndExpression</i><sub>[?In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseXorExpression</i><sub>[?In]</sub> <b>^</b> <i>BitwiseAndExpression</i><sub>[?In]</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>BitwiseOrExpression</i><sub>[In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseXorExpression</i><sub>[?In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseOrExpression</i><sub>[?In]</sub> <b>|</b> <i>BitwiseXorExpression</i><sub>[?In]</sub></td>
    </tr>
</table>