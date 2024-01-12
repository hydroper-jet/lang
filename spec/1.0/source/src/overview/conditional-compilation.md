# Conditional compilation

A simplified conditional language with the same lexical grammar as that of the Jet language is supported by Jet, used within conditional compilation.

The Jet language supports the `configuration` directive to allow expanding directives using the conditional language.

```
package com.x.y {
    configuration {
        if (air::target=ios) {
            public function helloPlatform(): void {
                trace("Hello, iOS!");
            }
        } else {
            public function helloPlatform(): void {
                trace("Hello, non iOS platform!");
            }
        }
    }
}
```

The JetPM package manifest allows specifying sources with conditional compilation by using the top-level `configuration` option.

## Conditional language

The conditional language used with JetPM `configuration` property and the `configuration` directive supports the following expression forms:

* `constant` — If a JetPM constant is present
* `constant=value` — If a JetPM constant is equals `"value"`
* `constant!=value` — If a JetPM constant is not equals `"value"`
* `!expression` — If condition is false
* `(expression)` — Parenthesized condition
* `expression && expression` — If conditions are true
* `expression || expression` — If one condition is true