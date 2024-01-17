# Overview

Jet is a flexible scripting language influenced by ActionScript.

This document specifies the language syntax, semantics and execution, but may lack some definitions from the ECMA-262 standard in which it is partially based.

## Native extensions

The language allows libraries known as *native extensions* to be developed through the combination of [plain meta-data](metadata/plain-metadata.md) and [conditional compilation](overview/conditional-compilation.md).

Plain meta-data allow embedding arbitrary files with binary content, such as dynamic-link libraries, as well as textual files such as application descriptors.

Conditional compilation may be used at the package manifest of a Jet project and allows including program sources and dependencies in a conditional way.