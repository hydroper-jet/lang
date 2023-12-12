Misc.:

* [ ] Program

Directives:

* For annotatable directives, describe supported attributes and supported meta data.
* [ ] Use definition
  * Dots are followed by IdentifierName and an final optional `.*` in an identifier path
  * `use * from "path";`
    * Describe implicit file extensions
* [ ] Class definition
* [ ] Enum definition
* [ ] Interface definition
* [ ] Type definition
* [ ] Variable definition
* [ ] Function definition
* [ ] Proxy definition
* [ ] Getter definition
* [ ] Setter definition
* [ ] Module definition
* [ ] Namespace definition

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

* [ ] QualifiedIdentifier
* [ ] BooleanLiteral
* [ ] NumericLiteral
* [ ] StringLiteral
* [ ] ThisExpression
* [ ] SuperExpression
  * `super` may be used alone to refer to a super module.
* [ ] ThisPackageExpression
  * `this package` is used to refer to the package module.
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
* [ ] DescendantsExpression (`o..x`)
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
* [ ] This (refers either to the enclosing module or the type itself)
* [ ] Super (always refers to the enclosing module's super module)
* [ ] This package (always refers to the package's module)
* [ ] Function
  * [ ] `throws`
* [ ] Array
* [ ] Optional (`T?`, `?T`)
* [ ] Tuple
* [ ] TypeExpressionWithTypeArguments (`G.<T1, ...Tn>`)