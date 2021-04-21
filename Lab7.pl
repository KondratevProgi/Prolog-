%Nomer 1
read_stroka_neopr(A):-get0(X), stroka_neopr(X,A,[]).
stroka_neopr(10,A,A):-!.
stroka_neopr(X,A,B) :- append(B,[X],B1), get0(X1),stroka_neopr(X1,A,B1).

write_stroka([]):-!.
write_stroka([H|T]):- put(H),write_stroka(T).

count_elem([],Kol,Kol):- !.
count_elem([_|T],KKol,Kol):- KKol1 is KKol + 1, count_elem(T,KKol1,Kol).
count_elem(Spis,Kol):- count_elem(Spis,0,Kol).

nomer1 :- write("Vvedite stroky:"),read_stroka_neopr(S),
          write_stroka(S),write(","),write_stroka(S), write(","),
          write_stroka(S),nl,write("Kolvo elem: "),
          count_elem(S, Kol),write(Kol).

%Nomer 2
stroka_no1probel([],[]):- !.
stroka_no1probel([H|T],[H|T]):- H\=32,!.
stroka_no1probel([_|T],Str):- stroka_no1probel(T,Str).

do1probel([],Slov,Slov):- !.
do1probel([H|_],Slov,Slov):- H=32,!.
do1probel([H|T],KSlov,NSlov):-append(KSlov,[H],KSlov1),do1probel(T,KSlov1,NSlov).
do1probel(Str,Slov):- do1probel(Str,[],Slov).

kol_slovnopro([],Kol,Kol):- !.
kol_slovnopro(Str,KKol,Kol):-stroka_no1probel(Str,Probel),(Probel\=[]->
           (do1probel(Probel,Slov),append(Slov,Slov1,Probel),
           KKol1 is KKol+1);(Slov1=[],KKol1 is KKol)),
           count_words(Slov1,KKol1,Kol).
kol_slovnopro(Str,Kol):- kol_slovnopro(Str,0,Kol).

nomer2 :- write("Vvedite stroky: "),read_stroka_neopr(S),write("Kolvo slov: "),
          kol_slovnopro(S,Kol),write(Kol).

%Nomer 3
slovo_noprobel(Str,Slov):-stroka_no1probel(Str,Str1sl),do1probel(Str1sl,Slov).

spisok_slov(Str,SSl,SSl):-stroka_no1probel(Str,Str1sl),Str1sl=[],!.
spisok_slov(Str1,SSl1,SSl) :-stroka_no1probel(Str1,Str1sl),do1probel(Str1sl,Slov),
             append(Slov,StrSlov,Str1sl),append(SSl1,[Slov],SSl11),
             spisok_slov(StrSlov,SSl11,SSl).
spisok_slov(Str1,SSl):-spisok_slov(Str1,[],SSl).

spis([],[]):- !.
spis([H|T1],[H|T2]):-spis(T1,T2).

kol_slovpovtor([],_,Kol,Kol):- !.
kol_slovpovtor([H|T],Elem,KKol,Kol):- (H=Elem->KKol1 is KKol + 1;
             KKol1 is KKol),kol_slovpovtor(T,Elem,KKol1,Kol).
kol_slovpovtor(Str,Elem,Kol):-kol_slovpovtor(Str,Elem,0,Kol).

regular_slov([],_,Slov,Slov):- !.
regular_slov([H|T],Kol,SSlov,Slov):-kol_slovpovtor([H|T],H,Kol1),
            (Kol1>Kol->(SSlov1=H,Kol2 = Kol1); (SSlov1 = SSlov,Kol2 =Kol)),
            regular_slov(T,Kol2,SSlov1,Slov).
regular_slov(Str,Slov):-regular_slov(Str,0,[],Slov).

nomer3:- write("Vvedite stroky: "),read_stroka_neopr(S),spisok_slov(S,SSl),
        regular_slov(SSl,Slov),write("Regular slova: "),write_stroka(Slov).
