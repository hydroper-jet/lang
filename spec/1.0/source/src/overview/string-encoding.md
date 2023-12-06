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

// Encoding units count
trace(string1.unitCount);

// Character count
trace(string1.charCount);

// Character count between i and j
trace(string1.slice(i, j).charCount);

// Whether the string is empty or not
trace(string1.isEmpty);
trace(string1 == "");

// Scalar Value at i
const character = string1.charAt(i);

// For each character
for each (const character in string1) {}
```