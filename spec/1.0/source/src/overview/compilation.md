# Compilation and transpilation

JetWork compiles to the JetWork Virtual Machine Bytecode, which, in turn, can be compiled to other languages or be executed by a virtual machine.

JetWork can be compiled to native code and can be transpiled to another object-oriented high-level language.

## String encoding

The String data type uses an implementation-defined encoding and is supported by a CharIndex data type representing a string index into it. CharIndex holds the original string and the integer index. CharIndex defines a `next()` method that walks Unicode Scalar Values in the encoded string, returning the final CharIndex. The zero literal (`0`) implicitly converts to CharIndex.

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

## Number overflow

Operations whose result cannot be represented due to range limit cause a number overflow, such as `Int.MAX_VALUE + 1`. The result of a number overflow is implementation defined.

## Exceptions

JetWork supports checked exceptions and fatal exceptions, which facilitates different implementations of the language. Fatal exceptions are known as *panics* in other languages; fatal exceptions are not caught by user code in JetWork.