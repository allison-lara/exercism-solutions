-module(accumulate).
-export([accumulate/2]).

accumulate(Fn, List) -> 
    accumulate(Fn, List, []).

accumulate(_, [], Acc) -> Acc;
accumulate(Fn, [H|T], Acc) -> 
    accumulate(Fn, T, Acc ++ [Fn(H)]).

