<p align="center">
  <img alt="JetWork Icon" src="assets/icon.png" width="100">
</p>

# Overview

JetWork is a flexible, productive, robust, strongly typed, object-oriented, multi-purpose scripting language. JetWork is influenced by ActionScript.

This document specifies the language syntax, semantics and execution, but may lack some definitions from the ECMA-262 standard in which it is partially based.

## Native extensions

The language allows libraries known as *native extensions* to be developed through the combination of [plain meta-data](metadata/plain-metadata.md) and [conditional configuration](overview/package-manager.md#conditional-configuration).

Plain meta-data allow embedding arbitrary files with binary content, such as dynamic-link libraries, as well as textual files such as application descriptors.

Conditional configuration is used solely at the package manifest of a JetWork project and allows including program sources and dependencies in a conditional way.