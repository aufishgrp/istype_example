-module(istype_example).

%% API exports
-export([t/0]).

-record(recorda, {a :: test_range()}).
-type test_specific() :: 7.
-type test_int() :: integer().
-type test_range() :: 1..99.
-type test_union() :: atoma | atomb | atomc | 8 | binary().
-type test_record() :: #recorda{}.
-type test_complex() :: {test_union(), test_record()}.
%-type test_ints() :: list(integer()).

%%====================================================================
%% API functions
%%====================================================================
t() ->
	case 12 of
		X when istype(X, test_specific()) -> X;
		X when istype(X, test_int()) ->	X;
		X when istype(X, test_range()) -> X;
		X when istype(X, test_union()) -> X;
		X when istype(X, test_record()) -> X;
		X when istype(X, test_complex()) -> X;
		_ -> ok
	end.

%%====================================================================
%% Internal functions
%%====================================================================
