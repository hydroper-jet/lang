# String encoding

The String data type uses an implementation-defined encoding and is supported by a `CharIndex` data type representing an index into a `String`.

## Slicing

```
// Slices string from second character
string.slice(string.firstIndex.next(1))

// Takes first three characters from a string
string.slice(string.firstIndex, string.firstIndex.next(3))

// Slices string until last 4 characters
string.slice(string.firstIndex, string.lastIndex.next(-4))
```

## Characters

```
// The character count as Unicode Scalar Values
string.chars().length()

// The string length as the number of encoding units.
string.length

string.isEmpty
string == ""
```

## Miscellaneous

```
string.charAt(i)

for each (const character: Char in string) {
    /* Action */
}
```