# XML Initializers

**Syntax**

<ul>
    <i>XMLInitializer</i> :
    <ul>
        <i>XMLMarkup</i><br>
        <i>XMLElement</i><br>
        <b>&lt;</b> <b>&gt;</b> <i>XMLElementContent</i> <b>&lt;/</b> <b>&gt;</b>
    </ul>
</ul>

<ul>
    <i>XMLElement</i> :
    <ul>
        <b>&lt;</b> <i>XMLTagContent</i> <i>XMLWhitespace</i><sub>opt</sub> <b>/&gt;</b><br>
        <b>&lt;</b> <i>XMLTagContent</i> <i>XMLWhitespace</i><sub>opt</sub> <b>&gt;</b> <i>XMLElementContent</i> <b>&lt;/</b> <i>XMLTagName</i> <i>XMLWhitespace</i><sub>opt</sub> <b>&gt;</b>
    </ul>
</ul>

<ul>
    <i>XMLTagContent</i> :
    <ul>
        <i>XMLTagName</i> <i>XMLAttributes</i>
    </ul>
</ul>

<ul>
    <i>XMLTagName</i> :
    <ul>
        <b>{</b> <i>AssignmentExpression</i><sup>allowIn</sup> <b>}</b><br>
        <i>XMLName</i>
    </ul>
</ul>

<ul>
    <i>XMLAttributes</i> :
    <ul>
        <i>XMLWhitespace</i> <b>{</b> <i>AssignmentExpression</i><sup>allowIn</sup> <b>}</b><br>
        <i>XMLAttribute</i> <i>XMLAttributes</i><br>
        «empty»
    </ul>
</ul>

<ul>
    <i>XMLAttribute</i> :
    <ul>
        <i>XMLWhitespace</i> <i>XMLName</i> <i>XMLWhitespace</i><sub>opt</sub> <b>=</b> <i>XMLWhitespace</i><sub>opt</sub> <b>{</b> <i>AssignmentExpression</i><sup>allowIn</sup> <b>}</b><br>
        <i>XMLWhitespace</i> <i>XMLName</i> <i>XMLWhitespace</i><sub>opt</sub> <b>=</b> <i>XMLWhitespace</i><sub>opt</sub> <i>XMLAttributeValue</i>
    </ul>
</ul>

<ul>
    <i>XMLElementContent</i> :
    <ul>
        <b>{</b> <i>AssignmentExpression</i><sup>allowIn</sup> <b>}</b> <i>XMLElementContent</i><br>
        <i>XMLMarkup</i> <i>XMLElementContent</i><br>
        <i>XMLText</i> <i>XMLElementContent</i><br>
        <i>XMLElement</i> <i>XMLElementContent</i><br>
        «empty»
    </ul>
</ul>

**Semantics**

Interpolation expressions such as in **&lt;>{x}&lt;/>** result in string concatenation.

**Verification**

<i>XMLInitializer</i> : <i>XMLMarkup</i>

* Return a value of the **XML** type.

<i>XMLInitializer</i> : <i>XMLElement</i>

* Verify the nonterminal symbol on right-hand side of the production.
* Return a value of the **XML** type.

<i>XMLInitializer</i> : <b>&lt;</b> <b>&gt;</b> <i>XMLElementContent</i> <b>&lt;/</b> <b>&gt;</b>

* Verify the <i>XMLElementContent</i> nonterminal.
* Return a value of the **XMLList** type.

<i>XMLElement</i>

* Verify every root <i>AssignmentExpression</i><sup>allowIn</sup>.

<i>XMLElementContent</i>

* Verify every root <i>AssignmentExpression</i><sup>allowIn</sup>.