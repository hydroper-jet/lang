# Variable definition

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>VariableDefinition</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>VariableDefinitionKind</i> <i>VariableBindingList</i><sup>β</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>VariableDefinitionKind</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>var</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>const</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>VariableBindingList</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>VariableBinding</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>VariableBindingList</i><sup>β</sup> <b>,</b> <i>VariableBinding</i><sup>β</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>VariableBinding</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TypedDestructuring</i> <i>VariableInitialization</i><sup>β</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>VariableInitialization</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>=</b> <i>AssignmentExpression</i><sup>β</sup></td>
    </tr>
</table>

**Semantics**

*Local variables*: variables of an activation are block-scoped and shadow any previous definition.

```
const v: String = ""
const v: Number = 0
```

A *VariableDefinition* may be modified by the following attributes:

| Attribute       | Description |
| --------------- | ----------- |
| `static`        | Adds property to the enclosing class's \[\[*StaticProperties*\]\] internal property. |
| `public`        | Uses the `public` visibility |
| `private`       | Uses the `private` visibility |
| `protected`     | Uses the `protected` visibility |
| `internal`      | Uses the `internal` visibility (default) |