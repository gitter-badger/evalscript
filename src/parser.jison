/* lexical grammar */
%lex
%%

\s+                                   /* skip whitespace */
"//".*                                /* Ignore */
[/][*][^*]*[*]+([^/*][^*]*[*]+)*[/]   /* Ignore */
\n+                                   return 'NEWLINE'

'eval'                                return 'EVAL'

'{'                                   return '{'
'}'                                   return '}'
')'                                   return ')'
'('                                   return '('
'='                                   return '='
'!='                                  return '!='
'->'                                  return '->'
'!'                                   return '!'
'+'                                   return '+'
'-'                                   return '-'
'*'                                   return '*'
'/'                                   return '/'
'<'                                   return '<'
'>'                                   return '>'

(['](\\.|[^']|\\\')*?['])+            return 'STRING'
(["](\\.|[^"]|\\\")*?["])+            return 'STRING'

[0-9]+("."[0-9]+)?\b                  return 'NUMBER'
[_a-zA-Z]+[_a-zA-Z0-9]*\b             return 'VAR'

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
  | EVAL '{' statements '}'
    { $$ = yy.printStatement($3); }

  /* if */
  | EVAL '(' p ')' '{' statements '}'
    { $$ = yy.ifStatement($3, $6); }

  /* set var */
  | EVAL i i
    { $$ = yy.setVar($2, $3); }
  | EVAL i '->' d
    { $$ = yy.setVar($2, $4); }

  /* create function */
  | EVAL i '(' ')' '{' statements '}'
    { $$ = yy.createFunc($2, $6); }

  /* pure function call */
  | EVAL i '(' ')'
    { $$ = $2 + '();\n'; }

  /* math */
  | EVAL m
    { $$ = $2; }

  /* */
  | EVAL i '!'
    { $$ = yy.alertStatement($2); }
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
  : i '=' i
    { $$ = $1 + ' === ' + $3; }
  | i '!=' i
    { $$ = $1 + ' != ' + $2; }
  | '!' i
    { $$ = '!' + $2; }
  | i '<' i
    { $$ = $1 + ' < ' + $3; }
  | i '>' i
    { $$ = $1 + ' > ' + $3; }
  ;

m
  : i '+' i
    { $$ = $1 + ' + ' + $3; }
  | i '-' i
    { $$ = $1 + ' - ' + $3; }
  | i '*' i
    { $$ = $1 + ' * ' + $3; }
  | i '/' i
    { $$ = $1 + ' / ' + $3; }
  ;