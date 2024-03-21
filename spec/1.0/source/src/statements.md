# Statements

The **ω** superscript used throughout the specification translates to one of { **abbrev**, **noShortIf**, **full** }.

**Syntax**

<ul>
    <i>Statement</i><sup>ω</sup> :
    <ul>
        <i>SuperStatement</i> <i>Semicolon</i><sup>ω</sup><br>
        <i>BlockAttributes</i><sub>opt</sub> <i>Block</i><br>
        <i>IfStatement</i><sup>ω</sup><br>
        <i>SwitchStatement</i><br>
        <i>DoStatement</i> <i>Semicolon</i><sup>ω</sup><br>
        <i>WhileStatement</i><sup>ω</sup><br>
        <i>ForStatement</i><sup>ω</sup><br>
        <i>WithStatement</i><sup>ω</sup><br>
        <i>ContinueStatement</i> <i>Semicolon</i><sup>ω</sup><br>
        <i>BreakStatement</i> <i>Semicolon</i><sup>ω</sup><br>
        <i>ReturnStatement</i> <i>Semicolon</i><sup>ω</sup><br>
        <i>ThrowStatement</i> <i>Semicolon</i><sup>ω</sup><br>
        <i>TryStatement</i><br>
        <i>ExpressionStatement</i> <i>Semicolon</i><sup>ω</sup><br>
        <i>LabeledStatement</i><sup>ω</sup><br>
        <i>DefaultXMLNamespaceStatement</i>
    </ul>
</ul>

<ul>
    <i>Substatement</i><sup>ω</sup> :
    <ul>
        <i>EmptyStatement</i><br>
        <i>Statement</i><sup>ω</sup>
    </ul>
</ul>

<ul>
    <i>Substatements</i> :
    <ul>
        «empty»<br>
        <i>SubstatementsPrefix</i> <i>Substatement</i><sup>abbrev</sup>
    </ul>
</ul>

<ul>
    <i>SubstatementsPrefix</i> :
    <ul>
        «empty»<br>
        <i>SubstatementsPrefix</i> <i>Substatement</i><sup>full</sup>
    </ul>
</ul>

<ul>
    <i>Semicolon</i><sup>abbrev</sup> :
    <ul>
        <b>;</b><br>
        <i>VirtualSemicolon</i><br>
        «empty»
    </ul>
</ul>

<ul>
    <i>Semicolon</i><sup>noShortIf</sup> :
    <ul>
        <i>Semicolon</i><sup>abbrev</sup>
    </ul>
</ul>

<ul>
    <i>Semicolon</i><sup>full</sup> :
    <ul>
        <b>;</b><br>
        <i>VirtualSemicolon</i>
    </ul>
</ul>