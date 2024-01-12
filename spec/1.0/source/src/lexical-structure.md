# Lexical structure

This section defines the lexical grammar of the Jet language.

The tokenizer scans one of the following input goal symbols depending on the syntactic context:

* *InputElementDiv*
* *InputElementRegExp*
* *InputElementXMLTag*
* *InputElementXMLContent*

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>InputElementDiv</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>WhiteSpace</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LineTerminator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Comment</i></td>
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
</table>

<table>
    <tr>
        <td colspan="2"><i>InputElementRegExp</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>WhiteSpace</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>LineTerminator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Comment</i></td>
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
        <td>&nbsp;</td><td><i>XMLMarkup</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>InputElementXMLTag</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLTagPunctuator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLAttributeValue</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLWhitespace</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&#x7B;</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>InputElementXMLContent</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLMarkup</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLText</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&#x7B;</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&lt;</b> [lookahead ∉ { <b>?</b>, <b>!</b>, <b>/</b> }]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&lt;/</b></td>
    </tr>
</table>

## Source Characters

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>SourceCharacter</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[Unicode code point]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>SourceCharacters</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SourceCharacter</i> <i>SourceCharacters</i><sub>opt</sub></td>
    </tr>
</table>

## White Space

The *WhiteSpace* token is filtered out by the lexical scanner.

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>WhiteSpace</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[U+09 tab]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[U+0B vertical tab]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[U+0C form feed]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[U+20 space]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[U+A0 no-break space]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[Unicode “space separator”]</td>
    </tr>
</table>

## Line terminators

The *LineTerminator* token is filtered out by the lexical scanner, however it may result in a *VirtualSemicolon* to be inserted.

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>LineTerminator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[U+0A line feed]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[U+0D carriage return]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[U+2028 line separator]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[U+2029 paragraph separator]</td>
    </tr>
</table>

## Comments

The *Comment* token is filtered out by the lexical scanner, however it propagates any *LineTerminator* token from its characters.

*Comment* is similiar to that from the ECMA-262 third edition, with support for nested multi-line comments.

```
/*
 * /*
 *  *
 *  */
 */
```

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>Comment</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>//</b> <i>SingleLineCommentCharacters</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>MultiLineComment</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>SingleLineCommentCharacters</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SingleLineCommentCharacter</i> <i>SingleLineCommentCharacters</i><sub>opt</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>SingleLineCommentCharacter</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[lookahead ∉ { <i>LineTerminator</i> }] <i>SourceCharacter</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>MultiLineComment</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>/*</b> <i>MultiLineCommentCharacters</i><sub>opt</sub> <b>*/</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>MultiLineCommentCharacters</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SourceCharacters</i> [but no embedded sequence <b>/*</b>]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>MultiLineComment</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>MultiLineCommentCharacters</i> <i>SourceCharacters</i> [but no embedded sequence <b>/*</b>]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>MultiLineCommentCharacters</i> <i>MultiLineComment</i></td>
    </tr>
</table>

## Identifier

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>Identifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>IdentifierName</i> [but not <i>ReservedWord</i> or <i>ContextKeyword</i>]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ContextKeyword</i></td>
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
        <td>&nbsp;</td><td><i>UnicodeLetter</i></td>
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
        <td>&nbsp;</td><td><i>UnicodeLetter</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>UnicodeCombiningMark</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>UnicodeConnectorPunctuation</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>UnicodeDigit</i></td>
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
        <td colspan="2"><i>UnicodeLetter</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[Unicode letter (“L”)]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[Unicode letter number (“Nl”)]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>UnicodeDigit</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[Unicode decimal digit number (“Nd”)]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>UnicodeCombiningMark</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[Unicode nonspacing mark (“Mn”)]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[Unicode spacing combining mark (“Mc”)]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>UnicodeConnectorPunctuation</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[Unicode connector punctuation (“Pc”)]</td>
    </tr>
</table>

## Escape sequences

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>UnicodeEscapeSequence</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&#x5c;u</b> <i>HexDigit</i><sub>{4}</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&#x5c;u</b> <b>&#x7b;</b> <i>HexDigit</i><sub>{1,}</sub> <b>&#x7d;</b></td>
    </tr>
</table>

## Keywords

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

case
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

default
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

*ContextKeyword* is one of the following in certain syntactic contexts:

```plain
get
not
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

configuration
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
+  -  *   %  **
++  --
<<  >>  >>>
&  ^  |  ~
&&  ^^  ||  ??
```

*Punctuator* includes *CompoundAssignmentPunctuator*. *CompoundAssignmentPunctuator* is one of the following:

```plain
+=  -=  *=  %=  **=
<<=  >>=  >>>=  &=  ^=  |=
&&=  ^^=  ||=
??=
```

## Numeric literal

*NumericLiteral* is similiar to *NumericLiteral* from the ECMA-262 third edition, with support for binary literals and underscore separators:

