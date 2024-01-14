# Output directory

This section describes facilities included in the language for working with the JetPM output directory.

## import.meta.output

The `import.meta.output` expression evaluates to the JetPM output directory path. For reliability, the bytecode compiler must emit a special instruction for this expression instead of a string constant.

## Meta data entries

[Plain meta data](metadata/plain-metadata.md) support file entries resolving files from the JetPM output directory path through the `File(output, "path/to/file")` form.

```
package com.khronos.opengl {
    [[DLL(library = File(output, "opengl.dll"))]]
    internal class DLL {
        [[DLL(name = "gl_createcontext")]]
        public native function createContext(): void;
    }
}
```

## Embedding files

The `embed` expression supports embedding files from the JetPM output directory.

```
const byteArray = embed {
    source: File(output, "path/to/data.bin"),
    type: ByteArray,
}
```