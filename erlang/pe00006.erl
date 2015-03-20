% Sum square difference
% Problem 6
% The sum of the squares of the first ten natural numbers is,
% 
% 12 + 22 + ... + 102 = 385
% The square of the sum of the first ten natural numbers is,
% 
% (1 + 2 + ... + 10)2 = 552 = 3025
% Hence the difference between the sum of the squares of the first
% ten natural numbers and the square of the sum is 3025 − 385 = 2640.
% 
% Find the difference between the sum of the squares of the first
% one hundred natural numbers and the square of the sum.
-module(pe00006).
-export([run/0]).

square(N) -> N*N.

sqsum(0,S) -> S;
sqsum(N,S) ->
	sqsum(N-1,S+square(N)).

run() ->
	square(50*101)-sqsum(100,0).
