# Switch statement

The switch statement is similiar to that of Java. Unlike in Java, the switch statement does not include fallthroughs.

A switch statement applied to a discriminant whose context type is an `enum` must be exhaustive and it must contain case elements matching all of the `enum` members.

```
switch (item.category) {
    case "fine":
    case "moderate":
        trace("Fine")
    default:
        trace("Something else")
}
```

The `switch type` statement is used to match the type of a discriminant value.

```
switch type (v) {
    case (d: Date) {
        // d: Date
    }
    default {
        // No matched case
    }
}
```

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>SwitchStatement</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>switch</b> <i>ParenListExpression</i> <b>&#x7B;</b> <i>CaseElements</i><sup>abbrev</sup> <b>&#x7D;</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>switch</b> [no line break] <b>type</b> <i>ParenListExpression</i> <b>&#x7B;</b> <i>TypeCaseElements</i> <b>&#x7D;</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>CaseElements</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>CaseElement</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>CaseElements</i><sup>full</sup> <i>CaseElement</i><sup>ω</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>CaseElement</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>CaseLabel</i><sub>{1,}</sub> <i>CaseDirectives</i><sup>ω</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>CaseLabel</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>case</b> <i>ListExpression</i><sup>allowIn</sup> <b>:</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>default :</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>CaseDirectives</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Directive</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>CaseDirectives</i><sup>full</sup> <i>Directive</i><sup>ω</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>TypeCaseElements</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TypeCaseElement</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TypeCaseElements</i> <i>TypeCaseElement</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>TypeCaseElement</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>case &#x28;</b> <i>TypedDestructuring</i> <b>&#x29;</b> <i>Block</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>default</b> <i>Block</i></td>
    </tr>
</table>