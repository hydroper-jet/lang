# Identifiers

**Syntax**

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

**Verification**

The *Identifier* and *IdentifierName* productions of *PropertyIdentifier* result into a string consisting of the respective identifier characters. The <b>*</b> production of *PropertyIdentifier* results into the <b>*</b> string.

The qualifier *PropertyIdentifier* preceding the <b>::</b> punctuator translates to a *PrimaryExpression* **:** *QualifiedIdentifier* and is verified as such production limited to the `Namespace` type.

The qualifier *ParenExpression* preceding the <b>::</b> punctuator must be of the `Namespace` type.

*Brackets* must be of the `String` type.

Verifying *QualifiedIdentifier* results into a (*qual*, *key*) group consisting of an optional `Namespace` object and a `String` value respectively.

**Evaluation**

The qualifier *PropertyIdentifier* preceding the <b>::</b> punctuator translates to a *PrimaryExpression* **:** *QualifiedIdentifier* and is evaluated as such production.