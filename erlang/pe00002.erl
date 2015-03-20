% Even Fibonacci numbers
% Problem 2
% Each new term in the Fibonacci sequence is generated
% by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
% 
% 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
% 
% By considering the terms in the Fibonacci sequence whose
% values do not exceed four million, find the sum of the even-valued terms.
-module(pe00002).

-export([run/0]).

fib([A,B|T]) ->
	if A+B>4000000 ->
		[A,B|T];
	   A+B<4000000 ->
		fib([A+B,A,B|T])
	end.
	
% generate fibonacci
% closure to filter even numbers
% summarize
run() ->
	lists:sum([ X || X <- fib([1,1,0]), X band 1 == 0 ]).
