# Overview

This section contains a non-normative overview of the Jet language.

Jet is an object-oriented programming language for performing computations and manipulating computational objects within a host environment. Jet as defined here is not intended to be computationally self-sufficient; indeed, there are no provisions in this specification for input of external data or output of computed results. Instead, it is expected that the computational environment of a Jet program will provide not only the objects and other facilities described in this specification but also certain environment-specific *host* objects, whose description and behaviour are beyond the scope of this specification except to indicate that they may provide certain properties that can be accessed and certain functions that can be called from a Jet program.

Jet is designed after the ActionScript 3 language.

Jet incorporates two features that aim to accelerate large scale development: JetDependencies and JetDoc, described in respective subsections.

## Language Overview

### Jet for XML

Jet for XML (J4X) is an incorporated Jet feature based on the ECMAScript for XML standard, ECMA-357 second edition. J4X provides types, values, objects, properties, and program syntax and semantics for processing and manipulating XML data.

```
const person = <Person>
    <name>Razen</name>
    <interest type="farming" rate="0.5"/>
    <interest type="quantumPhysics" rate="1"/>
</Person>

trace(person.name.toString())
trace(Number(person..interest.(@type == "quantumPhysics")[0].@rate) == 1)
```

### Internal Properties

Unlike with ActionScript 3, the Jet language does not include three-dimensional properties that belong to a namespace.

In ActionScript 3, where it is common to share internal properties throughout a codebase using namespaces, in Jet it is rather common to share internal properties throughout a codebase using public properties with the JetDoc **\@private** tag.

```
package q1.n1 {
    public class C1 {
        /** @private */
        public var Q1Internals_x;
    }
}
```

### JetDependencies

Jet incorporates JetDependencies, a dependency manager that supports describing dependency packages and performing a series of commands to manage dependencies.

Dependencies in JetDependencies do not conflict in terms of the implementation.

### Native Extensions

***Native extensions*** are libraries that extend a framework with functionality that is not natively available. Jet aids in developing native extensions through the combination of meta-data and conditional compilation, leaving the rest to the implementation of Jet. The programmer may attach files to meta-data, including those that are JetDependencies artifacts.

```
[N1(File(output + "data.bin"))]
class C1 {
    [N1(name = "f")]
    function f(): void;
}
configuration {
    if (k=a) {
        trace("k=a");
    } else {
        trace("Something else");
    }
}
```

### JetDoc

JetDoc is a documentation feature incorporated in the Jet language. JetDoc and JetDependencies are related in that JetDependencies is able to auto publish JetDoc documentation once a package is published.

The following program demonstrates documenting a class that is allowed to be constructed through an object initializer.

```
package n1.p {
    /**
     * `C`
     *
     * @example
     *
     * ```
     * import n1.p.*;
     * const o: C1 = { q: true };
     * ```
     */
    [Literal]
    public class C1 {
        /**
         * Q
         */
        public var q: Boolean;
    }
}
```

### Compilation Cycle

The Jet compilation cycle can be resumed as in the following chart:

![Compilation cycle](compilation-cycle.png)

The compiler used throughout the above process is specified by the JetDependencies platform.

#### Jet Bytecode

*Note: the Jet bytecode is undocumented as the Jet compiler is a work in progress. The Jet bytecode shall be similiar to the ActionScript Virtual Machine 2 bytecode format by Adobe.*

*Note: the Jet bytecode shall support the following:*

* *Meta-data with source location attached to definitions*
* *Meta-data with source location attached to specific code regions of a function as result of annotatated block statements*

### Data Types

#### String Data Type

The **String** data type uses an implementation-defined encoding to represent a sequence of characters. **String** indices identify a character in the encoding unit.

**Snippets**

| Snippet | Description |
| ------- | ----------- |
| s.chars().length() | Character count. |
| s.length | Number of encoding units. |
| s.charAt(i) | Unicode scalar value at *i*. |

### Exceptions

Jet supports throwing errors as in Java, in the form of unchecked exceptions that may occur during program execution.

```
function f(): void {
    throw new RangeError()
}
try {
    f()
} catch (error: RangeError) {
    f1()
}
```

