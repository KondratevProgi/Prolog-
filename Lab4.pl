%Nomer 1
append_list([],X,X).
append_list([H|T1],X,[H|T2]):-append_list(T1,X,T2).

read_list(0,[]):-!.
read_list(N,X):-read(X1),N1 is N-1,read_list(N1,X2),append_list([X1],X2,X).

write_list([X]):-write(X).
write_list([X|Y]):-write(X),write_list(Y).

%Nomer 2
sum_list_down(Y,Sum):-sum_list_down(Y,0,Sum).
sum_list_down([],Sum,Sum):-!.
sum_list_down([H|T],Suma,Sum):-Suma1 is Suma+H,sum_list_down(T,Suma1,Sum).
sumat_list_down(N,Sum):-read_list(N,X),sum_list_down(X,Sum).


