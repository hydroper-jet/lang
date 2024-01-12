# Class definition

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>ClassDefinition</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>class</b> <i>IdentifierName</i> <i>TypeParameters</i><sub>opt</sub> <i>Inheritance</i> <i>Block</i></td>
    </tr>
</table>

**Semantics**

*Nesting*: nested classes are not allowed. Classes are only allowed in package blocks and top-level blocks.

## Class attributes

A class definition may be modified by the following attributes:

| Attribute       | Description |
| --------------- | ----------- |
| `static`        | Designates a static class. |
| `final`         | Designates a final class. |
| `abstract`      | Designates an abstract class. |
| `public`        | Uses the `public` visibility |
| `internal`      | Uses the `internal` visibility (default) |
| `[Literal]`     | Designates a class that may be constructed by an object initializer. |

## Class inheritance

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>Inheritance</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>extends</b> <i>TypeExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>implements</b> <i>TypeExpressionList</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>extends</b> <i>TypeExpression</i> <b>implements</b> <i>TypeExpressionList</i></td>
    </tr>
</table>