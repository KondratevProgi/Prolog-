max(X,Y,Z):-X>Y,Z is X,!.
max(X,Y,Z):-Y>X,Z is Y,!.
max(X,Y,Z,U):-X>Y,X>Z,U is X,!.
max(_,Y,Z,U):-Y>Z,U is Y,!.
max(_,_,Z,U):-U is Z,!.
