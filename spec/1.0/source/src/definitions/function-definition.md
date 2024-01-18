# Function definition

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>FunctionDefinition</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>function</b> <i>FunctionName</i> <i>TypeParameters</i><sub>opt</sub> <i>FunctionCommon</i><sup>allowIn</sup></td>
    </tr>
</table>

**Semantics**

A *FunctionDefinition* may be modified by the following attributes:

| Attribute       | Description |
| --------------- | ----------- |
| `static`        | Adds property to the enclosing class's \[\[*StaticProperties*\]\] internal property. |
| `final`         | Designates a final instance method. |
| `override`      | Overrides a base class method. |
| `abstract`      | Designates an abstract instance method. |
| `native`        | Designates a native function with native stub. |
| `proxy`         | Designates a proxy method. |
| `public`        | Uses the `public` visibility |
| `private`       | Uses the `private` visibility |
| `protected`     | Uses the `protected` visibility |
| `internal`      | Uses the `internal` visibility (default) |
| `[Test]`        | Designates a test function. |

A getter or setter function must not contain *TypeParameters*.

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>FunctionName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>IdentifierName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>get</b> [no line break] <i>IdentifierName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>set</b> [no line break] <i>IdentifierName</i></td>
    </tr>
</table>

*FunctionName* is used inside *FunctionDefinition*.

```
function f(): void {}

function get x(): Number (impl.x)

function set x(v: Number): void { impl.x = v }
```

## Function body

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>FunctionCommon</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FunctionSignature</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FunctionSignature</i> [lookahead ∉ { <b>&#x7B;</b> }] <i>AssignmentExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FunctionSignature</i> <i>Block</i></td>
    </tr>
</table>

## Function signature

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>FunctionSignature</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>(</b> <i>Parameters</i> <b>)</b> <i>ResultType</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ResultType</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>:</b> <i>TypeExpression</i></td>
    </tr>
</table>

## Parameter list

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>Parameters</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>NonemptyParameters</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>NonemptyParameters</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Parameter</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Parameter</i> <b>,</b> <i>NonemptyParameters</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>RestParameter</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>Parameter</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TypedDestructuring</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TypedDestructuring</i> <b>=</b> <i>AssignmentExpression</i><sup>allowIn</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>RestParameter</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>...</b> <i>TypedDestructuring</i></td>
    </tr>
</table>