% Summation of primes
% Problem 10
% The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
% 
% Find the sum of all the primes below two million.
-module(pe00010).
-import(prime, [primelist/1]).
-export([run/0]).

run() ->
	lists:sum(primelist(2000000)).
