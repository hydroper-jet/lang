# Type definition

A type definition is used to alias an existing type.

```
type D = Map.<UnsignedInt, String>
```

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>TypeDefinition</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>type</b> <i>IdentifierName</i> <b>=</b> <i>TypeExpression</i></td>
    </tr>
</table>

**Semantics**

*Nesting*: nested type definitions are not allowed. Type definitions are only allowed in package blocks and top-level blocks.

## Type definition attributes

Type definitions may be modified by the following attributes:

| Attribute       | Description |
| --------------- | ----------- |
| `public`        | Uses the `public` visibility |
| `internal`      | Uses the `internal` visibility (default) |