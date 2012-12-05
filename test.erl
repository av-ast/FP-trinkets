-module(test).

%-compile(export_all).
-export([map/2, self_test/0]).

map(Fun, List) ->
  map(Fun, List, []).

map(_Fun, [], Acc) ->
  Acc;

map(Fun, [Head|Tail], Acc) ->
  map(Fun, Tail, Acc ++ [Fun(Head)]).
  % map(Fun, Tail, [Fun(Head)|Acc]). - this variant is better due to performance but requires lists:reverse on result

%% TESTS

test1() ->
  [1,4,9,16,25] == map(fun(X) -> X*X end, lists:seq(1,5)).

self_test() ->
  lists:all(fun(X) -> X end,
    lists:duplicate(1000000, test1())).
