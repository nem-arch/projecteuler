-module(prime).
-export([primelist/1, isprime/2]).

% if guard is catching we found a prime (because we always got a remainder)
isprime(_,M) when M < 2 -> true;
% if we dont get remainder, return false
% else (remainder) recurse to next (lower) divisor M-1
% NOTE: initially divisor M only needs to be sqrt(X)
% becasue if we find a non-prime factor, then X can be written as X = P*Q
% with P or Q < sqrt(X)
isprime(X,M) ->
	if X rem M =:= 0 -> false;
	   true -> isprime(X,M-1)
	end.

% generate primenumbers up to M
primelist(M) ->
	[ X || X <- lists:seq(2,M), isprime(X,trunc(math:sqrt(X))) ].	
