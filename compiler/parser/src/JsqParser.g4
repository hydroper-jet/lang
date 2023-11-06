parser grammar JsqParser;

options {
    tokenVocab = JsqLexer;
    language = CSharp;
}

program
    : EOF
    ;