# String encoding

The String data type uses an implementation-defined encoding and is supported by a `CharIndex` data type representing an index into a `String`.

## Slicing

Slice from second character:

```
const string2 = "jetwork".substring("jetwork".firstIndex.next(1));
```

First three characters from the `"jetwork"` string:

```
trace("jetwork".slice(0, "jetwork".firstIndex.next(3)));
trace("jetwork".slice(0, "jetwork".lastIndex.next(-4)));
```

## Characters

Character count:

```
trace(string1.chars().length());
```

Character count between *i* and *j*:

```
trace(string1.slice(i, j).chars().length());
```

Whether the string is empty or not:

```
trace(string1.isEmpty);
trace(string1 == "");
```

The following is the string length in the encoding units:

- for the UTF-8 encoding, the following is the number of bytes;
- for the UTF-16 encoding, the following is the number of UCS-2 units;
- for the UCS-4 encoding, the following is the number of Scalar Values;

```
trace(string1.length);
```

## Miscellaneous

Scalar value at *i*:

```
const char: Char = string1.charAt(i);
```

For each Scalar Value:

```
for each (const char in string1) {
    /* char: Char */
}
```