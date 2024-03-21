# Type Definition

A type definition is used to define an alias to an existing type.

```
type M = Map.<Number, String>;
```

**Syntax**

<ul>
    <i>TypeDefinition</i> :
    <ul>
        <b>type</b> <i>IdentifierName</i> <b>=</b> <i>TypeExpression</i>
    </ul>
</ul>

**Nesting**

Nested type definitions are not allowed. Type definitions are only allowed in package blocks and top-level blocks.

## Type Definition Attributes

Type definitions may be modified by the following attributes:

| Attribute       | Description |
| --------------- | ----------- |
| **public**        | Uses the **public** visibility |
| **internal**      | Uses the **internal** visibility (default) |