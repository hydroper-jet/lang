# Interface Definition

**Syntax**

<ul>
    <i>InterfaceDefinition</i> :
    <ul>
        <b>interface</b> <i>IdentifierName</i> <i>TypeParameters</i><sub>opt</sub> <i>ExtendsList</i> <i>Block</i>
    </ul>
</ul>

**Semantics**

The interface block must only contain function definitions.

**Nesting**

Nested interfaces are not allowed. Interfaces are only allowed in package blocks and top-level blocks.

## Interface Attributes

Interface definitions may be modified by the following attributes:

| Attribute       | Description |
| --------------- | ----------- |
| **public**        | Uses the **public** visibility |
| **internal**      | Uses the **internal** visibility (default) |

## Interface Inheritance

**Syntax**

<ul>
    <i>ExtendsList</i> :
    <ul>
        «empty»<br>
        <b>extends</b> <i>TypeExpressionList</i>
    </ul>
</ul>