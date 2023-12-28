# Build facilities

This section lists facilities related to build process that are included in the language.

## import.meta.outputPath

The `import.meta.outputPath` expression evaluates to the JetPM output directory path. For reliability, the bytecode compiler must emit a special instruction for this expression instead of a string constant.