# Notation

## Grammar definition

This document uses the following notation to define productions of a *nonterminal* of the grammar:

<table>
    <tr>
        <td colspan="2"><i>NonterminalName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Rule1</i> <i>RuleN</i></td>
    </tr>
</table>

Nonterminals followed by the <sub>opt</sub> subscript are optional rules.

A bracketed clause or predicate may appear between the rules of a production, such as in:

<table>
    <tr>
        <td colspan="2"><i>NonterminalName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[lookahead ∈ {<b>0</b>}] <i>Rule1</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[lookahead ∉ {<b>default</b>}] <i>Rule2</i></td>
    </tr>
        <td>&nbsp;</td><td><i>SourceCharacters</i> [but no embedded <b>&lt;!&#x5b;CDATA&#x5b;</b>] <i>Rule3</i></td>
    </tr>
</table>

The «empty» clause is matched by the grammar where other rules do not match otherwise.

Braces subscripts are used to quantify a rule:

* <i>Rule</i><sub>{4}</sub> — Four of <i>Rule</i>
* <i>Rule</i><sub>{2,}</sub> — At least two of <i>Rule</i>
* <i>Rule</i><sub>{1,4}</sub> — One to four of <i>Rule</i>