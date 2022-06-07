-module(matrix).

-export([dimensions/1, transpose/1]).

-type t() :: [] | [[any()]].

%% @doc Dimensions of matrix.

-spec dimensions(T::t()) -> {M::non_neg_integer(), N::non_neg_integer()}.

dimensions([]) -> {0, 0};
dimensions([H|T]) -> dimensions(T, length(H), 1).

dimensions([], M, N) -> {M, N};
dimensions([H|T], M, N) when length(H) == M -> dimensions(T, M, N + 1).

%% @doc Transposes matrix.
%%
%% Recursion ends when all the members X of matrix T match the empty list
%% [] and this cannot appear as a guard condition because lists:all/2 cannot
%% execute within a guard.

-spec transpose(T::t()) -> t().

transpose(T) ->
    case lists:all(fun (X) -> X == [] end, T) of
        true -> [];
        false -> [lists:map(fun erlang:hd/1, T)|transpose(lists:map(fun erlang:tl/1, T))]
    end.
