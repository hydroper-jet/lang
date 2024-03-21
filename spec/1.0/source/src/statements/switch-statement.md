# Switch Statement

The switch statement is similiar to that of Java. Unlike in Java, the switch statement does not include fallthroughs.

A switch statement applied to a discriminant whose context type is an **enum** must be exhaustive and it must contain case elements matching all of the **enum** members.

```
switch (item.category) {
    case "fine":
    case "moderate":
        trace("Fine")
    default:
        trace("Something else")
}
```

The **switch type** statement is used to match the type of a discriminant value.

```
switch type (v) {
    case (d: Date) {
        // Date
    }
    default {
        // No matched case
    }
}
```

**Syntax**

<ul>
    <i>SwitchStatement</i> :
    <ul>
        <b>switch</b> <i>ParenListExpression</i> <b>&#x7B;</b> <i>CaseElements</i><sup>abbrev</sup> <b>&#x7D;</b><br>
        <b>switch</b> [no line break] <b>type</b> <i>ParenListExpression</i> <b>&#x7B;</b> <i>TypeCaseElements</i> <b>&#x7D;</b>
    </ul>
</ul>

<ul>
    <i>CaseElements</i><sup>ω</sup> :
    <ul>
        «empty»<br>
        <i>CaseElement</i><sup>ω</sup><br>
        <i>CaseElements</i><sup>full</sup> <i>CaseElement</i><sup>ω</sup>
    </ul>
</ul>

<ul>
    <i>CaseElement</i><sup>ω</sup> :
    <ul>
        <i>CaseLabel</i><sub>{1,}</sub> <i>CaseDirectives</i><sup>ω</sup>
    </ul>
</ul>

<ul>
    <i>CaseLabel</i> :
    <ul>
        <b>case</b> <i>ListExpression</i><sup>allowIn</sup> <b>:</b><br>
        <b>default :</b>
    </ul>
</ul>

<ul>
    <i>CaseDirectives</i><sup>ω</sup> :
    <ul>
        <i>Directive</i><sup>ω</sup><br>
        <i>CaseDirectives</i><sup>full</sup> <i>Directive</i><sup>ω</sup>
    </ul>
</ul>

<ul>
    <i>TypeCaseElements</i> :
    <ul>
        «empty»<br>
        <i>TypeCaseElement</i><br>
        <i>TypeCaseElements</i> <i>TypeCaseElement</i>
    </ul>
</ul>

<ul>
    <i>TypeCaseElement</i> :
    <ul>
        <b>case &#x28;</b> <i>TypedDestructuring</i> <b>&#x29;</b> <i>Block</i><br>
        <b>default</b> <i>Block</i>
    </ul>
</ul>