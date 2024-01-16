# JetDoc

The Jet Language supports JetDoc comments featuring a Markdown format and miscellaneous `@` tags.

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

## @default

The `@default` tag specifies a default value for a property in character form.

```
package {
    /**
     * @default 0x09
     */
    public var x: Number = 0x09;
}
```

## @event

Event sections begin with an `@event` tag and may be supplemented by `@eventConstant` and `@eventType`.

```
package {
    import air.events.Event;
    import air.events.EventDispatcher;

    /**
     * @event eventName1 Description.
     * @eventConstant Event.EVENT
     * @eventType Event
     *
     * @event eventName2 Description.
     * @eventConstant Event.EVENT
     * @eventType Event
     */
    public class ExampleEventDispatcher extends EventDispatcher {}
}
```

## @eventConstant

The `@eventConstant` tag supplements the `@event` tag by specifying a constant that identifies the event.

The constant reference inherits the surrounding scope.

## @example

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

## @internal

The `@internal` tag is used to add an internal comment.

```
package {
    /**
     * @internal Enhance this class later.
     */
    public class C {}
}
```

## @param

```
/**
 * @param paramName Description.
 */
```

## @private

The `@private` tag omits a definition from the JetDoc public documentation.

```
package expert.core {
    /**
     * @private
     */
    public var x: Number = 10
}
```

## @return

```
/**
 * @return Description.
 */
```

## @see

The `@see` tag references a definition, with optional display text.

```
/**
 * @see id
 * @see id Display text
 * @see C#x
 * @see C#x Display text
 */
```

The reference inherits the surrounding scope.

## @throws

The `@throws` tag indicates a thrown error by reference, with optional display text.

```
/**
 * @throws Error
 * @throws Error Description
 */
```

The reference inherits the surrounding scope.