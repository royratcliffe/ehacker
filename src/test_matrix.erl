-module(test_matrix).

-include_lib("eunit/include/eunit.hrl").

dimensions_test() ->
  ?assertEqual({0, 0}, matrix:dimensions([])),
  ?assertEqual({0, 1}, matrix:dimensions([[]])),
  ?assertEqual({1, 3}, matrix:dimensions([[a], [b], [c]])),
  ?assertEqual({3, 1}, matrix:dimensions([[a, b, c]])).

transpose_test() ->
  ?assertEqual([[1],[2],[3]], matrix:transpose([[1, 2, 3]])),
  ?assertEqual([[1, 2, 3]], matrix:transpose([[1],[2],[3]])).
