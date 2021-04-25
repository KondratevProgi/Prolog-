
%Nomer 1
%Zadanie 1
tell0 :- tell('C:/Users/Legto/OneDrive/������� ����/Prolog/Prolog-/out.txt').

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
sochett([],0, _):- !.
sochett([H|T],K,[H|T1]):- K1 is K-1,sochett(T,K1,T1).
sochett(T,K,[_|T1]):- sochett(T,K,T1).

sochet:- read_stroka(A,_),read(K),sochett(B,K,A),write_stroka(B),nl,fail.

%Zadanie 6
sochet_p([],0,_):- !.
sochet_p([H|T],K,[H|T1]):-K1 is K-1,sochet_p(T,K1,[H|T1]).
sochet_p(T,K,[_|T1]):- sochet_p(T,K,T1).

sochet_povtor:- read_stroka(A,_),read(K),sochet_p(B, K, A),
                write_stroka(B),nl,fail.


%Nomer 2
slovo5(_,Kol,5,Slov):- Kol= 2,write_stroka(Slov),nl,!,fail.
slovo5(_,_,5,_):- !,fail.
slovo5(Spis,KKol,RRazm,SSlov):-spisok(Spis,Elem),
        (Elem=97->KKol1 is KKol+1;KKol1 is KKol),append(SSlov,[Elem],SSlov1),
         RRazm1 is RRazm+1,slovo5(Spis,KKol1,RRazm1,SSlov1).
slovo5(Spis):- slovo5(Spis,0,0,[]).

nomer2:- read_stroka(A,_),slovo5(A).

%Nomer 3

nomer_elem([H],Elem,NN,N):- ((H=Elem)->N is NN+1), !.
nomer_elem([H|T],Elem,NN,N):- NN1 is NN+1,((Elem=H)->N is NN1;
          nomer_elem(T,Elem,NN1,N)).
nomer_elem([H|T],Elem,N):- nomer_elem([H|T],Elem,0,N).

spis3([H|_],H):- !.
spis3([_|T],Elem):- spis3(T,Elem).

r_elem([_|T],Spis,N,N,NSpis):- append(Spis,T,NSpis),!.
r_elem([H|T],Spis,NN,N,NSpis):- append(Spis,[H],Spis1),NN1 is NN+1,
      r_elem(T,Spis1,NN1,N,NSpis).
r_elem(SSpis,N,NSpis):- r_elem(SSpis,[],1,N,NSpis).

rovn(Spis,Elem,Spis):- not(spis3(Spis,Elem)),!.
rovn(Spis,Elem,NSpis):- nomer_elem(Spis,Elem,N),r_elem(Spis,N,Spis1),
                        rovn(Spis1,Elem,NSpis).

unic_spis([],[]):- !.
unic_spis([H|T],Spis):- rovn(T,H,RSpis),unic_spis(RSpis,Spis1),
                        append([H],Spis1,Spis).

slov3(_,Kol,5,Slov):- Kol=2,rovn(Slov,97,SlovNo),
      unic_spis(SlovNo,SlovNo),write_stroka(Slov),nl,!,fail.
slov3(_,_,5,_):- !,fail.
slov3(Spis,KKol,Raz,SSlov):- spisok(Spis,Elem),(Elem=97->KKol1 is KKol+1;
      KKol1 is KKol),append(SSlov,[Elem],SSlov1),Raz1 is Raz+1,
      slov3(Spis,KKol1,Raz1,SSlov1).
slov3(Spis):- slov3(Spis,0,0,[]).

nomer3:- read_stroka(A,_),slov3(A).
