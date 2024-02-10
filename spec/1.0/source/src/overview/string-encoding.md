# String encoding

The String data type uses an implementation-defined encoding and is supported by a `CharIndex` data type representing an index into a `String`.

## Slicing

```
string.slice(string.firstIndex.next(1))

string.slice(string.firstIndex, string.firstIndex.next(3))

string.slice(string.firstIndex, string.lastIndex.next(-4))
```

## Characters

```
// Number of Unicode Scalar Values
string.chars().length()

// Number of encoding units
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