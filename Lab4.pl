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

%Nomer 3
sum_list_up([],0):-!.
sum_list_up([H|T],Sum):-sum_list_up(T,Sum1),Sum is Sum1+H.

%Nomer 4
list_el_numb(Spis,Elem,N):-list_el_numb(Spis,Elem,0,N).
list_el_numb([H|_],H,N,N):-!.
list_el_numb([_|T],Elem,Num,N):-Num1 is Num+1,list_el_numb(T,Elem,Num1,N).

%Nomer 4.1
proverka:-write("Vedite kolvo elem i sami elem"),nl,read(N),nl,read_list(N,X), nl,write("Vedite chislo i poluch ego nomer"),nl,read(Elem),list_el_numb(X,Elem,N1),write(N1).
proverka:-write("Takogo nety").

%Nomer 5
elem_list:-write("Vedite lokvo elem i sami elem"),nl,read(N),nl,read_list(N,X), nl,write("Vedite nomer elem"),nl,read(N1),list_el_numb(X,Elem,N1),write(Elem).
elem_list:-write("Takogo nety").

%Nomer 6
min_naxod(X,Y,Z):-X<Y,Z is X,!.
min_naxod(_,Y,Z):-Z is Y,!.
min_list_up([H],H):-!.
min_list_up([H|T],Min):-min_list_up(T,MinX),min_naxod(H,MinX,Min).

%Nomer 7
min_list_down([H|T],Min):-min_list_down(T,H,Min).
min_list_down([],Min,Min):-!.
min_list_down([H|T],X,Min):-H<X,min_list_down(T,H,Min),!.
min_list_down([_|T],X,Min):-min_list_down(T,X,Min).

%Nomer 8
min_elem:-write("Vedite snachalo kolvo elem,potom sami elem"),nl,read(N),nl,read_list(N,X),nl, min_list_up(X,Min),write(Min).

%Nomer 9
vozvrat([H|_],H):-!.
vozvrat([_|T],H):-vozvrat(T, H).

%Nomer 10
perevorot(Spis,Obrat):-perevorot(Spis,[],Obrat).
perevorot([],Obrat,Obrat).
perevorot([H|Spis],T,Obrat):-perevorot(Spis,[H|T],Obrat).

%Nomer 11
p([],_):-!.
p([H|T],[H1|T1]):-(H is H1 ->p(T,T1)).

%Nomer 12
del_nomer(0,[_|T], T):-!.
del_nomer(N,[H|T1],[H|T]):-N1 is N-1,del_nomer(N1,T1,T).

%Nomer 13
del_nomer_pov([],_,[]).
del_nomer_pov([H|T],N,Spis):-(H=N->del_nomer_pov(T,N,Spis);Spis=[H|T1],del_nomer_pov(T,N,T1)).

%Nomer 14
povtor1(_,[]):-!.
povtor1([H|T]):-povtor1(H,T),povtor1(T).
povtor1(X,[H|T]):- X\= H,povtor1(X,T).
povtor1([]):-!.

%Nomer 16
kol_elem(Spis,N,Kol):-kol_elem(Spis,N,0,Kol).
kol_elem([],_,Kol,Kol):-!.
kol_elem([H|T],N,Kol,Kol2):-H==N, Kol1 is Kol + 1,kol_elem(T,N,Kol1,Kol2),!.
kol_elem([_|T],N,Kol,Kol2):-kol_elem(T,N,Kol,Kol2),!.

%Nomer 17
dlina_spis(Spis,Kol):-dlina_spis(Spis,Kol,0).
dlina_spis([],Kol,Kol):-!.
dlina_spis([_|T],Kol,S):-Sm is S+1,dlina_spis(T,Kol,Sm).

%Nomer 15
unik_elem([],[]):-!.
unik_elem([H|T],T1):-vozvrat(T,H),unik_elem(T,T1),!.
unik_elem([H|T],[H|T1]):-unik_elem(T,T1),!.

%Nomer 1.19
sdvig_vpravo([H|T],Spis):-append_list([H],X,[H|T]),append_list(X,[H],Spis).
