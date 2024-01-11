# For statements

The `for..in` statement is used to iterate the keys of an object through the `keys` proxy.

```
const map = new Map.<*, *>

for (const key in map) {
    trace(key)
}
```

The `for each` statement is used to either iterate the values of an `Iterator` implementor or iterate the values of an object through the `values` proxy.

```
for each (const value in array) {
    trace(value)
}
```

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>ForStatement</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>for &#x28;</b> <i>ForInitializer</i> <b>;</b> <i>ListExpression</i><sub>[In] opt</sub> <b>;</b> <i>ListExpression</i><sub>[In] opt</sub> <b>&#x29;</b> <i>Substatement</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>for &#x28;</b> <i>ForInBinding</i> <b>in</b> <i>ListExpression</i><sub>[In] opt</sub> <b>&#x29;</b> <i>Substatement</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>for</b> [no line break] <b>each &#x28;</b> <i>ForInBinding</i> <b>in</b> <i>ListExpression</i><sub>[In] opt</sub> <b>&#x29;</b> <i>Substatement</i><sup>ω</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ForInitializer</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ListExpression</i><sub>[!In]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>VariableDefinition</i><sub>[!In]</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ForInBinding</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>PostfixExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>VariableDefinitionKind</i> <i>VariableBinding</i><sub>[!In]</sub></td>
    </tr>
</table>