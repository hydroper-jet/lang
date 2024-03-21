# Try Statement

**Syntax**

<ul>
    <i>TryStatement</i> :
    <ul>
        <b>try</b> <i>Block</i> <i>CatchClauses</i><br>
        <b>try</b> <i>Block</i> <i>CatchClauses</i><sub>opt</sub> <b>finally</b> <i>Block</i>
    </ul>
</ul>

<ul>
    <i>CatchClauses</i> :
    <ul>
        <i>CatchClause</i><br>
        <i>CatchClauses</i> <i>CatchClause</i>
    </ul>
</ul>

<ul>
    <i>CatchClause</i> :
    <ul>
        <b>catch &#x28;</b> <i>TypedDestructuring</i> <b>&#x29;</b> <i>Block</i>
    </ul>
</ul>