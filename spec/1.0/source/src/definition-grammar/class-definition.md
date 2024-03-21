# Class Definition

**Syntax**

<ul>
    <i>ClassDefinition</i> :
    <ul>
        <b>class</b> <i>IdentifierName</i> <i>TypeParameters</i><sub>opt</sub> <i>Inheritance</i> <i>Block</i>
    </ul>
</ul>

**Nesting**

Nested classes are not allowed. Classes are only allowed in package blocks and top-level blocks.

## Class Attributes

A class definition may be modified by the following attributes:

| Attribute       | Description |
| --------------- | ----------- |
| **static**        | Designates a static class. |
| **final**         | Designates a final class. |
| **abstract**      | Designates an abstract class. |
| **public**        | Uses the **public** visibility |
| **internal**      | Uses the **internal** visibility (default) |
| **\[Literal]**    | Designates a class that may be constructed by an object initializer. |

## Class Inheritance

**Syntax**

<ul>
    <i>Inheritance</i> :
    <ul>
        «empty»<br>
        <b>extends</b> <i>TypeExpression</i><br>
        <b>implements</b> <i>TypeExpressionList</i><br>
        <b>extends</b> <i>TypeExpression</i> <b>implements</b> <i>TypeExpressionList</i>
    </ul>
</ul>