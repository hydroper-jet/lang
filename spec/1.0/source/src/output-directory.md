# Output directory

This section describes facilities included in the language for working with the JetPM output directory.

## import.meta.output

The `import.meta.output` expression evaluates to the JetPM output directory path.

```
import node.filesystem.*;

// Locate {output}/my/data.txt
const myDataText = new File(import.meta.output).resolvePath("my/data.txt");

// Write to {output}/my/data.txt
myDataText.write("Text");
```

## Meta-data entries

[Plain meta-data](metadata/plain-metadata.md) support file entries resolving files from the JetPM output directory path through the `output + "path/to/file"` form.

```
package q {
    [DLL(library = File(output + "q.dll"))]
    internal class DLL {
        [DLL(name = "f")]
        public native function f(): void;
    }
}
```

## Embedding files

The `embed` expression supports embedding files from the JetPM output directory.

```
const byteArray = embed {
    source: output + "auto/generated.bin",
    type: ByteArray,
}
```