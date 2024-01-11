# Statements

The `ω` superscript used throughout the document translates to one of the following names:

* `abbrev`
* `noShortIf`
* `full`

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>Statement</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SuperStatement</i> <i>Semicolon</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Block</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>IfStatement</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SwitchStatement</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>DoStatement</i> <i>Semicolon</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>WhileStatement</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ForStatement</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>WithStatement</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ContinueStatement</i> <i>Semicolon</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BreakStatement</i> <i>Semicolon</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ReturnStatement</i> <i>Semicolon</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ThrowStatement</i> <i>Semicolon</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TryStatement</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ExpressionStatement</i> <i>Semicolon</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LabeledStatement</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>DefaultXMLNamespaceStatement</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>Substatement</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>EmptyStatement</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Statement</i><sup>ω</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SimpleVariableDefinition</i> <i>Semicolon</i><sup>ω</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>Substatements</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SubstatementsPrefix</i> <i>Substatement</i><sup>abbrev</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>SubstatementsPrefix</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SubstatementsPrefix</i> <i>Substatement</i><sup>full</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>Semicolon</i><sup>abbrev</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>;</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>VirtualSemicolon</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>Semicolon</i><sup>noShortIf</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Semicolon</i><sup>abbrev</sup></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>Semicolon</i><sup>full</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>;</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>VirtualSemicolon</i></td>
    </tr>
</table>