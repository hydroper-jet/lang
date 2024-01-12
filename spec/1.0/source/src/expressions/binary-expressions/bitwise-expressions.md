# Bitwise expressions

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>BitwiseAndExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>EqualityExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseAndExpression</i><sup>β</sup> <b>&amp;</b> <i>EqualityExpression</i><sup>β</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>BitwiseXorExpression</i><sup>allowIn</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseAndExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseXorExpression</i><sup>β</sup> <b>^</b> <i>BitwiseAndExpression</i><sup>β</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>BitwiseOrExpression</i><sup>allowIn</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseXorExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BitwiseOrExpression</i><sup>β</sup> <b>|</b> <i>BitwiseXorExpression</i><sup>β</sup></td>
    </tr>
</table>