Terminals '{' '}' '[' ']' ':' ',' null true false string int float.
Nonterminals value array array_elements.
Rootsymbol value.

% Atomic values / terminals / leaves
value -> null : nil.
value -> true : true.
value -> false : false.
value -> string : extract_value('$1').
value -> int : extract_value('$1').
value -> float : extract_value('$1').

% Compound values / combinations of other tokens
value -> array : '$1'.

array -> '[' array_elements ']' : '$2'.
array -> '[' ']' : [].
array_elements -> value ',' array_elements : ['$1' | '$3'].
array_elements -> value : ['$1'].

Erlang code.

extract_value({_, _, Value}) -> Value.
