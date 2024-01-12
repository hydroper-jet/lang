# Arrow functions

Arrow functions may specify a typed signature. The arrow signature may be specified either as a parenthesized list of parameter bindings or as a single parameter binding.

```
const f: F = () => {}
const f: F2 = a => a + 1
```

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>ArrowFunction</i><sub>[allowIn]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ArrowParameters</i> <b>=&gt;</b> <i>ConciseBody</i><sub>[allowIn]</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ConciseBody</i><sub>[allowIn]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[lookahead ≠ <b>&#x7B;</b>] <i>AssignmentExpression</i><sub>[allowIn]</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Block</i></td>
    </tr>
</table>

> **Missing**: <i>ArrowParameters</i> nonterminal