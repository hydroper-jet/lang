# Use directive

The `use` directive is used to export definitions from another package to the enclosing package.

```
package origin.core {}

package alias.core {
    public use origin.core.*
}
```

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>UseDirective</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>use</b> <i>PackageName</i> <b>. *</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>use</b> <i>PackageName</i> <b>.</b> <i>IdentifierName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>use</b> <i>Identifier</i> <b>=</b> <i>PackageName</i> <b>.</b> <i>IdentifierName</i></td>
    </tr>
</table>

**Semantics**

An `use` directive must be directly enclosed by a `package` scope and must contain the `public` attribute.

An `use` directive that ends with an identifier component defines an alias to a single property from a package.

An `use` directive that ends with an wildcard component contributes a redirect package to the enclosing package.