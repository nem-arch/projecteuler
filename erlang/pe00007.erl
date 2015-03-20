% 10001st prime
% Problem 7
% By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
% we can see that the 6th prime is 13.
% 
% What is the 10 001st prime number?
-module(pe00007).
-export([run/0]).

% if guard is catching we found a prime (because we always got a remainder)
primecheck(_,M) when M < 2 -> true;
% if we dont get remainder, return false
% else (remainder) recurse to next (lower) divisor M-1
% NOTE: initially divisor M only needs to be sqrt(X)
% becasue if we find a non-prime factor, then X can be written as X = P*Q
% with P or Q < sqrt(X)
primecheck(X,M) ->
	if X rem M =:= 0 -> false;
	   true -> primecheck(X,M-1)
	end.

% i guess there's a better way to do this
% N: current number checked for prime
% M: number of primes found
% Found: if true, last number was a prime
prime(N, M, Found) ->
	if
		Found, M+1 =:= 10001 -> N-1;
		Found -> prime(N+1, M+1, primecheck(N,trunc(math:sqrt(N))));
		true -> prime(N+1, M, primecheck(N,trunc(math:sqrt(N))))
	end.

run() ->
	prime(4,2,false).
