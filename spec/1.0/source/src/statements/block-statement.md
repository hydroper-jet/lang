# Block statement

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>Block</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&#x7B;</b> <i>Directives</i> <b>&#x7D;</b></td>
    </tr>
</table>

**Semantics**

The block statement is allowed to contain only plain meta-data.

```
[[N1(n2 = 10)]]
{
    trace("Log")
}
```