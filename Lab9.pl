
%Nomer 1
%Zadanie 1
tell0 :- tell('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/out.txt').

spisok([Elem|_],Elem).
spisok([_|T],Elem):- spisok(T,Elem).

read_stroka(A,N):- get0(X),stroka(X,A,[],N,0).
stroka(10,A,A,N,N):- !.
stroka(X,A,B,N,Kol):-Kol1 is Kol+1,append(B,[X],B1),get0(X1),
                     stroka(X1,A,B1,N,Kol1).

razmesh(_,0,Perem1):- write_stroka(Perem1), nl, !, fail.
razmesh(A,N,Perem):- in_list(A,Elem),N1 is N-1,razmesh(A,N1,[Elem|Perem]).

write_stroka([]):- !.
write_stroka([H|T]):- put(H),write_stroka(T).

razm_povtor:- read_stroka(A,_),read(K),razmesh(A,K,[]).

