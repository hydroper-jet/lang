# Call expressions

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>Arguments</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>(</b> <b>)</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>(</b> <i>ListExpression</i><sup>allowIn</sup> <b>)</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ArgumentList</i><sup>allowIn</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>AssignmentExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ArgumentList</i><sup>β</sup> <b>,</b> <i>AssignmentExpression</i><sup>β</sup></td>
    </tr>
</table>

**Semantics**

Call expression over a type base is equivalent to an explicit type conversion. In the following program, `v` is verified with the context type `T` and then explicitly converted to `T`.

```
T(v)
```