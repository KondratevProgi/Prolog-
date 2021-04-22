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

%Nomer 4
last_3elem(Str,Str):- count_elem(Str,3),!.
last_3elem([_|T],Str1):- last_3elem(T,Str1).

elem1_kol(_,0,Str,Str) :- !.
elem1_kol(Elem,N,SStr,Str):- N1 is N-1,append(SStr,[Elem],SStr1),
          elem1_kol(Elem,N1,SStr1,Str).
elem1_kol(Elem,N,Str):- elem1_kol(Elem,N,[],Str).

nomer4:- write("Vvedite stroky: "),read_stroka_neopr(S),count_elem(S,Kol),
        (Kol>5->([H1|[H2|[H3|T]]]=S,last_3elem(T,T3),
        append([H1,H2,H3],T3,NStr));([H1|_]=S,
        elem1_kol(H1,Kol,NStr))),write("Nova stroka: "),write_stroka(NStr).

%Nomer 5
nomer_elem([H],Elem,N1,N):- ((H=Elem)->N is N1+1; write("Nety")),!.
nomer_elem([H|T],Elem,N1,N):- N11 is N1+1,((Elem=H)->N is N11;nomer_elem(T,Elem,N11,N)).
nomer_elem([H|T],Elem,N):-nomer_elem([H|T],Elem,0,N).

elem_nomer_str([],_,_,_):- write("Nety"),!.
elem_nomer_str([_],N1,N,_):-N11 is N1+1,N11<N,write("Nety"),!.
elem_nomer_str([H|T],N1,N,Elem):- N11 is N1+1,((N11 is N)->Elem is H;elem_nomer_str(T,N11,N,Elem)).
elem_nomer_str([H|T],N,Elem):- elem_nomer_str([H|T],0,N,Elem).

sovpad_elem([],_,_,_,Str,Str):- !.
sovpad_elem([H|T],Elem,N1,Kol,Str1,NStr):-N11 is N1+1,
           (Elem=H->append(Str1,[N11],Str11);append(Str1,[],Str11)),
            sovpad_elem(T,Elem,N11,Kol,Str11,NStr).
sovpad_elem(Str,Elem,NStr):- count_elem(Str,Kol),sovpad_elem(Str,Elem,0,Kol,[],NStr).

nomer5:- write("Vvedite stroky: "),read_stroka_neopr(S),count_elem(S,Kol),
         elem_nomer_str(S,Kol,Elem),sovpad_elem(S,Elem,N),
         write(Kol),write(" position:  "),write_stroka([Elem]),nl,
         write("Nomera elem: "),write(N).

%Nomer 6
krat3(_,N,Kol,Str,Str):- N>Kol,!.
krat3(Str,N,Kol,SStr,NStr):-N1 is N+3,elem_nomer_str(Str,N,Elem),
             append(SStr,[Elem],SStr1),krat3(Str,N1,Kol,SStr1,NStr).
krat3(Str,NStr):-count_elem(Str,Kol),krat3(Str,3,Kol,[],NStr).

nomer6:- write("Vvedite stroky: "),read_stroka_neopr(S),krat3(S,Mod3),
         write("Chisla krat 3: "),write_stroka(Mod3).

%Nomer 7
plus_minus([],Kol,Kol):- !.
plus_minus([H|T],KKol,Kol):-((H=43|H=45)->KKol1 is KKol+1;KKol1 is KKol),plus_minus(T,KKol1,Kol).
plus_minus(Str,Kol):- plus_minus(Str,0,Kol).

kol_posle0([_],Kol,Kol):- !.
kol_posle0([_|[H2|T]],KKol,Kol):-(H2=48->KKol1 is KKol+1; KKol1 is KKol),
           kol_posle0([H2|T],KKol1,Kol).
kol_posle0(Str,Kol):- kol_posle0(Str,0,Kol).

nomer7:- write("Vvedite stroky: "),read_stroka_neopr(S),plus_minus(S,Kol),
         write("Kol plus minus: "),write(Kol),nl,kol_posle0(S, Kol0),
         write("Kol posle 0: "),write(Kol0).

%Nomer 8
in_ls([H|_],H):- !.
in_ls([_|T],Elem):- in_ls(T,Elem).

nomer8:- write("Vvedite stroky: "),read_stroka_neopr(S),
        (not((in_ls(S,119),in_ls(S,120)))->write("nety");
        (nomer_elem(S,119,NX),nomer_elem(S,120,NW),
        (NX<NW ->write("pervak X");write("pervak W")))).

%Nomer 9
write_stroki(_,0):- !.
write_stroki(Str,N):- N1 is N-1,write_stroka(Str),write(" "),write_stroki(Str,N1).

nomer9:- write("Vvedite stroky 1: "),read_stroka_neopr(S1),
         write("Vvedite stroky 2: "),read_stroka_neopr(S2),
         count_elem(S1,Kol1),count_elem(S2,Kol2),
        (Kol1>Kol2->(Kol12 is Kol1-Kol2,write_stroki(S1,Kol12));
        (Kol2>Kol1->(Kol12 is Kol2-Kol1,write_stroki(S2,Kol12));
         write("Odinakovi"))).

%Nomer 10
abc_na_www([H1,H2],SStr,Str):- append(SStr,[H1,H2],Str),!.
abc_na_www([H1],SStr,Str):- append(SStr,[H1],Str),!.
abc_na_www([],Str,Str):- !.
abc_na_www([H1|[H2|[H3|T]]],SStr,Str):-((H1=97,H2=98,H3=99)->
          (append(SStr,[119,119,119],SStr1),abc_na_www(T,SStr1,Str));
          (append(SStr,[H1],SStr1),abc_na_www([H2|[H3|T]],SStr1,Str))).
abc_na_www(Str,NStr):- abc_na_www(Str,[],NStr).

nomer10:- write("Vvedite stroky: "),read_stroka_neopr(S),[H1|[H2|[H3|_]]]=S,
        ((H1=97,H2=98,H3=99)->abc_na_www(S,NS);append(S,[122,122,122],NS)),
          write("Novi stroka: "),write_stroka(NS).

%Nomer 11
elem0_dlina(_,N,N,Str,Str):- !.
elem0_dlina(Elem,NN,N,SStr,Str):-NN1 is NN+1,append(SStr,[Elem],SStr1),
            elem0_dlina(Elem,NN1,N,SStr1,Str).

spisok_doN(_,N,N,Str,Str):- !.
spisok_doN([H|T],NN,N,SStr,NStr):- append(SStr,[H],SStr1),NN1 is  NN+1,
           spisok_doN(T,NN1,N,SStr1,NStr).
spisok_doN(Str,N,NStr):- spisok_doN(Str,0,N,[],NStr).

nomer11:- write("Vvedite stroky: "),read_stroka_neopr(S),count_elem(S,Kol),
         (Kol>10->spisok_doN(S,6,NS);elem0_dlina(111,Kol, 12, S, NS)),
          write("Novi stroka: "),write_stroka(NS).
