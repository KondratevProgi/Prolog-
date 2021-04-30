
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

%Zadanie 2

kol_strok_noprobel([],Kol,Kol):- !.
kol_strok_noprobel([H|T],KKol,Kol):- ((kol_probel(H,0,K),K=0)->KKol1 is KKol+1;
                 KKol1 is KKol),kol_strok_noprobel(T,KKol1,Kol).

kol_probel([],Kol,Kol):- !.
kol_probel([H|T],KKol,Kol):- (H=32->KKol1 is KKol+1;KKol1 is KKol),
           kol_probel(T,KKol1,Kol).

n1z2:- beret,read_spisstrok(Spis),kol_strok_noprobel(Spis,0,Kol),
       seen,write("Kol strok no probel: "), write(Kol).

%Zadanie 3

ch_spisok([],Spis,Spis):- !.
ch_spisok([H|T],SSpis,Spis):-append(SSpis,H,SSpis1),ch_spisok(T,SSpis1,Spis).
ch_spisok(SpisStr,Spis):- ch_spisok(SpisStr,[],Spis).

opred_stroka([],_,Kol,Kol):- !.
opred_stroka([H|T],Opr,KKol,Kol):- (H=Opr->KKol1 is KKol+1;KKol1 is KKol),
             opred_stroka(T,Opr,KKol1,Kol).
opred_stroka(Spis,Opr,Kol):- opred_stroka(Spis,Opr,0,Kol).
opred_stroka(Spis,Kol):- opred_stroka(Spis,65,Kol).

a_bolshe_stroka([], _,Spis,Spis):- !.
a_bolshe_stroka([H|T],Kol,SSpis,Spis):- opred_stroka(H,KKol),(KKol>Kol->
                append(SSpis,[H],SSpis1);SSpis1=SSpis),
                a_bolshe_stroka(T,Kol,SSpis1,Spis).
a_bolshe_stroka(SpisStr,Kol,Spis):- a_bolshe_stroka(SpisStr,Kol,[],Spis).

write_spisstrok([]):- !.
write_spisstrok([H|T]):- write_stroka(H),nl,write_spisstrok(T).

write_stroka([]):- !.
write_stroka([H|T]):- put(H),write_stroka(T).

n1z3:- beret,read_spisstrok(Str),ch_spisok(Str,Spis),opred_stroka(Spis,Opr),
       kol_elem(Str,KolStr),(KolStr\=0->Sred is Opr/KolStr;fail),
       a_bolshe_stroka(Str,Sred,Spis1),write_spisstrok(Spis1),seen.

