# Enum Definition

**Syntax**

<ul>
    <i>EnumDefinition</i> :
    <ul>
        <b>enum</b> <i>IdentifierName</i> <i>EnumNumericType</i><sub>opt</sub> <i>Block</i>
    </ul>
</ul>

<ul>
    <i>EnumNumericType</i> :
    <ul>
        <b>as</b> <i>TypeExpression</i>
    </ul>
</ul>

**Semantics**

An enum definition may be modified by the following attributes:

| Attribute       | Description |
| --------------- | ----------- |
| **public**        | Uses the **public** visibility |
| **internal**      | Uses the **internal** visibility (default) |
| **\[Set]**        | Designates a set enumeration. |

**Nesting**

Nested enums are not allowed. Enums are only allowed in package blocks and top-level blocks.