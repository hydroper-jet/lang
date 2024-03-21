# Package Definition

**Syntax**

<ul>
    <i>PackageDefinition</i> :
    <ul>
        <b>package</b> <i>PackageName</i><sub>opt</sub> <i>Block</i>
    </ul>
</ul>

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

## Package Name

**Syntax**

<ul>
    <i>PackageName</i> :
    <ul>
        <i>Identifier</i><br>
        <i>PackageName</i> <b>.</b> <i>IdentifierName</i>
    </ul>
</ul>