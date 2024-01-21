# JetDoc

The Jet Language supports JetDoc comments featuring a Markdown format and miscellaneous `@` tags. In addition, JetPM packages may contain a JetDoc configuration file for attaching assets and additional sections.

JetDoc comments begin with `/**` and are preprocessed by ignoring leading whitespace and asterisks in every line and follow the following format:

```
/**
 * Main body.
 */
```

The main body of a JetDoc comment, if non-empty, contains a first sentence which spans from the first character to the period character.

When preprocessing whitespace of a JetDoc comment, code blocks retain indentation based on the prefixing line characters:

* If the line starts with zero or more whitespace characters followed by asterisk (`*`) followed by a single whitespace character, the indentantion level starts from after that last single whitespace character.
* If the line starts with zero or more whitespace characters followed by asterisk (`*`), the indentantion level starts from after the asterisk character.
* Otherwise, the indentation level starts at the first character of the line.

## Supported tags

### @default

The `@default` tag specifies a default value for a property in character form.

```
package {
    /**
     * @default 0x09
     */
    public var x: Number = 0x09;
}
```

### @deprecated

```
/**
 * @deprecated
 */

/**
 * @deprecated Message.
 */
```

### @event

Event sections begin with an `@event` tag and may be supplemented by `@eventType`.

```
package {
    import air.events.Event;
    import air.events.EventDispatcher;

    /**
     * @event eventName1 Description.
     *
     * @event eventName2 Description.
     * @eventType Event.EVENT
     *
     * @event eventName3 Description.
     * @eventType Event
     */
    public class ExampleEventDispatcher extends EventDispatcher {}
}
```

### @eventType

The `@eventType` tag supplements the `@event` tag by specifying either:

* The class that represents the event.
* A constant that identifies the event.

The class or constant reference inherits the surrounding scope.

### @example

```
package {
    /**
     * @example
     * ```
     * new C
     * ```
     */
    public class C {}
}
```

### @internal

The `@internal` tag is used to add an internal comment.

```
package {
    /**
     * @internal Enhance this class later.
     */
    public class C {}
}
```

### @param

```
/**
 * @param paramName Description.
 */
```

### @private

The `@private` tag omits a definition from the JetDoc public documentation.

```
package expert.core {
    /**
     * @private
     */
    public var x: Number = 10
}
```

### @return

```
/**
 * @return Description.
 */
```

### @see

The `@see` tag references a definition, with optional display text.

```
/**
 * @see id
 * @see id Display text
 * @see C#x
 * @see C#x Display text
 */
```

A `#name` sequence in the end of a reference indicates an instance property or method.

The reference inherits the surrounding scope.

### @throws

The `@throws` tag indicates a thrown error by reference, with optional display text.

```
/**
 * @throws Error
 * @throws Error Description
 */
```

The reference inherits the surrounding scope.

## Future supported tags

The `@copy` and `@inheritDoc` tags are planned for the future in JetDoc, which involve copying a JetDoc comment from another definition respectively. This requires the JetDoc compiler to update anchor links to point to the right location.

`@copy` is planned to allow using a `#x` fragment to refer to instance properties and methods.

## Configuration file

The optional `jetdoc.json` file, located at the root directory of the JetPM package allows attaching assets and sections to the documentation.

The following JSON demonstrates an example `jetdoc.json` file:

```json
{
    "path": "docs",
    "files": [
        "**/*.png",
        "**/*.svg",
        "**/*.jpg",
    ],
    "home": {
        "title": "My package",
        "path": "home.md",
    },
    "sections": [
        {
            "title": "Foo",
            "path": "foo.md",
            "sections": []
        }
    ]
}
```

### files property

The top-level `files` property contains zero or more file paths using a match pattern. Files are resolved from the directory specified by the top-level `path` property.

### home property

The optional top-level `home` property specifies a home section.

### sections property

The top-level `sections` property specifies zero or more sections other than the optional home section.

A section may specify the following properties:

* `title` (required) — The section title as a string.
* `path` (required) — The path to the Markdown document of the section, relative to the directory specified by the top-level `path` property.
* `sections` (optional) — A list of subsections.