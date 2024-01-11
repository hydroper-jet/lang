# Conditional configuration

A simplified conditional language with the same lexical grammar as that of the JetWork language is supported by JetWork.

It supports the following expression forms:

* `constant` — If a JetWorkPM constant is present
* `constant=value` — If a JetWorkPM constant is equals `"value"`
* `constant!=value` — If a JetWorkPM constant is not equals `"value"`
* `!expression` — If condition is false
* `(expression)` — Parenthesized condition
* `expression && expression` — If conditions are true
* `expression || expression` — If one condition is true

The JetWork language supports the `configuration` directive to allow expanding directives using the conditional language.

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

The JetWorkPM package manifest allows specifying sources with conditional configuration by using the top-level `configuration` option.