Definitions.

KEYWORD    = null|true|false
STRING     = "[^\"]+"
SYMBOL     = [{}\[\]:,]
WHITESPACE = [\s\t\r\n]+

Rules.

{KEYWORD}          : {token, {list_to_atom(TokenChars), TokenLine}}.
{STRING}           : {token, {string, TokenLine, extract_string(TokenChars)}}.
{SYMBOL}           : {token, {list_to_atom(TokenChars), TokenLine}}.
{WHITESPACE}       : skip_token.

Erlang code.

extract_string(Chars) ->
    list_to_binary(lists:sublist(Chars, 2, length(Chars) - 2)).
