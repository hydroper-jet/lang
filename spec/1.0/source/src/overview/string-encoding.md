# String encoding

The String data type uses an implementation-defined encoding. String indices identify a character in the encoding unit.

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

for each (const ch in string) {
    /* Action */
}
```