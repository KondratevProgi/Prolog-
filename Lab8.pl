
%Nomer 1
%Zadanie1

beret:- see('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/dan.txt').

read_spisstrok(Spis):- read_stroka(A,_,Toch),read_spisstrok([A],Spis,Toch).
read_spisstrok(Spis,Spis,1):- !.
read_spisstrok(Spis1,Spis,0):- read_stroka(A,_,Toch),append(Spis1,[A],B),
               read_spisstrok(B,Spis,Toch).

read_stroka(A,N,Toch):- get0(X),stroka(X,A,[],N,0,Toch).
stroka(-1,A,A,N,N,1):- !.
stroka(10,A,A,N,N,0):- !.
stroka(X,A,B,N,Kol,Toch):- Kol1 is Kol+1,append(B,[X],B1),get0(X1),
       stroka(X1,A,B1,N,Kol1,Toch).

max_stroka([],Max,Max):- !.
max_stroka([H|T],MMax,Max):-kol_elem(H,Kol),(Kol>MMax->MMax1 is Kol;
           MMax1 is MMax),max_stroka(T,MMax1,Max).
max_stroka(Spis,Max):- max_stroka(Spis,0,Max).

kol_elem([],Kol,Kol):- !.
kol_elem([_|T],KKol,Kol):-KKol1 is KKol+1,kol_elem(T,KKol1,Kol).
kol_elem(Spis,Kol):- kol_elem(Spis,0,Kol).

n1z1:- beret,read_spisstrok(Spis),max_stroka(Spis,Max),
        seen,write("Max stroka: "),write(Max).
