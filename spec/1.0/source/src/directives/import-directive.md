# Import directive

```
package x.y {
    public const z: String = "x.y"
}
import w = x.y.*
trace(w.z)
```

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>ImportDirective</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>import</b> <i>PackageName</i> <b>. *</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>import</b> <i>PackageName</i> <b>.</b> <i>IdentifierName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>import</b> <i>Identifier</i> <b>=</b> <i>PackageName</i> <b>. *</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>import</b> <i>Identifier</i> <b>=</b> <i>PackageName</i> <b>.</b> <i>IdentifierName</i></td>
    </tr>
</table>