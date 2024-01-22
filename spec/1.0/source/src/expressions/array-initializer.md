# Array initializer

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>ArrayInitializer</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>[</b> <i>Elision</i><sub>opt</sub> <b>]</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>[</b> <i>ElementList</i> <b>]</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>[</b> <i>ElementList</i> <b>,</b> <i>Elision</i><sub>opt</sub> <b>]</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>Elision</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>,</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Elision</i> <b>,</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ElementList</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Elision</i><sub>opt</sub> <i>AssignmentExpression</i><sup>allowIn</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Elision</i><sub>opt</sub> <i>InitializerRest</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ElementList</i> <b>,</b> <i>Elision</i><sub>opt</sub> <i>AssignmentExpression</i><sup>allowIn</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ElementList</i> <b>,</b> <i>Elision</i><sub>opt</sub> <i>InitializerRest</i></td>
    </tr>
</table>

**Semantics**

The verification for the array initializer requires a context type. The array initializer may be used to initialize the following context types:

* `*`
* `Object` or `Object?`
* `T` or `T?` where `T` is a tuple type
* `C` or `C?` where `C` is the `Array` type
* `E` or `E?` where `E` is a set enumeration

Initializing a context type that is one of { `*`, `Object`, `Object?` } results into an `Array.<*>` object.