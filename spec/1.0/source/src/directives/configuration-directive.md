# Configuration directive

The `configuration` directive expands blocks to the enclosing block or context if their condition matches.

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>ConfigurationDirective</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>configuration</b> <b>&#x7B;</b> <i>ConfigurationSubdirective</i> <b>&#x7D;</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ConfigurationSubdirective</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Block</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>if (</b> <i>ConfigurationExpression</i> <b>)</b> <i>Block</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>if (</b> <i>ConfigurationExpression</i> <b>)</b> <i>Block</i> <b>else</b> <i>ConfigurationSubdirective</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ConfigurationExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ConfigurationPrimaryExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ConfigurationPrimaryExpression</i> <b>&&</b> <i>ConfigurationPrimaryExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ConfigurationPrimaryExpression</i> <b>||</b> <i>ConfigurationPrimaryExpression</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ConfigurationPrimaryExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ConfigurationConstant</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ConfigurationConstant</i> <i>ConfigurationEquality</i> <i>Identifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ConfigurationConstant</i> <i>ConfigurationEquality</i> <i>StringLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>(</b> <i>ConfigurationExpression</i> <b>)</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>!</b> <i>ConfigurationPrimaryExpression</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ConfigurationConstant</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Identifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Identifier</i> <b>::</b> <i>IdentifierName</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ConfigurationEquality</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>=</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>!=</b></td>
    </tr>
</table>