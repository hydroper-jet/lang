# XML initializers

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>XMLInitializer</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLMarkup</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLElement</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&lt;</b> <b>&gt;</b> <i>XMLElementContent</i> <b>&lt;/</b> <b>&gt;</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLElement</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&lt;</b> <i>XMLTagContent</i> <i>XMLWhitespace</i><sub>opt</sub> <b>/&gt;</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&lt;</b> <i>XMLTagContent</i> <i>XMLWhitespace</i><sub>opt</sub> <b>&gt;</b> <i>XMLElementContent</i> <b>&lt;/</b> <i>XMLTagName</i> <i>XMLWhitespace</i><sub>opt</sub> <b>&gt;</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLTagContent</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLTagName</i> <i>XMLAttributes</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLTagName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>{</b> <i>AssignmentExpression</i><sup>allowIn</sup> <b>}</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLName</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLAttributes</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLWhitespace</i> <b>{</b> <i>AssignmentExpression</i><sup>allowIn</sup> <b>}</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLAttribute</i> <i>XMLAttributes</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLAttribute</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLWhitespace</i> <i>XMLName</i> <i>XMLWhitespace</i><sub>opt</sub> <b>=</b> <i>XMLWhitespace</i><sub>opt</sub> <b>{</b> <i>AssignmentExpression</i><sup>allowIn</sup> <b>}</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLWhitespace</i> <i>XMLName</i> <i>XMLWhitespace</i><sub>opt</sub> <b>=</b> <i>XMLWhitespace</i><sub>opt</sub> <i>XMLAttributeValue</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLElementContent</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>{</b> <i>AssignmentExpression</i><sup>allowIn</sup> <b>}</b> <i>XMLElementContent</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLMarkup</i> <i>XMLElementContent</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLText</i> <i>XMLElementContent</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLElement</i> <i>XMLElementContent</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
</table>

**Semantics*

Interpolation expressions such as in `<>{x}</>` result in string concatenation.

**Verification**

<i>XMLInitializer</i> : <i>XMLMarkup</i>

* Return a value of the `XML` type.

<i>XMLInitializer</i> : <i>XMLElement</i>

* Verify the nonterminal symbol on right-hand side of the production.
* Return a value of the `XML` type.

<i>XMLInitializer</i> : <b>&lt;</b> <b>&gt;</b> <i>XMLElementContent</i> <b>&lt;/</b> <b>&gt;</b>

* Verify the <i>XMLElementContent</i> nonterminal.
* Return a value of the `XMLList` type.

<i>XMLElement</i>

* Verify every root <i>AssignmentExpression</i><sup>allowIn</sup>.

<i>XMLElementContent</i>

* Verify every root <i>AssignmentExpression</i><sup>allowIn</sup>.