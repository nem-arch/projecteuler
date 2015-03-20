% Smallest multiple
% Problem 5
% 2520 is the smallest number that can be divided by each of the numbers
% from 1 to 10 without any remainder.
% 
% What is the smallest positive number that is evenly divisible (no remainder)
% by all of the numbers from 1 to 20?
-module(pe00005).
-export([run/0]).

% check if N is divisible by D = [1..D_initial]
candidate(_,1) -> true;
candidate(N,D) ->
	if
		N rem D =:= 0 -> candidate(N,D-1);
		true -> false
	end.

search(N,Found) ->
	if
		Found -> N;
		true -> search(N+1,candidate(N+1,20))
	end.

run() ->
	search(20,false).
