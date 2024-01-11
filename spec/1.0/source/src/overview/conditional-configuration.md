# Conditional configuration

A simplified conditional language with the same lexical grammar as that of the Jet language is supported by Jet.

It supports the following expression forms:

* `constant` — If a JetPM constant is present
* `constant=value` — If a JetPM constant is equals `"value"`
* `constant!=value` — If a JetPM constant is not equals `"value"`
* `!expression` — If condition is false
* `(expression)` — Parenthesized condition
* `expression && expression` — If conditions are true
* `expression || expression` — If one condition is true

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

The JetPM package manifest allows specifying sources with conditional configuration by using the top-level `configuration` option.