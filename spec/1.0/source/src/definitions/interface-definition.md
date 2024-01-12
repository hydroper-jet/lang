# Interface definition

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>InterfaceDefinition</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>interface</b> <i>IdentifierName</i> <i>TypeParameters</i><sub>opt</sub> <i>ExtendsList</i> <i>Block</i></td>
    </tr>
</table>

**Semantics**

*Nesting*: nested interfaces are not allowed. Interfaces are only allowed in package blocks and top-level blocks.

## Interface attributes

Interface definitions may be modified by the following attributes:

| Attribute       | Description |
| --------------- | ----------- |
| `public`        | Uses the `public` visibility |
| `internal`      | Uses the `internal` visibility (default) |

## Interface inheritance

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>ExtendsList</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>extends</b> <i>TypeExpressionList</i></td>
    </tr>
</table>