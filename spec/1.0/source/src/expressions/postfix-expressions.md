# Postfix Expressions

**Syntax**

<ul>
    <i>PostfixExpression</i> :
    <ul>
        <i>FullPostfixExpression</i><br>
        <i>ShortNewExpression</i>
    </ul>
</ul>

<ul>
    <i>FullPostfixExpression</i> :
    <ul>
        <i>PrimaryExpression</i><br>
        <i>MetaProperty</i><br>
        <i>FullNewExpression</i><br>
        <i>FullPostfixExpression</i> <i>PropertyOperator</i><br>
        <i>SuperExpression</i> <i>PropertyOperator</i><br>
        <i>FullPostfixExpression</i> <i>NonNull</i><br>
        <i>FullPostfixExpression</i> <i>Arguments</i><br>
        <i>FullPostfixExpression</i> <i>TypeArguments</i><br>
        <i>FullPostfixExpression</i> <i>QueryOperator</i><br>
        <i>FullPostfixExpression</i> [no line break] <b>++</b><br>
        <i>FullPostfixExpression</i> [no line break] <b>--</b><br>
        <i>FullPostfixExpression</i> <i>OptionalChaining</i>
    </ul>
</ul>

<ul>
    <i>NonNull</i> :
    <ul>
        <b>!</b>
    </ul>
</ul>

<ul>
    <i>OptionalChaining</i> :
    <ul>
        <b>?.</b> <i>QualifiedIdentifier</i><br>
        <b>?.</b> <i>Brackets</i><br>
        <b>?.</b> <i>Arguments</i><br>
        <i>OptionalChaining</i> <i>PropertyOperator</i><br>
        <i>OptionalChaining</i> <i>NonNull</i><br>
        <i>OptionalChaining</i> <i>Arguments</i><br>
        <i>OptionalChaining</i> <i>TypeArguments</i><br>
        <i>OptionalChaining</i> <i>QueryOperator</i><br>
        <i>OptionalChaining</i> <i>OptionalChaining</i>
    </ul>
</ul>

**Semantics**

Fully qualified names are preprocessed on postfix expressions by calling [*ResolveFullyQualifiedName*](postfix expression).

[*ResolveFullyQualifiedName*]: #sec-resolvefullyqualifiedname