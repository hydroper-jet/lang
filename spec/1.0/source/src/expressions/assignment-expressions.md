# Assignment Expressions

**Syntax**

<ul>
    <i>AssignmentExpression</i><sup>β</sup> :
    <ul>
        <i>ConditionalExpression</i><sup>β</sup><br>
        <b>yield</b> [no line break] <i>AssignmentExpression</i><sup>β</sup><br>
        <i>FunctionExpression</i><sup>β</sup><br>
        <i>AssignmentLeftHandSide</i> <b>=</b> <i>AssignmentExpression</i><sup>β</sup><br>
        <i>PostfixExpression</i> <i>CompoundAssignmentPunctuator</i> <i>AssignmentExpression</i><sup>β</sup><br>
        <i>PostfixExpression</i> <n>/=</b> <i>AssignmentExpression</i><sup>β</sup>
    </ul>
</ul>

<ul>
    <i>AssignmentLeftHandSide</i> :
    <ul>
        <i>ArrayDestructuring</i><br>
        <i>ObjectDestructuring</i><br>
        <i>PostfixExpression</i> [but not <i>ArrayDestructuring</i> or <i>ObjectDestructuring</i>]
    </ul>
</ul>

**Verification**

<i>AssignmentExpression</i><sup>β</sup> : <i>ConditionalExpression</i><sup>β</sup>

* Return the result of verifying the nonterminal symbol on right-hand side of the production.

<i>AssignmentExpression</i><sup>β</sup> : <i>FunctionExpression</i><sup>β</sup>

* Return the result of verifying the nonterminal symbol on right-hand side of the production.