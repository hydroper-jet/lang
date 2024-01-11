Misc.:

* [ ] Package definition
* [ ] Program

Directives:

* For annotatable directives, describe supported attributes and supported meta data.
* Do not allow nested classes.
* A class, enum or interface resolves to a `Class` object.
* [ ] Configuration directive
  * Uses the conditional configuration syntax
  * `configuration { ... }`
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

* [x] Super statement
* [x] Block
* [x] If statement
* [x] Switch statement
  * [x] Unlike JavaScript, `switch` supports no fallthroughs. Additionally, a `switch` over an enum must match all of the enum members.
  * [x] `switch type`
    * [x] `default {}`
* [x] Do statement
* [x] While statement
* [x] For statement
* [x] For in statement
  * [x] `for (k in o)`
  * [x] `for each (v in o)`
* [x] Continue statement
* [x] Break statement
* [x] Return statement
* [x] Throw statement
* [x] With statement
* [x] Try statement
* [x] Expression statement
  * `lookahead != ["{", "function"]`
* [x] Labeled statement
* [x] Empty statement
* [x] Default XML namespace statement

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
* [x] ArrowFunction
* [x] XMLMarkup
* [x] XMLInitializer
* [x] XMLListInitializer
* [x] CallExpression
* [x] UnaryExpression
  * [x] Non-null (postfix `!`)
  * [x] `await`
  * [x] `yield`
* [x] BinaryExpression
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
* [x] ListExpression
* [x] ConditionalExpression
* [x] AssignmentExpression
* [x] ExpressionWithTypeArguments (`e.<T1, ...Tn>`)
* [x] EmbedExpression
* [x] ImportMeta (`import.meta`)

Type expressions:

* [x] Any
* [x] Identifier
* [x] Member
* [x] Void
* [x] Undefined
* [x] Function
* [x] Array
* [x] Optional (`T?`, `?T`)
* [x] Tuple
* [x] TypeExpressionWithTypeArguments (`G.<T1, ...Tn>`)
* [x] Parenthesized