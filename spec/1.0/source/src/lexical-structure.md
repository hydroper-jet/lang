# Lexical structure

<table>
    <tr>
        <td colspan="2"><i>InputElementDiv</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Identifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ReservedWord</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Punctuator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>NumericLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>StringLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Comment</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>InputElementRegExp</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Identifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ReservedWord</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Punctuator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>/</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>/=</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>NumericLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>StringLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>RegularExpressionLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Comment</i></td>
    </tr>
</table>

## Escape sequences

<table>
    <tr>
        <td colspan="2"><i>UnicodeEscapeSequence</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&#x5c;u</b> <i>HexDigit</i> <i>HexDigit</i> <i>HexDigit</i> <i>HexDigit</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&#x5c;u</b> <b>&#x7b;</b> <i>HexDigits</i> <b>&#x7d;</b></td>
    </tr>
</table>

## Identifier

<table>
    <tr>
        <td colspan="2"><i>Identifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>IdentifierName</i> [but not <i>ReservedWord</i>]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>IdentifierName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>IdentifierStart</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>IdentifierName</i> <i>IdentifierPart</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>IdentifierStart</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[Letter property (“L”) from Unicode]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[Letter number property (“Nl”) from Unicode]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[Decimal Digit Number property (“Nd”) from Unicode]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>_</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>$</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>UnicodeEscapeSequence</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>IdentifierPart</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[Letter property (“L”) from Unicode]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[Letter number property (“Nl”) from Unicode]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[Nonspacing Mark property (“Mn”) from Unicode]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[Spacing Combining Mark property (“Mc”) from Unicode]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[Connector Punctuation property (“Pc”) from Unicode]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[Decimal Digit Number property (“Nd”) from Unicode]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>_</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>$</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>UnicodeEscapeSequence</i></td>
    </tr>
</table>

## Reserved words

*ReservedWord* includes the following reserved words:

```plain
as
do
if
in
is

for
new
not
use
try
var

else
this
true
void
with

await
break
catch
class
const
false
super
throw
while
yield

delete
import
public
return
switch
typeof

extends
finally
package
private

continue
function
internal

interface
protected

implements
```

*ReservedWord* includes *FutureReservedWord*. *FutureReservedWord* is one of the following:

```plain
export
throws
```

*ReservedWord* includes *ContextKeyword*. *ContextKeyword* is one of the following in certain syntactic contexts:

```plain
get
set
xml

each
enum
meta
type

embed
final
proxy
where

native
static

abstract
override

namespace
undefined
```

## Punctuators

*Punctuator* includes one of the following:

```plain
::  @
.  ..  ...
(  )  [  ]  {  }
:  ;  ,
?  !  =  =>
?.
<  <=
>  >=
==  ===
!=  !==
+  -  *  /  %  **
++  --
<<  >>  >>>
&  ^  |  ~
&&  ^^  ||  ??
```

*Punctuator* includes *CompoundAssignmentPunctuator*. *CompoundAssignmentPunctuator* is one of the following:

```plain
+=  -=  *=  /=  %=  **=
<<=  >>=  >>>=  &=  ^=  |=
&&=  ^^=  ||=
??=
```

## Numeric literal

*NumericLiteral* is similiar to *NumericLiteral* from the ECMA-262 third edition, with support for binary literals:

```plain
0b1011
```

## Regular expression literal

*RegularExpressionLiteral* is similiar to *RegularExpressionLiteral* from the ECMA-262 third edition, with support for line breaks.

## String literal

*StringLiteral* is similiar to *StringLiteral* from the ECMA-262 third edition, with additional features:

* scalar *UnicodeEscapeSequence* using the `\u{...}` form;
* triple string literals.

Triple string literals use either `"""` or `'''` as delimiter and may span multiple lines. The contents of triple string literals are indentation-based, as can be observed in the following code:

```
const text = """
    Have a
    nice day!
    """;
assert(text == "Have a\nnice day!");
```

Triple string literals are processed as follows:

* the first empty line is ignored;
* the base indentation of a triple string literal is that of the last string line.

## Comment

*Comment* is similiar to *Comment* from the ECMA-262 third edition, with support for nested multi-line comments.

```
/*
 * /*
 *  *
 *  */
 */
```

## J4X

J4X defines *InputElementXMLTag* and *InputElementXMLContent* based on the ECMA-357 second edition.