% Largest palindrome product
% Problem 4
% A palindromic number reads the same both ways. The largest palindrome
% made from the product of two 2-digit numbers is 9009 = 91 × 99.
% 
% Find the largest palindrome made from the product of two 3-digit numbers.
-module(pe00004).

-export([run/0]).

palindromic(N) ->
	integer_to_list(N) =:= lists:reverse(integer_to_list(N)).

% generate list of all 3-digit multiplications (yeah, bruteforce)
product(99,99,L) -> L;
product(99,Q,L) -> product(999,Q-1,L);
product(P,Q,L) ->
	product(P-1,Q,[P*Q|L]).

run() ->
	lists:max([ X || X <- product(999,999,[]), palindromic(X) ]).