JetDoc comments use the **@throws** tag to describe thrown errors, as in:

```
package n1.n2 {
    /**
     * @throws n1.n2.N2Error
     */
    public function f(): void {}
}
```

### Property Disambiguation

There are two types of properties: **fixed** and **dynamic** properties. Fixed properties shadow dynamic properties by default.

Fixed properties are those defined at the class fixture. Dynamic properties are those resulting from property accessor proxies.

The **Map** class is one of those classes that commonly use dynamic properties using a textual name.

```
const o = { x: 10 }
o.x++
```

Disambiguation between accessing fixed and dynamic properties may be done explicitly through the reserved J4X qualifiers **fixed** and **dynamic**.

```
o.fixed::x
o.dynamic::x
```

### Nullability

Nullability in the Jet language takes the preference of using the **null** value to indicate absence of value, however the **undefined** value exists as part of the **void** type and as therefore as part of the **\*** type.

The type **T?**, or **?T**, consists of the values of **T** and **null**.

The type **T!** consists of the values of **T** but **null**.

Certain operators are supported for nullability, such as the nullish coalescing operator (**x ?? y**), the non-null operator (**o!**), and the optional chaining operator (**?.**). These operators consider solely the values **undefined** and **null** as absence of value.

The nullish coalescing operator (**x ?? y**) returns the right operand if the left operand is **undefined** or **null**.

```
x ?? y
```

The non-null operator (**o!**) ensures the operand is not **null** and not **undefined**.

```
o!
```

The optional chaining operator (**?.**) returns the absent value if the base object is **undefined** or **null**, or otherwise performs a chain of operations on the base object.

```
o?.f()
o?.[k]
o?.()
```

### Overriding Language Behavior

Operations of the Jet language may be customized through **proxies**. Proxies are special methods defined with the **proxy** attribute.

```
class C {
    const v;
    function C(a) { v = a }
    proxy function add(c: C): C (new C(this.v + c.v));
}
trace((new C(10) + new C(10)).v)
```

### Framework File Extensions

Frameworks that allow rapid interactive user interface development take the approach of processing customized file extensions as part of a JetDependencies platform. Maintainers of a JetDependencies platform import the compiler APIs, including the semantics, parser, and verifier, to process such file extensions.

Customized file formats supported by frameworks extend the XML language in general, describing an user interface component or a component library. XML formats may allow literal Jet code, either as a sequence of directives or as an expression.

### Parameterized Types

The Jet language supports simple parameterized types.

```
class C.<T> {}
```

Implementations prefer performing polymorphism for parameterized types, but polymorphism may not be used for the **Array** class applied with a certain primitive type such as **Number**.

With polymorphism, type parameters are substituted by the **\*** type during runtime and additional compile-time verification applies when using parameterized types.

The Jet language does not support constraints on type parameters in the present, such as those present in the Java language.

The Jet language does not support type parameters for methods in the present.

### Untyped Code

The Jet language includes bland type inference and there are cases where the programmer may need explicitness to take advantage of compile-time facilities. For example, the language does not support union types and there are places where the programmer is able to pass more than one data type.

The call operator (**T()**) where **T** is a type, is equivalent to a type conversion. Such call operator passes **T** as the context type to the first argument, opening room for type inference.

```
[Literal]
class Options {
    const x: String
}

function f(options) {
    switch type (options) {
        case (value: Number) {
            // Number
        }
        case (options: Options) {
            // Options
        }
    }
}

f(10)
f(Options( { x: "string" } ))
```

### Environment Variables

Jet includes a built-in mechanism for loading **environment variables** using the **import.meta.env** expression.

```
import.meta.env.EXAMPLE
```

The result of loading environment variables is implementation defined, however it is expected that an implementation loads an **.env** file from the directory of the main JetDependencies package, also referred to as a **DotEnv** file.

### JetDependencies Artifact Output

The ability of accessing the directory to which JetDependencies produces artifacts is valuable since such directory varies across JetDependencies compilations. The Jet language includes certain ways of accessing such directory, called the **artifact output** of JetDependencies.

