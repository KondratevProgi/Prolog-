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
