# Documentation

JetDoc is the API documentation form integrated in the Jet language.

## Auto publishing

Published JetPM packages automatically publish online JetDoc documentation.

## Comment format

JetDoc allows Markdown text to appear within API documentation comments and supports special `@` tags for extended use.

```
package org.ourdelivery.api {
    /**
     * Delivery options.
     * @example
     * ```
     * import org.ourdelivery.api.*;
     * const options: RequestOptions = {
     *     urgent: true,
     * };
     * ```
     */
    [Literal]
    public class RequestOptions {
        /**
         * Indicates whether the request is *urgent*.
         */
        public var urgent: Boolean;
    }
}
```