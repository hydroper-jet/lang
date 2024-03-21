# Parenthesized Expressions

**Syntax**

<ul>
    <i>ParenExpression</i> :
    <ul>
        <b>(</b> <i>AssignmentExpression</i><sup>allowIn</sup> <b>)</b>
    </ul>
</ul>

<ul>
    <i>ParenListExpression</i> :
    <ul>
        <i>ParenExpression</i><br>
        <b>(</b> <i>ListExpression</i><sup>allowIn</sup> <b>,</b> <i>AssignmentExpression</i><sup>allowIn</sup> <b>)</b>
    </ul>
</ul>