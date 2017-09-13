Terminals '{' '}' '[' ']' ':' ',' null true false string int float.
Nonterminals value.
Rootsymbol value.

value -> null : nil.
value -> true : true.
value -> false : false.
value -> string : extract_value('$1').
value -> int : extract_value('$1').
value -> float : extract_value('$1').

Erlang code.

extract_value({_, _, Value}) -> Value.
