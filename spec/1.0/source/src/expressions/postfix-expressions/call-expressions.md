# Call Expressions

**Syntax**

<ul>
    <i>Arguments</i> :
    <ul>
        <b>(</b> <b>)</b><br>
        <b>(</b> <i>ListExpression</i><sup>allowIn</sup> <b>)</b>
    </ul>
</ul>

<ul>
    <i>ArgumentList</i><sup>allowIn</sup> :
    <ul>
        <i>AssignmentExpression</i><sup>β</sup><br>
        <i>ArgumentList</i><sup>β</sup> <b>,</b> <i>AssignmentExpression</i><sup>β</sup>
    </ul>
</ul>

**Semantics**

The call operator over a type base is equivalent to an explicit type conversion. In the following program, **v** is verified with the context type **T** and then explicitly converted to **T**.

```
T(v)
```