# Package definition

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>PackageDefinition</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>package</b> <i>PackageName</i><sub>opt</sub> <i>Block</i></td>
    </tr>
</table>

A *PackageDefinition* may be used in a *Program* before any *Directive* that is not a *PackageDefinition* is used.

```
package p {
    public class A {}
    public interface I {}
}
package q {
    public var x: Number = 10
    public function f(): void {}
}
import p.*
import q.f
import y = q.x
class B extends A implements I {}
q.f()
trace(x)
```

## Package name

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>PackageName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Identifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>PackageName</i> <b>.</b> <i>IdentifierName</i></td>
    </tr>
</table>