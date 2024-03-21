# Configuration Directive

The **configuration** directive expands blocks to the enclosing block or context if their compile time condition matches.

```
configuration {
    if (debug) {
        /* Debug */
    } else {
        /* Release */
    }
}
```

**Syntax**

<ul>
    <i>ConfigurationDirective</i> :
    <ul>
        <b>configuration</b> <b>&#x7B;</b> <i>ConfigurationSubdirective</i> <b>&#x7D;</b>
    </ul>
</ul>

<ul>
    <i>ConfigurationSubdirective</i> :
    <ul>
        <i>Block</i><br>
        <b>if (</b> <i>ConfigurationExpression</i> <b>)</b> <i>Block</i><br>
        <b>if (</b> <i>ConfigurationExpression</i> <b>)</b> <i>Block</i> <b>else</b> <i>ConfigurationSubdirective</i>
    </ul>
</ul>

<ul>
    <i>ConfigurationExpression</i> :
    <ul>
        <i>ConfigurationPrimaryExpression</i><br>
        <i>ConfigurationPrimaryExpression</i> <b>&&</b> <i>ConfigurationExpression</i><br>
        <i>ConfigurationPrimaryExpression</i> <b>||</b> <i>ConfigurationExpression</i>
    </ul>
</ul>

<ul>
    <i>ConfigurationPrimaryExpression</i> :
    <ul>
        <i>ConfigurationConstant</i><br>
        <i>ConfigurationConstant</i> <i>ConfigurationEquality</i> <i>Identifier</i><br>
        <i>ConfigurationConstant</i> <i>ConfigurationEquality</i> <i>StringLiteral</i><br>
        <b>(</b> <i>ConfigurationExpression</i> <b>)</b><br>
        <b>!</b> <i>ConfigurationPrimaryExpression</i>
    </ul>
</ul>

<ul>
    <i>ConfigurationConstant</i> :
    <ul>
        <i>Identifier</i><br>
        <i>Identifier</i> <b>::</b> <i>IdentifierName</i>
    </ul>
</ul>

<ul>
    <i>ConfigurationEquality</i> :
    <ul>
        <b>=</b><br>
        <b>!=</b>
    </ul>
</ul>

**Semantics**

A configuration expression of the form **x** is equivalent to checking whether a constant **x** is present in the JetDependencies compilation.