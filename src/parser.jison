/* lexical grammar */
%lex
%%

\s+                   /* skip whitespace */

"eval"                                return 'EVAL'

"{"                                   return "{"
"}"                                   return "}"
")"                                   return ")"
"("                                   return "("
"="                                   return "="
"!="                                  return "!="
"->"                                  return "->"
"!"                                   return "!"
"+"                                   return "+"
"-"                                   return "-"
"*"                                   return "*"
"/"                                   return "/"
"<"                                   return "<"
">"                                   return ">"

(['](\\.|[^']|\\\')*?['])+            return "STRING"
(["](\\.|[^"]|\\\")*?["])+            return "STRING"

[0-9]+("."[0-9]+)?\b                  return "NUMBER"
[_a-zA-Z]+[_a-zA-Z0-9]*\b             return "VAR"

<<EOF>>                               return 'EOF'
.                                     return 'INVALID'

/lex

%start program

%% /* language grammar */

program
  : statements EOF
    { return $1 }
  ;

statements
  : d
    { $$ = $1; }
  | statements d
    { $$ = $1.concat($2); }
  ;

d
  /* console.log */
  : EVAL i
    { $$ = yy.printStatement($2); }

  /* if */
  | EVAL '(' p ')' '{' d '}'
    { $$ = yy.ifStatement($3, $6); }
  | EVAL '(' p ')' '{' d '}' EVAL '{' d '}'
    { $$ = yy.ifStatement($3, $6); }
  ;

i
  : STRING
    { $$ = $1; }
  | VAR
    { $$ = $1; }
  | NUMBER
    { $$ = $1; }
  ;

p
  : i '!=' i
    { $$ = $1 + ' != ' + $2; }
  | '!' i
    { $$ = '!' + $2; }
  | i '<' i
    { $$ = $1 + ' < ' + $3; }
  | i '>' i
    { $$ = $1 + ' > ' + $3; }
  ;