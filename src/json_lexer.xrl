Definitions.

KEYWORD    = null|true|false
SYMBOL     = [{}\[\]:,]
WHITESPACE = [\s\t\r\n]+

Rules.

{KEYWORD}          : {token, {list_to_atom(TokenChars), TokenLine}}.
{SYMBOL}           : {token, {list_to_atom(TokenChars), TokenLine}}.
{WHITESPACE}       : skip_token.

Erlang code.
