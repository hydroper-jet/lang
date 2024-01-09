# Identifiers

<table>
    <tr>
        <td colspan="2"><i>PropertyIdentifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Identifier</i> [when keywords are enabled]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>IdentifierName</i> [when keywords are disabled]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>*</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>Qualifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>PropertyIdentifier</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>SimpleQualifiedIdentifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>PropertyIdentifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Qualifier</i> <b>::</b> <i>PropertyIdentifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Qualifier</i> <b>::</b> <i>Brackets</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ExpressionQualifiedIdentifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ParenExpression</i> <b>::</b> <i>PropertyIdentifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ParenExpression</i> <b>::</b> <i>Brackets</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>NonAttributeQualifiedIdentifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SimpleQualifiedIdentifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ExpressionQualifiedIdentifier</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>QualifiedIdentifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>@</b> <i>Brackets</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>@</b> <i>NonAttributeQualifiedIdentifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>NonAttributeQualifiedIdentifier</i></td>
    </tr>
</table>