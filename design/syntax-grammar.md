Misc.:

* [x] Package definition
* [x] Program

Directives:

* [x] Configuration directive
* [x] Import directive
* [x] Use definition
* [x] Class definition
* [x] Enum definition
* [x] Interface definition
* [x] Type definition
* [x] Variable definition
* [x] Function definition

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