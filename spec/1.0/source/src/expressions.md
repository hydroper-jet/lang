# Expressions

The syntactic grammar for expressions declares two parameters wherever applicable: *In* and *Yield*, which are true or false. The following special notations apply to these parameters:

* The \[+Parameter\] predicate or clause indicates that a rule only applies if the defining nonterminal has been argumented with truthy value for *Parameter*.
* The \[!Parameter\] predicate or clause indicates that a rule only applies if the defining nonterminal has been argumented with a falsy value for *Parameter*.
* The !Parameter symbol indicates the parameter is false.
* The +Parameter symbol indicates the parameter is true.
* The ?Parameter symbol propagates the parameter value from the defining nonterminal.