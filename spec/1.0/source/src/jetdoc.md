# JetDoc

## Comments

JetDoc comments support a Markdown format and miscellaneous **@** tags.

JetDoc comments begin with **/\*\*** and are preprocessed by ignoring leading whitespace and asterisks in every line and follow the following format:

```
/**
 * Main body.
 */
```

The main body of a JetDoc comment, if non-empty, contains a first sentence which spans from the first character to the period character.

When preprocessing whitespace of a JetDoc comment, code blocks retain indentation based on the prefixing line characters:

* If the line starts with zero or more whitespace characters followed by asterisk (**\***) followed by a single whitespace character, the indentantion level starts from after that last single whitespace character.
* If the line starts with zero or more whitespace characters followed by asterisk (**\***), the indentantion level starts from after the asterisk character.
* Otherwise, the indentation level starts at the first character of the line.

## Supported tags

### @default

The **@default** tag specifies a default value for a property in character form.

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

Event sections begin with an **@event** tag and may be supplemented by **@eventType**.

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

The **@eventType** tag supplements the **@event** tag by specifying either:

* The class that represents the event object.
* A constant that identifies the event, where the base class represents the event object.

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

### @image

The **@image** tag loads an image relative to the directory of the source file and saves it to the same JetDoc output directory of the containing package with the same filename.

```
/**
 * @image path/to/file
 */
```

### @internal

The **@internal** tag is used to add an internal comment.

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

The **@private** tag omits a definition from the JetDoc public documentation and omits it from autocomplete lists in the language server protocol.

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

The **@see** tag references a definition, with optional display text.

```
/**
 * @see id
 * @see id Display text
 * @see C#x
 * @see C#x Display text
 */
```

A **\#name** sequence in the end of a reference indicates an instance property or method.

The reference inherits the surrounding scope.

### @throws

The **@throws** tag indicates a thrown error by reference, with optional display text.

```
/**
 * @throws Error
 * @throws Error Description
 */
```

The reference inherits the surrounding scope.

## Future supported tags

The **@copy** and **@inheritDoc** tags are planned for a future version of JetDoc, which involve copying a JetDoc comment from another definition respectively. This requires the JetDoc compiler to update anchor links to point to the right location.

**@copy** is planned to allow using a **\#x** fragment to refer to instance properties and methods.

## Configuration file

The optional **jetdoc.json** file, located at the directory of a JetDependencies package allows attaching assets and sections to the documentation. The **jetdoc.json** file contains descriptions encoded as a JSON object.

The following is an example of a **jetdoc.json** file:

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

### Schema

#### path

**path** is a required property must be a string that specifies the base path for resolving paths referenced in the top-level **files** property and in each section.

#### files

The optional **files** property must be an array containing zero or more strings as file paths that use a match pattern. Files are relative to the directory specified by the **path** property.

#### home

The optional **home** property specifies a home section.

#### sections

The optional **sections** property specifies zero or more sections other than the optional home section.

#### Section

A section must be an object.

##### title

The **title** property of a section is required and must be a string defining the section title.

##### path

The **path** property of a section is required and must be a string describing the path to the Markdown document relative to the directory specified by the **path** property of the **jetdoc.json** file.

##### sections

The **sections** property of a section is optional and must be an array containing zero or more subsections.