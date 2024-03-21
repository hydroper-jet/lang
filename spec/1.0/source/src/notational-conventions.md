# Notational Conventions

## Syntactic and Lexical Grammars

This document uses the following notation to define one or more productions of a nonterminal of the syntactic grammar:

<ul>
    <i>Symbol</i> :
    <ul>
        <i>Production1</i> <i>Symbol1</i><br>
        <i>ProductionN</i>
    </ul>
</ul>

This document uses double colon (::) notation to define productions of a nonterminal of the lexical grammar:

<ul>
    <i>Symbol</i> ::
    <ul>
        <b>terminal</b>
    </ul>
</ul>

The <sub>opt</sub> subscript is used to indicate that a nonterminal symbol is optional.

<ul>
    <i>Symbol</i> ::
    <ul>
        <i>Symbol1</i><sub>opt</sub>
    </ul>
</ul>

A bracketed clause or predicate may appear between the rules of a production, such as in:

<ul>
    <i>Symbol</i> ::
    <ul>
        [lookahead ∈ { <b>0</b> }] <i>Symbol1</i><br>
        [lookahead ∉ { <b>default</b> }] <i>Symbol2</i><br>
        <i>SourceCharacters</i> [but no embedded <b>&lt;!&#x5b;CDATA&#x5b;</b>]
    </ul>
</ul>

The «empty» clause is matched by the grammar where other rules do not match otherwise.

<ul>
    <i>Symbol</i> :
    <ul>
        «empty»
    </ul>
</ul>

Braces subscripts are used to quantify a rule:

* <i>Symbol</i><sub>{4}</sub> — Four of <i>Symbol</i>
* <i>Symbol</i><sub>{2,}</sub> — At least two of <i>Symbol</i>
* <i>Symbol</i><sub>{1,4}</sub> — One to four of <i>Symbol</i>