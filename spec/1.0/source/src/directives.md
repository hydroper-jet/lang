# Directives

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>Directive</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>EmptyStatement</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Statement</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Attributes</i><sub>opt</sub> <i>AnnotatableDirective</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ImportDirective</i> <i>Semicolon</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>UseDirective</i> <i>Semicolon</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ConfigurationDirective</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>AnnotatableDirective</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>VariableDefinition</i><sup>allowIn</sup> <i>Semicolon</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FunctionDefinition</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ClassDefinition</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>EnumDefinition</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>InterfaceDefinition</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TypeDefinition</i> <i>Semicolon</i><sup>ω</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>Directives</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>DirectivesPrefix</i> <i>Directive</i><sup>abbrev</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>DirectivesPrefix</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>DirectivesPrefix</i> <i>Directive</i><sup>full</sup></td>
    </tr>
</table>