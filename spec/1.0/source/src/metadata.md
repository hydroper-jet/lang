# Meta-data

Directive attributes using brackets notation are called **meta-data**. Meta-data consist of a name and an optional list of key-value entries, including keyless entries.

```
[N1(x = 10)]
const x

[N2] { f() }
```

The interpretation of meta-data is implementation defined, except of that of the reserved meta-data listed in the following subsections.

**Syntax**

<ul>
    <i>MetadataForm</i> :
    <ul>
        <i>MetadataName</i><br>
        <i>MetadataName</i> <b>(</b> <i>MetadataEntryList</i><sub>opt</sub> <b>)</b>
    </ul>
</ul>

<ul>
    <i>MetadataName</i> :
    <ul>
        <i>Identifier</i><br>
        <i>Identifier</i> <b>::</b> <i>IdentifierName</i>
    </ul>
</ul>

<ul>
    <i>MetadataEntryList</i> :
    <ul>
        <i>MetadataEntry</i><br>
        <i>MetadataEntryList</i> <b>,</b> <i>MetadataEntry</i>
    </ul>
</ul>

<ul>
    <i>MetadataEntry</i> :
    <ul>
        <i>MetadataValue</i><br>
        <i>MetadataName</i> <b>=</b> <i>MetadataValue</i>
    </ul>
</ul>

<ul>
    <i>MetadataValue</i> :
    <ul>
        <i>MetadataName</i><br>
        <i>StringLiteral</i><br>
        <i>NumericLiteral</i><br>
        <b>-</b> <i>NumericLiteral</i><br>
        <i>BooleanLiteral</i><br>
        <b>List (</b> <i>MetadataEntryList</i><sub>opt</sub> <b>)</b><br>
        <b>File (</b> <i>FileMetadataPath</i> <b>)</b>
    </ul>
</ul>

<ul>
    <i>FileMetadataPath</i> :
    <ul>
        <i>StringLiteral</i><br>
        <b>output +</b> <i>StringLiteral</i>
    </ul>
</ul>

**Semantics**

A *MetadataName* entry value is equivalent to a string.

*NumericLiteral* is interpreted as a IEEE 754 double-precision floating point possibly preceded by a minus sign **-**.

A **File** entry value is interpreted as resolving to a file. If the path starts with **output +**, then the file is resolved relative to the artifact output directory of JetDependencies; otherwise the file is resolved relative to the parent directory of the enclosing file.

## Reserved Meta-data

This section enumerates meta-data that are reserved in certain contexts.

### Literal

The **Literal** meta-data is reserved at the **class** definition. It is used for indicating that the class can be initialized through an object initializer.

### Set

The **Set** meta-data is reserved at the **enum** definition. It is used for indicating that the **enum** is a set enumeration.