
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

%Nomer 4
kol_spis([],_,Kol,Kol):- !.
kol_spis([H|T],Elem,KKol,Kol):- (H=Elem->KKol1 is KKol+1;KKol1 is KKol),
         kol_spis(T,Elem,KKol1,Kol).
kol_spis(Spis,Elem,Kol):- kol_spis(Spis,Elem,0,Kol).

povtor2(_,[],_):- !,fail.
povtor2(Spis,[H|T],Elem):- kol_spis(Spis,H,Kol),(Kol=2->(Elem=H,true);
        povtor2(Spis,T,Elem)).

slov4(_,5,Slov):- unic_spis(Slov,Unic),povtor2(Slov,Unic,Elem),
      rovn(Slov,Elem,SlovNoElem),unic_spis(SlovNoElem,SlovNoElem),
      write_stroka(Slov),nl,!,fail.
slov4(_,5,_):- !,fail.
slov4(Spis,Raz,SSlov):- spisok(Spis,Elem),append(SSlov,[Elem],SSlov1),
      Raz1 is Raz+1,slov4(Spis,Raz1,SSlov1).
slov4(Spis):- slov4(Spis,0,[]).

nomer4:- read_stroka(A,_),slov4(A).

%Nomer 5
slov5(_,6,Slov):- unic_spis(Slov,Unic),povtor2(Slov,Unic,Elem),
      rovn(Slov,Elem,SlovNoElem),unic_spis(SlovNoElem,UnicElem),
      povtor2(SlovNoElem,UnicElem,Elem1),rovn(SlovNoElem,Elem1,SlovNoElem1),
      unic_spis(SlovNoElem1,SlovNoElem1),write_stroka(Slov),nl,!,fail.
slov5(_,6,_):- !,fail.
slov5(Spis,Raz,Slov):- spisok(Spis,Elem),append(Slov,[Elem],Slov1),
      Raz1 is Raz+1,slov5(Spis,Raz1,Slov1).
slov5(Spis):- slov5(Spis,0,[]).

nomer5:- read_stroka(A,_),slov5(A).

%Nomer 6
povtor2_2(_,[],_):- !,fail.
povtor2_2(Spis,[H|T],Elem):- kol_spis(Spis,H,Kol),(Kol=3->
         (Elem=H,true);povtor2_2(Spis,T,Elem)).

slov6(_,7,Slov):- unic_spis(Slov,Unic),povtor2(Slov,Unic,Elem),
      rovn(Slov,Elem,SlovNoElem),unic_spis(SlovNoElem,UnicNoElem),
      povtor2_2(SlovNoElem,UnicNoElem,Elem1),rovn(SlovNoElem,Elem1,SlovNoElem1),
      unic_spis(SlovNoElem1,SlovNoElem1),write_stroka(Slov),nl,!,fail.
slov6(_,7,_):- !,fail.
slov6(Spis,Raz,Slov):- spisok(Spis,Elem),append(Slov,[Elem],Slov1),
      Raz1 is Raz+1,slov6(Spis,Raz1,Slov1).
slov6(Spis):- slov6(Spis,0,[]).

nomer6:- read_stroka(A,_),slov6(A).

%Nomer 7
slov7(_,9,Slov):- unic_spis(Slov,Unic),povtor2(Slov,Unic,Elem),
      rovn(Slov,Elem,SlovNoElem),unic_spis(SlovNoElem,UnicElem),
      povtor2(SlovNoElem,UnicElem,Elem1),rovn(SlovNoElem,Elem1,SlovNoElem1),
      unic_spis(SlovNoElem1,UnicElem1),povtor2_2(SlovNoElem1,UnicElem1,Elem2),
      rovn(SlovNoElem1,Elem2,SlovNoElem2),unic_spis(SlovNoElem2,SlovNoElem2),
      write_stroka(Slov),nl,!,fail.
slov7(_,9,_):- !,fail.
slov7(Spis,Raz,Slov):-spisok(Spis,Elem),append(Slov,[Elem],Slov1),
      Raz1 is Raz+1,slov7(Spis,Raz1,Slov1).
slov7(Spis):- slov7(Spis,0,[]).

nomer7:- read_stroka(A,_),slov7(A).

%Nomer 8
slov8(_,Kol,4,Slov):- Kol>2,write_stroka(Slov),nl,!,fail.
slov8(_,_,4,_):- !,fail.
slov8(Spis,KKol,Raz,Slov):- spisok(Spis,Elem),(Elem=97->KKol1 is KKol+1;
      KKol1 is KKol),append(Slov,[Elem],Slov1),Raz1 is Raz+1,
      slov8(Spis,KKol1,Raz1,Slov1).
slov8(Spis):- slov8(Spis,0,0,[]).

nomer8:- read_stroka(A,_),slov8(A).
