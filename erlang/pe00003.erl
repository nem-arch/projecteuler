%Largest prime factor
%Problem 3
%The prime factors of 13195 are 5, 7, 13 and 29.
%
%What is the largest prime factor of the number 600851475143 ?
-module(pe00003).

-export([run/0]).

% if guard is catching we found a prime (because we never got a remainder)
primecheck(_,M) when M < 2 -> true;
% if we get remainder, return false
% else (no remainder) recurse to next (lower) divisor M-1
% NOTE: initially divisor M only needs to be sqrt(X)
% becasue if we find a non-prime factor, then X can be written as X = P*Q
% with P or Q < sqrt(X)
primecheck(X,M) ->
	if X rem M =:= 0 -> false;
	   true -> primecheck(X,M-1)
	end.

% generate primenumbers up to M
primelist(M) ->
	[ X || X <- lists:seq(1,M), primecheck(X,trunc(math:sqrt(X))) ].

% generate list with all factors that divide without remainder
factorize(N,FactorsList) ->
	[ X || X <- FactorsList, N rem X =:= 0 ].

% multiply all elements of the primefactorlist
% to validate that all factors have been found
factorscheck([]) -> 1;
factorscheck([H|T]) ->
	H * check(T).

run() ->
	factorscheck(factorize(600851475143, primelist(10000))).
