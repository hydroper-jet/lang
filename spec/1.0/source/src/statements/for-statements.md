# For Statements

The **for..in** statement is used to iterate the keys of an object through the **keys**() proxy.

```
for (const key in map) {
    trace(key)
}
```

The **for each** statement is used to either iterate the values of an **Iterator** implementor or iterate the values of an object through the **values**() proxy.

```
for each (const value in array) {
    trace(value)
}
```

**Syntax**

<ul>
    <i>ForStatement</i><sup>ω</sup> :
    <ul>
        <b>for &#x28;</b> <i>ForInitializer</i> <b>;</b> <i>ListExpression</i><sup>allowIn</sup><sub>opt</sub> <b>;</b> <i>ListExpression</i><sup>allowIn</sup><sub>opt</sub> <b>&#x29;</b> <i>Substatement</i><sup>ω</sup><br>
        <b>for &#x28;</b> <i>ForInBinding</i> <b>in</b> <i>ListExpression</i><sup>allowIn</sup> <b>&#x29;</b> <i>Substatement</i><sup>ω</sup><br>
        <b>for</b> [no line break] <b>each &#x28;</b> <i>ForInBinding</i> <b>in</b> <i>ListExpression</i><sup>allowIn</sup> <b>&#x29;</b> <i>Substatement</i><sup>ω</sup>
    </ul>
</ul>

<ul>
    <i>ForInitializer</i> :
    <ul>
        «empty»<br>
        <i>ListExpression</i><sup>noIn</sup><br>
        <i>VariableDefinition</i><sup>noIn</sup>
    </ul>
</ul>

<ul>
    <i>ForInBinding</i> :
    <ul>
        <i>PostfixExpression</i><br>
        <i>VariableDefinitionKind</i> <i>VariableBinding</i><sup>noIn</sup>
    </ul>
</ul>