```plain
0b1011
1_000
```

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>NumericLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>DecimalLiteral</i> [lookahead ∉ { <i>IdentifierStart</i>, <i>DecimalDigit</i> }]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>HexIntegerLiteral</i> [lookahead ∉ { <i>IdentifierStart</i>, <i>DecimalDigit</i> }]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BinIntegerLiteral</i> [lookahead ∉ { <i>IdentifierStart</i>, <i>DecimalDigit</i> }]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>DecimalLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>DecimalIntegerLiteral</i> <b>.</b> <i>UnderscoreDecimalDigits</i><sub>opt</sub> <i>ExponentPart</i><sub>opt</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>.</b> <i>UnderscoreDecimalDigits</i> <i>ExponentPart</i><sub>opt</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>DecimalIntegerLiteral</i> <i>ExponentPart</i><sub>opt</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>DecimalIntegerLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>0</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[lookahead = <i>NonZeroDigit</i>] <i>UnderscoreDecimalDigits</i><sub>opt</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>DecimalDigits</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>DecimalDigit</i><sub>{1,}</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>UnderscoreDecimalDigits</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>DecimalDigits</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>UnderscoreDecimalDigits</i> <b>_</b> <i>DecimalDigits</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>DecimalDigit</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[decimal digit from U+30 to U+39 (inclusive)]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>NonZeroDigit</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[decimal digit from U+31 to U+39 (inclusive)]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ExponentPart</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ExponentIndicator</i> <i>SignedInteger</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ExponentIndicator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>e</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>E</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>SignedInteger</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>UnderscoreDecimalDigits</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>+</b> <i>UnderscoreDecimalDigits</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>-</b> <i>UnderscoreDecimalDigits</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>HexIntegerLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>0x</b> <i>UnderscoreHexDigits</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>0X</b> <i>UnderscoreHexDigits</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>HexDigit</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[hexadecimal digit, case-insensitive]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>UnderscoreHexDigits</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>HexDigit</i><sub>{1,}</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>UnderscoreDecimalDigits</i> <b>_</b> <i>HexDigit</i><sub>{1,}</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>BinIntegerLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>0b</b> <i>UnderscoreBinDigits</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>0B</b> <i>UnderscoreBinDigits</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>BinDigit</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[binary digit from U+30 to U+31 inclusive]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>UnderscoreBinDigits</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BinDigit</i><sub>{1,}</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>UnderscoreDecimalDigits</i> <b>_</b> <i>BinDigit</i><sub>{1,}</sub></td>
    </tr>
</table>

## Regular expression literal

*RegularExpressionLiteral* is similiar to *RegularExpressionLiteral* from the ECMA-262 third edition, with support for line breaks.

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>RegularExpressionLiteral</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>/</b> <i>RegularExpressionBody</i> <b>/</b> <i>RegularExpressionFlags</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>RegularExpressionBody</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>RegularExpressionFirstChar</i> <i>RegularExpressionChars</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>RegularExpressionChars</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>RegularExpressionChars</i> <i>RegularExpressionChar</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>RegularExpressionFirstChar</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SourceCharacter</i> [but not <b>*</b> or <b>&#x5C;</b> or <b>/</b>]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BackslashSequence</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>RegularExpressionChar</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SourceCharacter</i> [but not <b>&#x5C;</b> or <b>/</b>]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>BackslashSequence</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>BackslashSequence</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&#x5C;</b> <i>SourceCharacter</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>RegularExpressionFlags</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>«empty»</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>RegularExpressionFlags</i> <i>IdentifierPart</i></td>
    </tr>
</table>

## String literal

*StringLiteral* is similiar to *StringLiteral* from the ECMA-262 third edition, with additional features:

* scalar *UnicodeEscapeSequence* using the `\u{...}` form;
* triple string literals;
* raw string literals using the `@` prefix.

Triple string literals use either `"""` or `'''` as delimiter and may span multiple lines. The contents of triple string literals are indentation-based, as can be observed in the following program:

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

Both regular and triple string literals accept the `@` prefix, designating raw string literals. Raw string literals contain no escape sequences.

```
const shaderProgram = @"""
    function main(): void {}
    """;
```

## Jet for XML

This section defines nonterminals used in the lexical grammar for the Jet for XML feature.

If a *XMLMarkup*, *XMLAttributeValue* or *XMLText* contains a *LineTerminator* after parsed, it contributes such *LineTerminator* to the lexical scanner.

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>XMLMarkup</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLComment</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLCDATA</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLPI</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLWhitespaceCharacter</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[U+20 space]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[U+09 tab]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[U+0D carriage return]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[U+0A line feed]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLWhitespace</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLWhitespaceCharacter</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLWhitespace</i> <i>XMLWhitespaceCharacter</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLText</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SourceCharacters</i> [but no embedded left-curly <b>&#x7B;</b> or less-than <b>&lt;</b>]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLNameStart</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>XMLName</i> <i>XMLNamePart</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLNameStart</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>UnicodeLetter</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[underscore <b>_</b>]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[colon <b>:</b>]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLNamePart</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>UnicodeLetter</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>UnicodeDigit</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[period <b>.</b>]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[hyphen <b>-</b>]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[underscore <b>_</b>]</td>
    </tr>
    <tr>
        <td>&nbsp;</td><td>[colon <b>:</b>]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLComment</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&lt;!--</b> <i>XMLCommentCharacters</i><sub>opt</sub> <b>--&gt;</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLCommentCharacters</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SourceCharacters</i> [but no embedded sequence <b>--&gt;</b>]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLCDATA</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&lt;![CDATA[</b> <i>XMLCDATACharacters</i> <b>]]&gt;</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLCDATACharacters</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SourceCharacters</i> [but no embedded sequence <b>&#x5D;&#x5D;&gt;</b>]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLPI</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&lt;?</b> <i>XMLPICharacters</i><sub>opt</sub> <b>?&gt;</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLPICharacters</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SourceCharacters</i> [but no embedded sequence <b>?&gt;</b>]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLAttributeValue</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>"</b> <i>XMLDoubleStringCharacters</i><sub>opt</sub> <b>"</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>'</b> <i>XMLSingleStringCharacters</i><sub>opt</sub> <b>'</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLDoubleStringCharacters</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SourceCharacters</i> [but no embedded double-quote <b>"</b>]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLSingleStringCharacters</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SourceCharacters</i> [but no embedded single-quote <b>'</b>]</td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>XMLTagPunctuator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>=</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>&gt;</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>/&gt;</b></td>
    </tr>
</table>