% Special Pythagorean triplet
% Problem 9
% A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
%
% a2 + b2 = c2
% For example, 32 + 42 = 9 + 16 = 25 = 52.
%
% There exists exactly one Pythagorean triplet for which a + b + c = 1000.
% Find the product abc.
-module(pe00009).
-export([run/0]).

run() ->
	[ A*B*C || C <- lists:seq(1,999), B <- lists:seq(1,C), A <- lists:seq(1,B), A + B + C =:= 1000, A*A + B*B =:= C*C ].
