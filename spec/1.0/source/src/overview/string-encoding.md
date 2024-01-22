# String encoding

The String data type uses an implementation-defined encoding and is supported by a `CharIndex` data type representing an index into a `String`.

## Slicing

| Call        | Description |
| ----------- | ----------- |
| `string.slice(string.firstIndex.next(1))` | Slices string from second character |
| `string.slice(string.firstIndex, string.firstIndex.next(3))` | Takes first three characters from a string |
| `string.slice(string.firstIndex, string.lastIndex.next(-4))` | Slices string until last 4 characters |

## Characters

| Method call | Description |
| ----------- | ----------- |
| `string.chars().length()` | The character count |
| `string.length` | The string length in the encoding units. For UTF-8, it is the number of bytes. |
| `string.isEmpty`, `string == ""` | Whether the string is empty or not |

## Miscellaneous

| Code | Description |
| ---- | ----------- |
| `string.charAt(i)` | Character at *i* |
| `for each (const ch in string) {}` | Iterates every character |