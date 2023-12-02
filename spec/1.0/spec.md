# JetWork 1 Language Specification

## 1. Overview

JetWork is a flexible, strongly typed, multi-purpose scripting language that strives to be in a balance between simplicity and performance.

The language is a fusion of the ActionScript 3 and Rust languages.

## 1.1. Example programs

### 1.1.1 isEven function

```
public function isEven(argument: BigInt): Boolean (
    argument % 2 == 0
);
```