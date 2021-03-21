%Nomer #1
max(X,Y,Z):-X>Y,Z is X,!.
max(X,Y,Z):-Y>X,Z is Y,!.

%Nomer #2
max(X,Y,Z,U):-X>Y,X>Z,U is X,!.
max(_,Y,Z,U):-Y>Z,U is Y,!.
max(_,_,Z,U):-U is Z,!.

%Nomer #3
%Recursion up
fact(1,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is X1*N.

%Nomer #4
%Recursion down
fact(1,ConX,ConX):-!.
fact(N,ConX,X):-ConX1 is ConX*N, N1 is N-1,fact(N1,ConX1,X).
factd(N,X):-fact(N,1,X).

%Nomer #5
%Recursion up
fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1,N2 is N-2,fib(N1,X1),fib(N2,X2),X is X1+X2.

%Nomer #6
%Recursion down
fib(1,_,ConX1,ConX1):-!.
fib(2,_,ConX1,ConX1):-!.
fib(N,ConX1,ConX2,X):-ConX3 is ConX1+ConX2, N1 is N-1,fib(N1,ConX2,ConX3,X).
fibd(N,X):-fib(N,1,1,X).

%Nomer #7
%Recursion up
sumaChisla(0,0):-!.
sumaChisla(N,Sum):- Mod is N mod 10, N1 is N div 10,sumaChisla(N1,Sum1),Sum is Sum1 + Mod.
