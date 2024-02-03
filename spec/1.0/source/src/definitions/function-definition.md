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
| `public`        | Uses the `public` visibility. Default if at `interface` block. |
| `private`       | Uses the `private` visibility |
| `protected`     | Uses the `protected` visibility |
| `internal`      | Uses the `internal` visibility. Default if not at `interface` block. |
| `[Test]`        | Designates a test function. |

A getter or setter function must not contain *TypeParameters*.

An interface method may contain meta-data, but must not contain any other attributes.

A proxy method must not contain a visibility attribute.

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

**Semantics**

Interface methods may specify or omit the body.

```
interface I {
    function f1();
    function f2() {}
}
```

Functions that are not interface methods and are marked `native` or `abstract` must omit the body.

```
native function f();
class C {
    abstract function f();
}
```

Functions that are not interface methods and are not marked `native` or `abstract` must specify the body.

```
function f() {}
```

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

**Semantics**

*Constructor restrictions*: A constructor must not specify *ResultType*.

```
class C {
    function C() {}
}
```

*Getter restrictions*: A getter signature must contain no parameters. If there is a corresponding setter, that setter must take a parameter of the exact same type as the result type of the getter.

```
function get x() 10
```

*Setter restrictions*: A setter signature must contain exactly one parameter and return `void`. If there is a corresponding getter, that getter must return the exact same type as the first parameter type of the setter.

```
function set x(v) {}
```

*Type inference*: The constructor and setter signatures always return `void`. The default result type of a signature is the any type (`*`).

```
class C {
    function C() {
        // Signature of this constructor is "function(): void"
    }
}

function set x(v) {
    // Signature of this setter is "function(v: *): void"
}

function f() {
    // Signature of this function is "function(): *"
}
```

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