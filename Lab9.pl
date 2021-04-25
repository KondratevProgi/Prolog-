
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
razmesh(A,N,Perem):- spisok(A,Elem),N1 is N-1,razmesh(A,N1,[Elem|Perem]).

write_stroka([]):- !.
write_stroka([H|T]):- put(H),write_stroka(T).

razm_povtor:- read_stroka(A,_),read(K),razmesh(A,K,[]).

%Zadanie 2
spisokt([Elem|T],Elem,T).
spisokt([H|T],Elem,[H|T]):- spisokt(T,Elem,T).

peres([],Perem1):- write_stroka(Perem1),nl,!,fail.
peres(A,Perem):- spisokt(A,Elem,A1),peres(A1,[Elem|Perem]).

perestan:- read_stroka(A,_),peres(A,[]).

%Zadanie 3
razmes(_,0,Perem1):- write_stroka(Perem1),nl,!,fail.
razmes(A,N,Perem):- spisokt(A,Elem,A1),N1 is N-1,razmes(A1,N1,[Elem|Perem]).

razm:- read_stroka(A,_),read(K),razmes(A,K,[]).

%Zadanie 4
podmnog([],[]).
podmnog([H|Pod],[H|Mn]):- podmnog(Pod,Mn).
podmnog(Pod,[_|Mn]):- podmnog(Pod,Mn).

podmn:- read_stroka(A,_),podmnog(B,A),write_stroka(B),nl,fail.

%Zadanie 5
