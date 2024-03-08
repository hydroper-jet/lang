# Jet motivation

The Jet project is primarily influenced by the following projects:

* ActionScript 3
* ECMAScript 4th edition
* SpiderMonkey ECMAScript for XML (E4X)
* Cargo for Rust

About platforms:

* **AIR**: Futurely, once the base compiler is completed, I would support the Samsung HARMAN AIR and Node.js platforms, which I'm familiar with. For AIR, I would like to support XML components, similiar to Apache Royale, Adobe Flex or Apache Flex.
* **UE**: I have interest in supporting Unreal Engine if I could figure out a way to magically translate Jet bytecode into hidden C++ and do a lot of internal tricks, but I'm not really that experienced with C++ nor do I've any experience with Unreal Engine.
* **Browser**: Another interesting platform is the browser, as websites could be developed, usually through XML components similiar to Apache Royale or Apache Flex.

Although I'm strenghtening myself to implement the base language compiler, it's being too boring to do it alone. I'm pretty motivated, though! Just a little slow, though. Paused at verification. I'd not like to be the only head of the project...

The language is not fully featured as TypeScript as it does not include a throughout type system and type inference; rather it relies more on explicitness in certain contexts where required to take advantage of ahead-of-time verification (including `T(v)` for either conversion or indicating a context type), but it does support basic type inference anyway, including for the object initializer, the array initializer, string literal for enumerations, among others.

Jet goes beyond ActionScript 3 in different places and brings lots of advantages. It is not totally compatible with ActionScript, but I have experienced that existing ActionScript code is left unmaintained and bug prone, even though Adobe AIR, the derivative of Flash Player, is in the hands of Samsung HARMAN, a company that keeps improving and moving forward with the technology.

## Why Jet

Now... why Jet when you can simply setup a TypeScript project?

<blockquote>

...

I don't like the TypeScript ways. I've just experienced a small version break and disliked it.

...

JavaScript does not have at least native type annotations. Then waste time writing verbose JSDoc tags in comments?

...

A build step is still essential for dealing with environment variables and the output directory of package manager artifacts.

...

I don't like the nature of TypeScript at all, even if I could reinvent all the NPM libraries to prevent the TypeScript version issues....

...

I don't feel like using Haxe as I find it complex.

</blockquote>

Simply, there's no language that satisfies me. Jet aims to improve on ActionScript 3 and not implement everything of TypeScript, Haxe or ECMAScript 4 (although I find ECMAScript 4 less complex than TypeScript or Haxe, although it did have different features such as three dimensional properties and units).

It might be a waste of time as I could be implementing a game or something else, but I'm not really happy to develop something with these existing technologies.

So I invite you to visit several parts of the progress specification to see if it suits your needs:

* https://hydroper-jet.github.io/lang/spec/1.0/live/overview.html

