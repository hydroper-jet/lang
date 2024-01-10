# JWDoc documentation tool

JWDoc is an API documentation tool that coworks with the JetWork language.

## JWPM registry

Online published JWPM packages automatically host online web pages in the JWPM website.

## Comment format

JWDoc allows Markdown text to appear within API documentation comments and supports special `@` tags for extended use.

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