# JetDoc comments

JetDoc comments are used to document APIs to the public. JetDoc allows Markdown text to appear within documentation comments and supports special `@` tags for extended use.

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