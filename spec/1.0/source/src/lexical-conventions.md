# Lexical Conventions

This section defines the lexical grammar of the Jet language.

The tokenizer scans one of the following input goal symbols depending on the syntactic context: * *InputElementDiv*, *InputElementRegExp*, *InputElementXMLTag*, or *InputElementXMLContent*.

The following program illustrates how the tokenizer decides which is the input goal symbol to scan:

```
/(?:)/       ;
a / b        ;
<a>Text</a>  ;
```

The following table indicates which is the input goal symbol that is scanned for each of the tokens comprising the previous program:

| Token | Input goal |
| ----- | ---------- |
| /(?:)/ | *InputElementRegExp* |
| ; | *InputElementDiv* |
| a | *InputElementRegExp* |
| / | *InputElementDiv* |
| b | *InputElementRegExp* |
| ; | *InputElementDiv* |
| &lt; | *InputElementRegExp* |
| a | *InputElementXMLTag* |
| &gt; | *InputElementXMLTag* |
| Text | *InputElementXMLContent* |
| &lt;/ | *InputElementXMLContent* |
| a | *InputElementXMLTag* |
| &gt; | *InputElementXMLTag* |
| ; | *InputElementDiv* |

**Syntax**

<ul>
    <i>InputElementDiv</i> ::
    <ul>
        <i>WhiteSpace</i><br>
        <i>LineTerminator</i><br>
        <i>Comment</i><br>
        <i>Identifier</i><br>
        <i>ReservedWord</i><br>
        <i>Punctuator</i><br>
        <i>NumericLiteral</i><br>
        <i>StringLiteral</i>
    </ul>
</ul>

<ul>
    <i>InputElementRegExp</i> ::
    <ul>
        <i>WhiteSpace</i><br>
        <i>LineTerminator</i><br>
        <i>Comment</i><br>
        <i>Identifier</i><br>
        <i>ReservedWord</i><br>
        <i>Punctuator</i><br>
        <b>/</b><br>
        <b>/=</b><br>
        <i>NumericLiteral</i><br>
        <i>StringLiteral</i><br>
        <i>RegularExpressionLiteral</i><br>
        <i>XMLMarkup</i>
    </ul>
</ul>

<ul>
    <i>InputElementXMLTag</i> ::
    <ul>
        <i>XMLName</i><br>
        <i>XMLTagPunctuator</i><br>
        <i>XMLAttributeValue</i><br>
        <i>XMLWhitespace</i><br>
        <b>&#x7B;</b>
    </ul>
</ul>

<ul>
    <i>InputElementXMLContent</i> ::
    <ul>
        <i>XMLMarkup</i><br>
        <i>XMLText</i><br>
        <b>&#x7B;</b><br>
        <b>&lt;</b> [lookahead ∉ { <b>?</b>, <b>!</b>, <b>/</b> }]<br>
        <b>&lt;/</b>
    </ul>
</ul>

## Source Characters

**Syntax**

<ul>
    <i>SourceCharacter</i> ::
    <ul>
        Unicode code point
    </ul>
</ul>

<ul>
    <i>SourceCharacters</i> ::
    <ul>
        <i>SourceCharacter</i> <i>SourceCharacters</i><sub>opt</sub>
    </ul>
</ul>

## White Space

The *WhiteSpace* token is filtered out by the lexical scanner.

**Syntax**

<ul>
    <i>WhiteSpace</i> ::
    <ul>
        U+09 tab<br>
        U+0B vertical tab<br>
        U+0C form feed<br>
        U+20 space<br>
        U+A0 no-break space<br>
        Unicode “space separator”
    </ul>
</ul>

## Line Terminator

The *LineTerminator* token is filtered out by the lexical scanner, however it may result in a *VirtualSemicolon* to be inserted.

**Syntax**

<ul>
    <i>LineTerminator</i> ::
    <ul>
        U+0A line feed<br>
        U+0D carriage return<br>
        U+2028 line separator<br>
        U+2029 paragraph separator
    </ul>
</ul>

## Comment

The *Comment* token is filtered out by the lexical scanner, however it propagates any *LineTerminator* token from its characters.

The *Comment* symbol is similiar to that from the ECMA-262 third edition, adding support for nested multi-line comments.

```
/*
 * /*
 *  *
 *  */
 */
```

**Syntax**

