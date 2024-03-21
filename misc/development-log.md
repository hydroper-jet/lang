# Development log

Unfortunately, the development of the language has been a mess and I have deleted and re-uploaded certain activities constantly, as well as deleted several accounts, including Google and Stack Overflow accounts. Besides Jet, the only language projects with actual content available currently include VioletScript and a parser for ActionScript 3 in Rust.

## 2017

Beginning at 2017, the person behind the project, me, Matheus Dias de Souza, also nicknamed Hydroper and previously Klaider and Hand on Cloud, was developing several handmade parsers inspired by projects from other authors such as luaparse (a Lua parser) and jQuery Esprima (a JavaScript parser) using different host languages such as Node.js, Java (with Maven) and ActionScript 3, trying to capture the feeling of ActionScript 3 itself, with certain enhancements.

The language projects used to have the following names:

* VegaScript

Throughout that same year, I did publish a handmade ActionScript 3 parser, although I believe I was not parsing all of the language elements correctly, such as meta-data and ASDoc comments were simply ignored. The parser was made in ActionScript 3 itself and I've deleted it posteriously.

I've made parsers several times due to insatisfaction, in different ways and in different environments.

In terms of the host environment, I once was able to write a parser for either an ActionScript 3 dialect or ActionScript 3 itself inside a mobile phone using Android and the Java N-IDE app for compilation.

## 2018

During 2018, I had discovered the Rust language and I was beginning to learn developing verifiers (or type checkers). I was still learning Rust and vastly unexperienced with C++ as well. Throughout these moments, I've reinvented the language idea to feel like Rust; however, the language returned to the ActionScript 3 feeling.

> **Note**: I was not using Rust in anyway for developing parsers or verifiers at that time. Only from 2023 I built my first ActionScript 3 parser in Rust.

The language projects used to have the following names:

* Vega
* VegaScript
* DollScript
* DoveScript

## 2019-2021

From 2019 to 2021 I was continuously in the cycle of restarting the development of parsers and verifiers. The verifiers were more immature than the parsers and it was difficult for me to reach to a verifier, so I had developed verifiers at most 5 times.

Used language project names:

* Vega
* ShockScript
* VegaScript

In 2019 I built an in-depth ActionScript 3 highlighter for Sublime Text, however I found some bugs while developing it:

* https://github.com/alien-as/as-enhanced

At some point in 2020, I have experienced a bug in the ActionScript compiler (the Flex compiler) at the control flow when developing a new verifier after having developed a parser in the ActionScript language, which leaved me a bit frustrated at the time.

* https://forum.starling-framework.org/d/22289-property-access-through-undefined-bug

Do not mind my crazyness on these forums!

## 2022

The last online published verifier prior to Jet is present in an abandoned language. Such verifier contains several bugs and does not perform control flow analysis. The project of such verifier is said to have been first published at the third month of 2023, however I remember it was a little earlier than that (2022).

First commit:

* VioletScript: https://github.com/violetscript/violetc/commit/54c79c5fb0196dcbd84f356a3cd63b57c4415028

Current:

* VioletScript: https://github.com/violetscript/violetc

## 2023

At the ending of the 2023 year, I have abandoned VioletScript as it was not a solid project and have started JetWork. JetWork was then renamed to Jet as part of my nickname.

When comparing Jet to VioletScript and ShockScript, there were a number of feature eliminations:

* Reduced numeric types
* Type inference is limited to solely variable bindings
* Arrow functions eliminated, still retaining function of expression bodies
* Qualifiers (compared to ShockScript) are only used by the Jet for XML feature based on ECMAScript for XML
* Decorators eliminated as meta-data are retained

So far, I've used the following project names:

* VegaScript (2017)
* Vega (2018)
* DollScript or DoveScript (DS) (2018)
* ShockScript (2020)
* VioletScript (2022)
* JetWork (2024)
* Jet (2024)

As of 21 of March, 2024, I've substantially updated the language specification such that it uses a specific structure. The layout is close to ECMA-357 second edition.

## Logo and banners

* Published in February 10 of 2024, 3:49 PM (15:49) GMT-3: https://github.com/hydroper-jet/lang/commit/3ecb228c8ff0b475ac0afb9f8c60d40077cb9cca
