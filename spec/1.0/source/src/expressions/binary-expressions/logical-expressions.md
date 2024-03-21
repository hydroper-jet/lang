# Logical Expressions

**Syntax**

<ul>
    <i>LogicalAndExpression</i><sup>β</sup> :
    <ul>
        <i>BitwiseOrExpression</i><sup>β</sup><br>
        <i>LogicalAndExpression</i><sup>β</sup> <b>&amp;&amp;</b> <i>BitwiseOrExpression</i><sup>β</sup>
    </ul>
</ul>

<ul>
    <i>LogicalXorExpression</i><sup>allowIn</sup> :
    <ul>
        <i>LogicalAndExpression</i><sup>β</sup><br>
        <i>LogicalXorExpression</i><sup>β</sup> <b>^^</b> <i>LogicalAndExpression</i><sup>β</sup>
    </ul>
</ul>

<ul>
    <i>LogicalOrExpression</i><sup>allowIn</sup> :
    <ul>
        <i>LogicalXorExpression</i><sup>β</sup><br>
        <i>LogicalOrExpression</i><sup>β</sup> <b>||</b> <i>LogicalXorExpression</i><sup>β</sup>
    </ul>
</ul>