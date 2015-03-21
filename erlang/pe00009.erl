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

% the divisions are bad because they make the constraints useless (needs to be integer)
% so we trunc them. not sure whether there are some possible errors in this.
% NOTE: this method returns two possible (equal) solutions due to rounding.
% using trunc or round seems to make no difference.
% also rounding/truncing only one of the values makes no difference.
% both values must be rounded. else the constraints are not met (empty solution).
a(B) -> trunc(1000*(B-500)/(B-1000)).
c(B) -> trunc((B*B-1000*B+500000)/(1000-B)).
square(N) -> N*N.

run() ->
	[ a(B)*B*c(B) || B <- lists:seq(1,999), a(B) + B + c(B) =:= 1000, square(a(B)) + square(B) =:= square(c(B)), a(B) > 0, c(B) > 0 ].
