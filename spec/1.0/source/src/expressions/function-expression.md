# Function expression

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>FunctionExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>function</b> <i>FunctionCommon</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>function</b> <i>IdentifierName</i> <i>FunctionCommon</i><sup>β</sup></td>
    </tr>
</table>

**Semantics**

The `function` expression results in an object of a function type compliant to the function signature. The language does not perform type inference on function signatures.

```
// 30
trace([10, 20].reduce(function(acc: Number, v: Number): Number (acc + v)), 0);
```

A call to a function resulting from a `function` expression has implementation-defined behavior: the number of formal parameters may or may not be restricted to the number of call arguments.

**Verification**