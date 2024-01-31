# Attributes

Attributes are in the sequence of meta-data followed by modifier keywords.

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>Attributes</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Attribute</i> <i>AttributeLineBreakRestriction</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>AttributeCombination</i> <i>AttributeLineBreakRestriction</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>AttributeCombination</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Attribute</i> <i>AttributeLineBreakRestriction</i> <i>Attributes</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>BlockAttributes</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Metadata</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BlockAttributes</i> <i>Metadata</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>AttributeLineBreakRestriction</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[no line break if the previous and offending tokens match an <i>IdentifierName</i>]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>Attribute</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Metadata</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>public</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>private</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>protected</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>internal</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>proxy</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>final</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>native</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>static</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>abstract</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>override</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>Metadata</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>MetadataPreRestriction</i> <b>&#x5B;</b> <i>AssignmentExpression</i><sup>allowIn</sup> <b>&#x5D;</b>&#x5D;</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>MetadataPreRestriction</i> <b>&#x5B;</b> <i>AssignmentExpression</i><sup>allowIn</sup> <i>MetadataTrailingComma</i> <b>&#x5D;</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>MetadataPreRestriction</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[if the <i>Metadata</i> is in the beginning of <i>Attributes</i> or if the <i>Metadata</i> appears before an <i>IdentifierName</i> in <i>Attributes</i>]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>MetadataTrailingComma</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>,</b> [if the <i>Metadata</i> is the first occurrence in <i>Attributes</i> or <i>BlockAttributes</i>]</td>
    </tr>
</table>