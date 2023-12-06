# String encoding

The String data type uses an implementation-defined encoding and is supported by a *CharIndex* data type representing an index into it.

The following variable `x` is a string ranging from the second character to the end of another string:

```
// Slice from second character
const string2 = string1.substring(string1.firstIndex.next(1));
```

Further examples:

```
const s = "jetwork";

// "jet"
trace(s.slice(0, s.firstIndex.next(3)));
trace(s.slice(0, s.lastIndex.next(-4)));

// Character count between i and j
trace(s.charCountRange(i, j));

// Character count
trace(s.charCount);

// Length in the encoding units
trace(s.unitCount);

// Whether the string is empty or not
trace(s.isEmpty);
trace(s == "");

// Scalar Value at i
const character = "jetwork".charAt(i);

// For each character
for each (const character in "jetwork") {}
```