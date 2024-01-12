# Enum definition

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>EnumDefinition</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>enum</b> <i>IdentifierName</i> <i>EnumRepresentation</i><sub>opt</sub> <i>Block</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>EnumRepresentation</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>as</b> <i>TypeExpression</i></td>
    </tr>
</table>

**Semantics**

An enum definition may be modified by the following attributes:

| Attribute       | Description |
| --------------- | ----------- |
| `public`        | Uses the `public` visibility |
| `internal`      | Uses the `internal` visibility (default) |
| `[Set]`         | Designates a Set `enum`. |

*Nesting*: nested enums are not allowed. Enums are only allowed in package blocks and top-level blocks.