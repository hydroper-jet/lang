# Bitwise expressions

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>BitwiseAndExpression</i><sub>[allowIn]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>EqualityExpression</i><sub>[allowIn]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseAndExpression</i><sub>[allowIn]</sub> <b>&amp;</b> <i>EqualityExpression</i><sub>[allowIn]</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>BitwiseXorExpression</i><sub>[allowIn=true]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseAndExpression</i><sub>[allowIn]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseXorExpression</i><sub>[allowIn]</sub> <b>^</b> <i>BitwiseAndExpression</i><sub>[allowIn]</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>BitwiseOrExpression</i><sub>[allowIn=true]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseXorExpression</i><sub>[allowIn]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseOrExpression</i><sub>[allowIn]</sub> <b>|</b> <i>BitwiseXorExpression</i><sub>[allowIn]</sub></td>
    </tr>
</table>