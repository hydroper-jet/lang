# Compilation and transpilation

Jet can be compiled to other high-level languages or be executed by a virtual machine. For Jet support, a platform must provide its own compiler subset of the Jet Compiler that may traverse the abstract syntax tree and read compile-time symbols, produce Jet bytecode, and then final evaluable code.

Creating Jet compiler subsets allow supporting special file extensions supported by frameworks such as XML components possibly containing Jet programs and interpolated expressions. Frameworks based on XML components generate an abstract syntax tree and may use the available parser facade methods to parse what is neccessary.

## Jet bytecode

The Jet bytecode is undocumented as the Jet compiler is a work in progress and will be similiar to the ActionScript Virtual Machine 2 bytecode format.

The Jet bytecode will feature meta-data attached with source locations among definitions and specific code regions of a function as result of annotatated standalone block statements, allowing platforms to report errors ahead of time on unrecognized meta-data.