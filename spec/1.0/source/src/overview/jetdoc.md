# Documentation tool

JetDoc is an API documentation tool that coworks with the Jet language.

## JetPM registry

Online published JetPM packages automatically host online web pages in the JetPM website.

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