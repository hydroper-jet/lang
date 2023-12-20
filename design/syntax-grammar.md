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
* [ ] Module definition

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
  * [ ] Catch clauses must be exhaustive based on exception covariance.
* [ ] Expression statement
  * `lookahead != ["{", "function"]`
* [ ] Labeled statement
* [ ] Empty statement
* [ ] Default XML namespace statement

Expressions:

* [ ] QualifiedIdentifier
* [ ] BooleanLiteral
* [ ] NumericLiteral
  * [ ] Allowed to adapt any number type other than `Number`
* [ ] StringLiteral
  * Inference
    * [ ] `Char`
    * [ ] `enum`
* [ ] ThisLiteral
* [ ] SuperExpression
* [ ] RegExpLiteral
* [ ] ParenExpression
* [ ] ArrayInitialiser
* [ ] ObjectInitialiser
* [ ] FunctionExpression
* [ ] ArrowFunction
* [ ] XMLMarkup
* [ ] XMLInitializer
* [ ] XMLListInitializer
* [ ] CallExpression
* [ ] UnaryExpression
  * [ ] Error propagation (postfix `?`)
  * [ ] Non-error assertion (postfix `!`)
* [ ] BinaryExpression
  * The right-hand side is always any expression and not a type expression. Actual type expressions can be used through type aliases.
  * `v is T`
  * `v is not T`
  * `v as T`
* [ ] MemberExpression (`o.x`)
  * `x` is a qualified identifier
* [ ] ComputedMemberExpression (`o[k]`)
  * Support tuples
* [ ] DescendantsExpression (`o..x`)
* [ ] FilterExpression (`o.(condition)`)
  * [ ] Creates a filter scope that resolves names at runtime
* [ ] NewExpression
* [ ] ListExpression
* [ ] ConditionalExpression
* [ ] AssignmentExpression
  * The left-hand side may be a destructuring pattern.
* [ ] Try expression
  * [ ] Parsing: `lookahead != "{"`
* [ ] ExpressionWithTypeArguments (`e.<T1, ...Tn>`)
* [ ] EmbedExpression
* [ ] ImportMeta (`import.meta`)
- [ ] AwaitExpression
- [ ] YieldExpression

Type expressions:

* [ ] Never
* [ ] Any
* [ ] Identifier
* [ ] Member
  * Dot followed by IdentifierName
* [ ] Void
* [ ] Undefined
* [ ] Function
  * [ ] `throws`
* [ ] Array
* [ ] Optional (`T?`, `?T`)
* [ ] Tuple
* [ ] TypeExpressionWithTypeArguments (`G.<T1, ...Tn>`)