<ul>
    <i>Comment</i> ::
    <ul>
        <b>//</b> <i>SingleLineCommentCharacters</i><br>
        <i>MultiLineComment</i>
    </ul>
</ul>

<ul>
    <i>SingleLineCommentCharacters</i> ::
    <ul>
        <i>SingleLineCommentCharacter</i> <i>SingleLineCommentCharacters</i><sub>opt</sub>
    </ul>
</ul>

<ul>
    <i>SingleLineCommentCharacter</i> ::
    <ul>
        [lookahead ∉ { <i>LineTerminator</i> }] <i>SourceCharacter</i>
    </ul>
</ul>

<ul>
    <i>MultiLineComment</i> ::
    <ul>
        <b>/*</b> <i>MultiLineCommentCharacters</i><sub>opt</sub> <b>*/</b>
    </ul>
</ul>

<ul>
    <i>MultiLineCommentCharacters</i> ::
    <ul>
        <i>SourceCharacters</i> [but no embedded sequence <b>/*</b>]<br>
        <i>MultiLineComment</i><br>
        <i>MultiLineCommentCharacters</i> <i>SourceCharacters</i> [but no embedded sequence <b>/*</b>]<br>
        <i>MultiLineCommentCharacters</i> <i>MultiLineComment</i>
    </ul>
</ul>

## Virtual Semicolon

The *VirtualSemicolon* nonterminal matches an automatically inserted semicolon, known as a *virtual* semicolon.

Virtual semicolons are inserted in the following occasions:

* After a right-curly character **&#x7D;**
* Before a *LineTerminator*

## Identifier

The *Identifier* symbol is similiar to that from the ECMA-262 third edition, but with support for scalar Unicode escapes.

**Syntax**

<ul>
    <i>Identifier</i> ::
    <ul>
        <i>IdentifierName</i> [but not <i>ReservedWord</i> or <i>ContextKeyword</i>]<br>
        <i>ContextKeyword</i>
    </ul>
</ul>

<ul>
    <i>IdentifierName</i> ::
    <ul>
        <i>IdentifierStart</i><br>
        <i>IdentifierName</i> <i>IdentifierPart</i>
    </ul>
</ul>

<ul>
    <i>IdentifierStart</i> ::
    <ul>
        <i>UnicodeLetter</i><br>
        underscore <b>_</b><br>
        <b>$</b><br>
        <i>UnicodeEscapeSequence</i>
    </ul>
</ul>

<ul>
    <i>IdentifierPart</i> ::
    <ul>
        <i>UnicodeLetter</i><br>
        <i>UnicodeCombiningMark</i><br>
        <i>UnicodeConnectorPunctuation</i><br>
        <i>UnicodeDigit</i><br>
        underscore <b>_</b><br>
        <b>$</b><br>
        <i>UnicodeEscapeSequence</i>
    </ul>
</ul>

<ul>
    <i>UnicodeLetter</i> ::
    <ul>
        Unicode letter (“L”)<br>
        Unicode letter number (“Nl”)
    </ul>
</ul>

<ul>
    <i>UnicodeDigit</i> ::
    <ul>
        Unicode decimal digit number (“Nd”)
    </ul>
</ul>

<ul>
    <i>UnicodeCombiningMark</i> ::
    <ul>
        Unicode nonspacing mark (“Mn”)<br>
        Unicode spacing combining mark (“Mc”)
    </ul>
</ul>

<ul>
    <i>UnicodeConnectorPunctuation</i> ::
    <ul>
        Unicode connector punctuation (“Pc”)
    </ul>
</ul>

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
try
use
var

case
else
null
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
set
xml

each
enum
from
meta
type

embed
final
fixed
proxy

native
static

dynamic

abstract
override

namespace

configuration
```

## Punctuator

*Punctuator* includes one of the following:

```plain
::  @
.  ..  ...
(  )  [  ]  {  }
:  ;  ,
?  !  =
?.
<  <=
>  >=
==  ===
!=  !==
+  -  *  %  **
++  --
<<  >>  >>>
&  ^  |  ~
&&  ^^  ||  ??
```

The `@` punctuator must not be followed by a single quote <b>'</b> or a double quote character <b>"</b>.

*Punctuator* includes *CompoundAssignmentPunctuator*. *CompoundAssignmentPunctuator* is one of the following:

```plain
+=  -=  *=  %=  **=
<<=  >>=  >>>=  &=  ^=  |=
&&=  ^^=  ||=
??=
```

## Numeric Literal

*NumericLiteral* is similiar to *NumericLiteral* from the ECMA-262 third edition, with support for binary literals and underscore separators:

```plain
0b1011
1_000
```

**Syntax**

<ul>
    <i>NumericLiteral</i> ::
    <ul>
        <i>DecimalLiteral</i> [lookahead ∉ { <i>IdentifierStart</i>, <i>DecimalDigit</i> }]<br>
        <i>HexIntegerLiteral</i> [lookahead ∉ { <i>IdentifierStart</i>, <i>DecimalDigit</i> }]<br>
        <i>BinIntegerLiteral</i> [lookahead ∉ { <i>IdentifierStart</i>, <i>DecimalDigit</i> }]
    </ul>
</ul>

<ul>
    <i>DecimalLiteral</i> ::
    <ul>
        <i>DecimalIntegerLiteral</i> <b>.</b> <i>UnderscoreDecimalDigits</i><sub>opt</sub><br> <i>ExponentPart</i><sub>opt</sub><br>
        <b>.</b> <i>UnderscoreDecimalDigits</i> <i>ExponentPart</i><sub>opt</sub><br>
        <i>DecimalIntegerLiteral</i> <i>ExponentPart</i><sub>opt</sub>
    </ul>
</ul>

<ul>
    <i>DecimalIntegerLiteral</i> ::
    <ul>
        <b>0</b><br>
        [lookahead = <i>NonZeroDigit</i>] <i>UnderscoreDecimalDigits</i><sub>opt</sub>
    </ul>
</ul>

<ul>
    <i>DecimalDigits</i> ::
    <ul>
        <i>DecimalDigit</i><sub>{1,}</sub>
    </ul>
</ul>

<ul>
    <i>UnderscoreDecimalDigits</i> ::
    <ul>
        <i>DecimalDigits</i>
        <i>UnderscoreDecimalDigits</i> <b>_</b> <i>DecimalDigits</i>
    </ul>
</ul>

<ul>
    <i>DecimalDigit</i> ::
    <ul>
        <b>0</b>-<b>9</b>
    </ul>
</ul>

<ul>
    <i>NonZeroDigit</i> ::
    <ul>
        <b>1</b>-<b>9</b>
    </ul>
</ul>

<ul>
    <i>ExponentPart</i> ::
    <ul>
        <i>ExponentIndicator</i> <i>SignedInteger</i>
    </ul>
</ul>

<ul>
    <i>ExponentIndicator</i> ::
    <ul>
        <b>e</b><br>
        <b>E</b>
    </ul>
</ul>

<ul>
    <i>SignedInteger</i> ::
    <ul>
        <i>UnderscoreDecimalDigits</i><br>
        <b>+</b> <i>UnderscoreDecimalDigits</i><br>
        <b>-</b> <i>UnderscoreDecimalDigits</i>
    </ul>
</ul>

<ul>
    <i>HexIntegerLiteral</i> ::
    <ul>
        <b>0x</b> <i>UnderscoreHexDigits</i><br>
        <b>0X</b> <i>UnderscoreHexDigits</i>
    </ul>
</ul>

<ul>
    <i>HexDigit</i> ::
    <ul>
        <b>0</b>-<b>9</b><br>
        <b>A</b>-<b>F</b><br>
        <b>a</b>-<b>f</b>
    </ul>
</ul>

<ul>
    <i>UnderscoreHexDigits</i> ::
    <ul>
        <i>HexDigit</i><sub>{1,}</sub><br>
        <i>UnderscoreDecimalDigits</i> <b>_</b> <i>HexDigit</i><sub>{1,}</sub>
    </ul>
</ul>

<ul>
    <i>BinIntegerLiteral</i> ::
    <ul>
        <b>0b</b> <i>UnderscoreBinDigits</i><br>
        <b>0B</b> <i>UnderscoreBinDigits</i>
    </ul>
</ul>

<ul>
    <i>BinDigit</i> ::
    <ul>
        <b>0</b><br>
        <b>1</b>
    </ul>
</ul>

<ul>
    <i>UnderscoreBinDigits</i> ::
    <ul>
        <i>BinDigit</i><sub>{1,}</sub><br>
        <i>UnderscoreDecimalDigits</i> <b>_</b> <i>BinDigit</i><sub>{1,}</sub>
    </ul>
</ul>

## Regular Expression Literal

*RegularExpressionLiteral* is similiar to *RegularExpressionLiteral* from the ECMA-262 third edition, with support for line breaks.

**Syntax**

<ul>
    <i>RegularExpressionLiteral</i> ::
    <ul>
        <b>/</b> <i>RegularExpressionBody</i> <b>/</b> <i>RegularExpressionFlags</i>
    </ul>
</ul>

<ul>
    <i>RegularExpressionBody</i> ::
    <ul>
        <i>RegularExpressionFirstChar</i> <i>RegularExpressionChars</i>
    </ul>
</ul>

<ul>
    <i>RegularExpressionChars</i> ::
    <ul>
        «empty»<br>
        <i>RegularExpressionChars</i> <i>RegularExpressionChar</i>
    </ul>
</ul>

<ul>
    <i>RegularExpressionFirstChar</i> ::
    <ul>
        <i>SourceCharacter</i> [but not <b>*</b> or <b>&#x5C;</b> or <b>/</b>]<br>
        <i>BackslashSequence</i>
    </ul>
</ul>

<ul>
    <i>RegularExpressionChar</i> ::
    <ul>
        <i>SourceCharacter</i> [but not <b>&#x5C;</b> or <b>/</b>]<br>
        <i>BackslashSequence</i>
    </ul>
</ul>

<ul>
    <i>BackslashSequence</i> ::
    <ul>
        <b>&#x5C;</b> <i>SourceCharacter</i>
    </ul>
</ul>

<ul>
    <i>RegularExpressionFlags</i> ::
    <ul>
        «empty»<br>
        <i>RegularExpressionFlags</i> <i>IdentifierPart</i>
    </ul>
</ul>

## String Literal

*StringLiteral* is similiar to the *StringLiteral* symbol from the ECMA-262 third edition. The following additional features are included:

* Scalar *UnicodeEscapeSequence* using the `\u{...}` form
* Triple string literals
* Raw string literals using the `@` prefix

Triple string literals use either `"""` or `'''` as delimiter and may span multiple lines. The contents of triple string literals are indentation-based, as can be observed in the following program:

```
const text = """
    foo
    bar
    """
text == "foo\nbar"
```

Triple string literals are processed as follows:

* The first empty line is ignored.
* The base indentation of a triple string literal is that of the last string line.

Both regular and triple string literals accept the `@` prefix, designating raw string literals. Raw string literals contain no escape sequences.

```
const text = @"""
    x\y
    """
```

Escape sequences are described by the following table:

| Escape          | Description    |
| --------------- | -------------- |
| \\' | U+27 single-quote |
| \\" | U+22 double-quote |
| \\\\ | U+5C backslash character |
| \\b | U+08 backspace character |
| \\f | U+0C form feed character |
| \\n | U+0A line feed character |
| \\r | U+0D carriage return character |
| \\t | U+09 tab character |
| \\v | U+0B vertical tab character |
| \\0 | U+00 character |
| \\xHH | Contributes an Unicode code point value |
| \\uHHHH | Contributes an Unicode code point value |
| \\u\{...} | Contributes an Unicode code point value |
| \\ followed by *LineTerminator* | Contributes nothing |

**Syntax**

<ul>
    <i>StringLiteral</i> ::
    <ul>
        [lookahead ≠ <b>"""</b>] <b>"</b> <i>DoubleStringCharacter</i><sub>{0,}</sub> <b>"</b><br>
        [lookahead ≠ <b>'''</b>] <b>'</b> <i>SingleStringCharacter</i><sub>{0,}</sub> <b>'</b><br>
        <b>"""</b> <i>TripleDoubleStringCharacter</i><sub>{0,}</sub> <b>"""</b><br>
        <b>'''</b> <i>TripleSingleStringCharacter</i><sub>{0,}</sub> <b>'''</b><br>
        <i>RawStringLiteral</i>
    </ul>
</ul>

<ul>
    <i>RawStringLiteral</i> ::
    <ul>
        <b>@</b> [lookahead ≠ <b>"""</b>] <b>"</b> <i>DoubleStringRawCharacter</i><sub>{0,}</sub> <b>"</b><br>
        <b>@</b> [lookahead ≠ <b>'''</b>] <b>'</b> <i>SingleStringRawCharacter</i><sub>{0,}</sub> <b>'</b><br>
        <b>@"""</b> <i>TripleDoubleStringRawCharacter</i><sub>{0,}</sub> <b>"""</b><br>
        <b>@'''</b> <i>TripleSingleStringRawCharacter</i><sub>{0,}</sub> <b>'''</b>
    </ul>
</ul>

<ul>
    <i>DoubleStringCharacter</i> ::
    <ul>
        <i>SourceCharacter</i> [but not double-quote <b>"</b> or backslash <b>&#x5C;</b> or <i>LineTerminator</i>]<br>
        <i>EscapeSequence</i>
    </ul>
</ul>

<ul>
    <i>SingleStringCharacter</i> ::
    <ul>
        <i>SourceCharacter</i> [but not single-quote <b>'</b> or backslash <b>&#x5C;</b> or <i>LineTerminator</i>]<br>
        <i>EscapeSequence</i>
    </ul>
</ul>

<ul>
    <i>DoubleStringRawCharacter</i> ::
    <ul>
        <i>SourceCharacter</i> [but not double-quote <b>"</b> or <i>LineTerminator</i>]
    </ul>
</ul>

<ul>
    <i>SingleStringRawCharacter</i> ::
    <ul>
        <i>SourceCharacter</i> [but not single-quote <b>'</b> or <i>LineTerminator</i>]
    </ul>
</ul>

<ul>
    <i>TripleDoubleStringCharacter</i> ::
    <ul>
        [lookahead ≠ <b>"""</b>] <i>SourceCharacter</i> [but not backslash <b>&#x5C;</b> or <i>LineTerminator</i>]<br>
        <i>EscapeSequence</i><br>
        <i>LineTerminator</i>
    </ul>
</ul>

<ul>
    <i>TripleSingleStringCharacter</i> ::
    <ul>
        [lookahead ≠ <b>'''</b>] <i>SourceCharacter</i> [but not backslash <b>&#x5C;</b> or <i>LineTerminator</i>]<br>
        <i>EscapeSequence</i><br>
        <i>LineTerminator</i>
    </ul>
</ul>

<ul>
    <i>TripleDoubleStringRawCharacter</i> ::
    <ul>
        [lookahead ≠ <b>"""</b>] <i>SourceCharacter</i> [but not <i>LineTerminator</i>]<br>
        <i>LineTerminator</i>
    </ul>
</ul>

<ul>
    <i>TripleSingleStringRawCharacter</i> ::
    <ul>
        [lookahead ≠ <b>'''</b>] <i>SourceCharacter</i> [but not <i>LineTerminator</i>]<br>
        <i>LineTerminator</i>
    </ul>
</ul>

## Escape Sequences

**Syntax**

<ul>
    <i>EscapeSequence</i> ::
    <ul>
        <b>&#x5C;</b> <i>CharacterEscapeSequence</i><br>
        <b>&#x5C;0</b> [lookahead ∉ <i>DecimalDigit</i>]<br>
        <b>&#x5C;</b> <i>LineTerminator</i><br>
        <i>HexEscapeSequence</i><br>
        <i>UnicodeEscapeSequence</i>
    </ul>
</ul>

<ul>
    <i>CharacterEscapeSequence</i> ::
    <ul>
        <i>SingleEscapeCharacter</i><br>
        <i>NonEscapeCharacter</i>
    </ul>
</ul>

<ul>
    <i>SingleEscapeCharacter</i> ::
    <ul>
        <b>'</b><br>
        <b>"</b><br>
        <b>&#x5C;</b><br>
        <b>b</b><br>
        <b>f</b><br>
        <b>n</b><br>
        <b>r</b><br>
        <b>t</b><br>
        <b>v</b>
    </ul>
</ul>

<ul>
    <i>NonEscapeCharacter</i> ::
    <ul>
        <i>SourceCharacter</i> [but not <i>EscapeCharacter</i> or <i>LineTerminator</i>]
    </ul>
</ul>

<ul>
    <i>EscapeCharacter</i> ::
    <ul>
        <i>SingleEscapeCharacter</i><br>
        <i>DecimalDigit</i><br>
        <b>x</b><br>
        <b>u</b>
    </ul>
</ul>

<ul>
    <i>HexEscapeSequence</i> ::
    <ul>
        <b>&#x5C;x</b> <i>HexDigit</i> <i>HexDigit</i>
    </ul>
</ul>

<ul>
    <i>UnicodeEscapeSequence</i> ::
    <ul>
        <b>&#x5c;u</b> <i>HexDigit</i><sub>{4}</sub><br>
        <b>&#x5c;u</b> <b>&#x7b;</b> <i>HexDigit</i><sub>{1,}</sub> <b>&#x7d;</b>
    </ul>
</ul>

## XML

This section defines nonterminals used in the lexical grammar as part of J4X.

If a *XMLMarkup*, *XMLAttributeValue* or *XMLText* contains a *LineTerminator* after parsed, it contributes such *LineTerminator* to the lexical scanner.

**Syntax**

<ul>
    <i>XMLMarkup</i> ::
    <ul>
        <i>XMLComment</i><br>
        <i>XMLCDATA</i><br>
        <i>XMLPI</i>
    </ul>
</ul>

<ul>
    <i>XMLWhitespaceCharacter</i> ::
    <ul>
        U+20 space<br>
        U+09 tab<br>
        U+0D carriage return<br>
        U+0A line feed
    </ul>
</ul>

<ul>
    <i>XMLWhitespace</i> ::
    <ul>
        <i>XMLWhitespaceCharacter</i><br>
        <i>XMLWhitespace</i> <i>XMLWhitespaceCharacter</i>
    </ul>
</ul>

<ul>
    <i>XMLText</i> ::
    <ul>
        <i>SourceCharacters</i> [but no embedded left-curly <b>&#x7B;</b> or less-than <b>&lt;</b>]
    </ul>
</ul>

<ul>
    <i>XMLName</i> ::
    <ul>
        <i>XMLNameStart</i><br>
        <i>XMLName</i> <i>XMLNamePart</i>
    </ul>
</ul>

<ul>
    <i>XMLNameStart</i> ::
    <ul>
        <i>UnicodeLetter</i><br>
        underscore <b>_</b><br>
        colon <b>:</b>
    </ul>
</ul>

<ul>
    <i>XMLNamePart</i> ::
    <ul>
        <i>UnicodeLetter</i><br>
        <i>UnicodeDigit</i><br>
        period <b>.</b><br>
        hyphen <b>-</b><br>
        underscore <b>_</b><br>
        colon <b>:</b>
    </ul>
</ul>

<ul>
    <i>XMLComment</i> ::
    <ul>
        <b>&lt;!--</b> <i>XMLCommentCharacters</i><sub>opt</sub> <b>--&gt;</b>
    </ul>
</ul>

<ul>
    <i>XMLCommentCharacters</i> ::
    <ul>
        <i>SourceCharacters</i> [but no embedded sequence <b>--&gt;</b>]
    </ul>
</ul>

<ul>
    <i>XMLCDATA</i> ::
    <ul>
        <b>&lt;![CDATA[</b> <i>XMLCDATACharacters</i> <b>]]&gt;</b>
    </ul>
</ul>

<ul>
    <i>XMLCDATACharacters</i> ::
    <ul>
        <i>SourceCharacters</i> [but no embedded sequence <b>&#x5D;&#x5D;&gt;</b>]
    </ul>
</ul>

<ul>
    <i>XMLPI</i> ::
    <ul>
        <b>&lt;?</b> <i>XMLPICharacters</i><sub>opt</sub> <b>?&gt;</b>
    </ul>
</ul>

<ul>
    <i>XMLPICharacters</i> ::
    <ul>
        <i>SourceCharacters</i> [but no embedded sequence <b>?&gt;</b>]
    </ul>
</ul>

<ul>
    <i>XMLAttributeValue</i> ::
    <ul>
        <b>"</b> <i>XMLDoubleStringCharacters</i><sub>opt</sub> <b>"</b><br>
        <b>'</b> <i>XMLSingleStringCharacters</i><sub>opt</sub> <b>'</b>
    </ul>
</ul>

<ul>
    <i>XMLDoubleStringCharacters</i> ::
    <ul>
        <i>SourceCharacters</i> [but no embedded double-quote <b>"</b>]
    </ul>
</ul>

<ul>
    <i>XMLSingleStringCharacters</i> ::
    <ul>
        <i>SourceCharacters</i> [but no embedded single-quote <b>'</b>]
    </ul>
</ul>

<ul>
    <i>XMLTagPunctuator</i> ::
    <ul>
        <b>=</b><br>
        <b>&gt;</b><br>
        <b>/&gt;</b>
    </ul>
</ul>