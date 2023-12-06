# String encoding

The String data type uses an implementation-defined encoding and is supported by a *CharIndex* data type representing an index into it.

```
// String variable
const string1 = "jetwork";

// Slice from second character
const string2 = string1.substring(string1.firstIndex.next(1));

// "jet"
trace(string1.slice(0, string1.firstIndex.next(3)));
trace(string1.slice(0, string1.lastIndex.next(-4)));

/*
 * Length in the encoding units.
 *
 * - For UTF-8, this is the number of bytes.
 * - For UTF-16, this is the number of UCS-2 units.
 */
trace(string1.length);

// Character count
trace(string1.chars().length());

// Character count between i and j
trace(string1.slice(i, j).chars().length());

// Whether the string is empty or not
trace(string1.isEmpty);
trace(string1 == "");

// Scalar Value at i
const character = string1.charAt(i);

// For each character
for each (const character in string1) {}
```