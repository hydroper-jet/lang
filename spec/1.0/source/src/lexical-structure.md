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
module
public
return
switch
throws
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
import
```

*ReservedWord* includes *ContextKeyword*. *ContextKeyword* is one of the following in certain syntactic contexts:

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
never
proxy
where

native
static

abstract
override

namespace
undefined
```