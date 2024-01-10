Misc.:

* [ ] Package definition
* [ ] Program

Directives:

* For annotatable directives, describe supported attributes and supported meta data.
* Do not allow nested classes.
* A class, enum or interface resolves to a `Class` object.
* [ ] Import directive
  * Similiar to `use`
* [ ] Use definition
  * Dots are followed by IdentifierName and an final optional `.*` in an identifier path
  * `use` must be explicitly `public` and must be used solely in package blocks.
* [ ] Class definition
  * `static` attribute
* [ ] Enum definition
* [ ] Interface definition
* [ ] Type definition
* [ ] Variable definition
* [ ] Function definition
  * [ ] May be a constructor function
  * [ ] May be a proxy definition
  * [ ] Getter
  * [ ] Setter

Statements:

* [ ] Super statement
* [ ] Block
* [ ] If statement
* [ ] Switch statement
  * [ ] Unlike JavaScript, `switch` supports no fallthroughs and empty cases are part of the next case. Additionally, a `switch` over an enum must match all of the enum members.
* [ ] Do statement
* [ ] While statement
* [ ] For statement
* [ ] For in statement
  * [ ] `for (k in o)`
  * [ ] `for each (v in o)`
* [ ] Continue statement
* [ ] Break statement
* [ ] Return statement
* [ ] Throw statement
* [ ] With statement
* [ ] Try statement
* [ ] Expression statement
  * `lookahead != ["{", "function"]`
* [ ] Labeled statement
* [ ] Empty statement
* [ ] Default XML namespace statement

Expressions:

* [x] QualifiedIdentifier
* [x] BooleanLiteral
* [x] NumericLiteral
* [x] StringLiteral
* [x] ThisLiteral
* [x] SuperExpression
* [x] RegExpLiteral
* [x] ParenExpression
* [x] ArrayInitialiser
* [x] ObjectInitialiser
* [x] FunctionExpression
* [ ] ArrowFunction
* [x] XMLMarkup
* [x] XMLInitializer
* [x] XMLListInitializer
* [x] CallExpression
* [x] UnaryExpression
  * [x] Non-null (postfix `!`)
* [ ] BinaryExpression
  * The right-hand side is always any expression and not a type expression. Actual type expressions can be used through type aliases.
  * [x] `await`
  * [ ] `yield`
  * [ ] `x ?? y`
  * [ ] `k not in o`
  * [ ] `v not instanceof T`
  * [ ] `v is not T`
* [x] OptionalChaining
  * `?.qid`
  * `?.[k]`
  * `?.(...)`
* [x] MemberExpression (`o.x`)
  * `x` is a qualified identifier
* [x] ComputedMemberExpression (`o[k]`)
  * Support tuples
* [x] DescendantsExpression (`o..x`)
* [x] FilterExpression (`o.(condition)`)
* [x] NewExpression
* [ ] ListExpression
* [ ] ConditionalExpression
* [ ] AssignmentExpression
  * The left-hand side may be a destructuring pattern.
* [x] ExpressionWithTypeArguments (`e.<T1, ...Tn>`)
* [x] EmbedExpression
* [x] ImportMeta (`import.meta`)

Type expressions:

* [x] Any
* [x] Identifier
* [x] Member
  * Dot followed by IdentifierName
* [x] Void
* [x] Undefined
* [x] Function
* [x] Array
* [x] Optional (`T?`, `?T`)
* [x] Tuple
* [x] TypeExpressionWithTypeArguments (`G.<T1, ...Tn>`)
* [x] Parenthesized