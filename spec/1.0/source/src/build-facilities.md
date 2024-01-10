# Build facilities

This section lists facilities related to build process that are included in the language.

## import.meta.outputDirectory

The `import.meta.outputDirectory` expression evaluates to the JWPM output directory path. For reliability, the bytecode compiler must emit a special instruction for this expression instead of a string constant.