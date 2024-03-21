# Relational Expressions

**Syntax**

<ul>
    <i>RelationalExpression</i><sup>β</sup> :
    <ul>
        <i>ShiftExpression</i><br>
        <i>RelationalExpression</i><sup>β</sup> <b>&gt;</b> <i>ShiftExpression</i><br>
        <i>RelationalExpression</i><sup>β</sup> <b>&lt;</b> <i>ShiftExpression</i><br>
        <i>RelationalExpression</i><sup>β</sup> <b>&lt;=</b> <i>ShiftExpression</i><br>
        <i>RelationalExpression</i><sup>β</sup> <b>&gt;=</b> <i>ShiftExpression</i><br>
        <i>RelationalExpression</i><sup>β</sup> <b>as</b> <i>ShiftExpression</i><br>
        <i>RelationalExpression</i><sup>β</sup> <b>is</b> <i>ShiftExpression</i><br>
        <i>RelationalExpression</i><sup>β</sup> <b>is not</b> <i>ShiftExpression</i><br>
        [β = allowIn] <i>RelationalExpression</i><sup>β</sup> <b>in</b> <i>ShiftExpression</i><br>
        [β = allowIn] <i>RelationalExpression</i><sup>β</sup> <b>not in</b> <i>ShiftExpression</i>
    </ul>
</ul>