The **import.meta.output** expression evaluates to a string identifying the JetDependencies artifact output directory.

```
import node.filesystem.*;

// Locate <output>/my/data.txt
const file = new File(import.meta.output).resolvePath("my/data.txt");

// Write to <output>/my/data.txt
file.write("Text");
```

As seen in an earlier section, meta-data support file entries resolving files from the JetDependencies artifact output through the **output + "path/to/file"** expression.

The **embed** expression supports embedding files from the JetDependencies artifact output.

```
const bytes = embed {
    source: output + "auto/generated.bin",
    type: ByteArray,
};
```

## Definitions

For the purpose of of this specification the following definitions apply:

### Type

A set of data values.

### Primitive type

One of the types **void**, **null**, **Boolean**, **Number**, **Single**, **Long**, **BigInt**, **String**, or **Char**.

### Primitive value

A member of one of the primitive types. A primitive value is a datum that is represented directly at the lowest level of the language implementation.

### Object

A set of zero or more properties.

### Property

A key-value pair belonging to an object. The key of a property may be alternatively referred to as a name.

### Method

A method is a property that may be invoked as a function.

### XML

The Extensible Markup Language (XML) is an information encoding standard endorsed by the
World Wide Web Consortium (W3C) for sending, receiving, and processing data across the World
Wide Web. XML comprises a series of characters that contains not only substantive information,
called character data, but also meta-information about the structure and layout of the character
data, called markup.

### Markup

One of the two basic constituents of XML data (the other is character data). Markup is a series of
characters that provides information about the structure or layout of character data. Common
forms of markup are start-tags, end-tags, empty-element tags, comments, CDATA tag delimiters,
and processing instructions. 

### Character data

One of the two basic constituents of XML data (the other is markup). Character data is a series of
characters that represents substantive data encapsulated by XML markup. Character data is
defined as any series of characters that are not markup.

### Tag

A single markup entity that acts as a delimiter for character data. A tag can be a start-tag, an endtag, or an empty-element tag. Start-tags begin with a less than (&lt;) character and end with a
greater than (&gt;) character. End-tags begin with a pairing of the less than and slash characters (&lt;/)
and end with a greater than (&gt;) character. Empty-element begin with a less than (&lt;) character and
end with a pairing of the slash and greater than (/>) characters. 

### Element

A data construct comprising two tags (a start-tag and an end-tag) that delimit character data or
nested elements. If neither character data nor nested elements exist for a given element, then the
element can be defined by a single empty-element tag. Every well-formed XML document contains
at least one element, called the root or document element.

### Attribute

An optional name-value pair, separated by an equal sign (=), that can appear inside a tag.
Attributes can store information about an element or actual data that would otherwise be stored as
character data.

### Namespace

A group of identifiers for elements and attributes that are collectively bound to a Uniform Resource Identifier (URI) such that their use will not cause naming conflicts when used with identically named identifiers that are in a different namespace. 

### processing-instruction

A markup entity that contains instructions or information for the application that is processing the
XML. Processing-instruction tags begin with a combination of the less than (&lt;) character and a
question mark (?) character (&lt;?) and end with the same combination of characters but in reverse
order (?>). 

### Directory

A list of zero or more files and zero or more subdirectories, created at a path in a file system similiar to how files are stored at a path in a file system.

### File

Either textual or binary data stored at a path in a file system. Resolutions may be performed from a file path to another file path.

### Filename

The name of a file.

### JetDependencies package

A dependable unit as part of the JetDependencies dependency manager. A JetDependencies package **must not** be mistaken as a package.

### JetDependencies workspace

A ***JetDependencies workspace*** consists of multiple JetDependencies packages.

### JetDependencies platform

An unique identifier that distinguishes dependencies of different implementations.

### JetDependencies script

An invokable JetDependencies package as part of another JetDependencies package.

### JetDependencies constant

A key-value constant consisting of strings supplied to the JetDependencies build system.

### Command line

Application for entering commands in the user device.

### Markdown

A plain text format for writing structured documents as specified by the CommonMark Specification.

### Git

A version control system.