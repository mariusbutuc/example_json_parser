Definitions.

KEYWORD    = null|true|false
NUMBER     = [0-9]+
STRING     = "[^\"]+"
SYMBOL     = [{}\[\]:,]
WHITESPACE = [\s\t\r\n]+

Rules.

{KEYWORD}          : {token, {list_to_atom(TokenChars), TokenLine}}.
{NUMBER}           : {token, {int, TokenLine, list_to_integer(TokenChars)}}.
{NUMBER}\.{NUMBER} : {token, {float, TokenLine, list_to_float(TokenChars)}}.
{STRING}           : {token, {string, TokenLine, extract_string(TokenChars)}}.
{SYMBOL}           : {token, {list_to_atom(TokenChars), TokenLine}}.
{WHITESPACE}       : skip_token.

Erlang code.

extract_string(Chars) ->
    list_to_binary(lists:sublist(Chars, 2, length(Chars) - 2)).
