# New Expressions

**Syntax**

<ul>
    <i>FullNewExpression</i> :
    <ul>
        <b>new</b> <i>FullNewSubexpression</i> <i>Arguments</i>
    </ul>
</ul>

<ul>
    <i>FullNewSubexpression</i> :
    <ul>
        <i>PrimaryExpression</i><br>
        <i>FullNewExpression</i><br>
        <i>FullNewSubexpression</i> <i>PropertyOperator</i><br>
        <i>SuperExpression</i> <i>PropertyOperator</i>
    </ul>
</ul>

<ul>
    <i>ShortNewExpression</i> :
    <ul>
        <b>new</b> <i>ShortNewSubexpression</i>
    </ul>
</ul>

<ul>
    <i>ShortNewSubexpression</i> :
    <ul>
        <i>FullNewSubexpression</i><br>
        <i>ShortNewExpression</i>
    </ul>
</ul>

**Semantics**

The new expression is used to instantiate a class.

The new expression must not be used to instantiate **static** classes and enumerations.