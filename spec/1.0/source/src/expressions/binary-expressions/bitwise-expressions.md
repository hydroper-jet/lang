# Bitwise Expressions

**Syntax**

<ul>
    <i>BitwiseAndExpression</i><sup>β</sup> :
    <ul>
        <i>EqualityExpression</i><sup>β</sup><br>
        <i>BitwiseAndExpression</i><sup>β</sup> <b>&amp;</b> <i>EqualityExpression</i><sup>β</sup>
    </ul>
</ul>

<ul>
    <i>BitwiseXorExpression</i><sup>allowIn</sup> :
    <ul>
        <i>BitwiseAndExpression</i><sup>β</sup><br>
        <i>BitwiseXorExpression</i><sup>β</sup> <b>^</b> <i>BitwiseAndExpression</i><sup>β</sup>
    </ul>
</ul>

<ul>
    <i>BitwiseOrExpression</i><sup>allowIn</sup> :
    <ul>
        <i>BitwiseXorExpression</i><sup>β</sup><br>
        <i>BitwiseOrExpression</i><sup>β</sup> <b>|</b> <i>BitwiseXorExpression</i><sup>β</sup>
    </ul>
</ul>