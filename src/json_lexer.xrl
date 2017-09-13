Definitions.

KEYWORD    = null|true|false
STRING     = "[^\"]+"
SYMBOL     = [{}\[\]:,]
WHITESPACE = [\s\t\r\n]+

Rules.

{KEYWORD}          : {token, {list_to_atom(TokenChars), TokenLine}}.
{STRING}           : {token, {string, TokenLine, TokenChars}}.
{SYMBOL}           : {token, {list_to_atom(TokenChars), TokenLine}}.
{WHITESPACE}       : skip_token.

Erlang code.
