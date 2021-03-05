max(X,Y,Z):-X>Y,Z is X,!.
max(X,Y,Z):-Y>X,Z is Y,!.
max(X,Y,Z,U):-X>Y,X>Z,U is X,!.
max(_,Y,Z,U):-Y>Z,U is Y,!.
max(_,_,Z,U):-U is Z,!.
fact(1,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is X1*N.
