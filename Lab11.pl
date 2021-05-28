:- dynamic  party/2.
:- dynamic faction/2.
:- dynamic rasa/2.
:- dynamic class/2.
:- dynamic pol/2.

read_stroka(A):- get0(X),r_stroka(X,A,[]).
r_stroka(10,A,A):- !.
r_stroka(X,A,B):- append(B,[X],B1),get0(X1),r_stroka(X1,A,B1).

party22(X,Y):- repeat,(party(X,Y)->(nl,write(X),nl,write(Y),write("."),
               retract(party(X,Y)));X=nil,Y=nil).

faction22(X,Y):-repeat,(faction(X,Y)->(nl,write(X),nl,write(Y),write("."),
                retract(faction(X,Y)));X=nil,Y=nil).

rasa22(X,Y):- repeat,(rasa(X,Y)->(nl,write(X),nl,write(Y),write("."),
              retract(rasa(X, Y)));X=nil,Y=nil).

class22(X,Y):- repeat,(class(X,Y)->(nl,write(X),nl,write(Y),write("."),
               retract(class(X,Y)));X=nil,Y=nil).

pol22(X,Y):- repeat,(pol(X,Y)->(nl,write(X),nl,write(Y),write("."),
             retract(pol(X,Y)));X=nil,Y=nil).

otdaet:-
  tell('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/1.txt'),party22(X1,_),X1=nil,told,
  tell('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/2.txt'),faction22(X2,_),X2=nil,told,
  tell('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/3.txt'),rasa22(X3,_),X3=nil,told,
  tell('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/4.txt'),class22(X4,_),X4=nil,told,
  tell('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/5.txt'),pol22(X5,_),X5=nil,told.

beret:-
  see('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/1.txt'),get0(S1),read_chek(S1,1),seen,
  see('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/2.txt'),get0(S2),read_chek(S2,2),seen,
  see('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/3.txt'),get0(S3),read_chek(S3,3),seen,
  see('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/4.txt'),get0(S4),read_chek(S4,4),seen,
  see('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/5.txt'),get0(S5),read_chek(S5,5),seen.

read_chek(-1,_):- !.
read_chek(_,Flag):-read_stroka(Lang),name(X,Lang),read(Y),(
            Flag=1->asserta(party(X,Y));(
            Flag=2->asserta(faction(X,Y));(
            Flag=3->asserta(rasa(X,Y));(
            Flag=4->asserta(class(X,Y));(
            Flag=5->asserta(pol(X,Y))))))),get0(Sym),read_chek(Sym,Flag).

question1(X1):-write("Vash personag za dobro ili zlo?"),nl,
                  write("0.Zlo"),nl,
                  write("1.Dobro"),nl,read(X1).

question2(X2):-write("K kakoi fraction otnositsa vash personag?"),nl,
                  write("0.Neitral"),nl,
                  write("1.Alience"),nl,
                  write("2.Horde"),nl,read(X2).

question3(X3):-write("K Kakoi rase prinadlegit vash personag?"),nl,
                  write("0.Raznoe") ,nl,write("1.Human"),nl,
                  write("2.Dforf")  ,nl,write("3.Nochnoi elf"),nl,
                  write("4.Gnom")   ,nl,write("5.Drenei"),nl,
                  write("6.Vorgen") ,nl,write("7.Ork"),nl,
                  write("8.Negit")  ,nl,write("9.Tayren"),nl,
                  write("10.Troll") ,nl,write("11.Elf krovi"),nl,
                  write("12.Goblin"),nl,read(X3).

question4(X4):-write("Kakoi class y vashego personaga?"),nl,
                  write("0.Neizvestno")  ,nl,write("1.Voin"),nl,
                  write("2.Paladin")     ,nl,write("3.Oxotnik"),nl,
                  write("4.Razboinik")   ,nl,write("5.Priest"),nl,
                  write("6.Shaman")      ,nl,write("7.Mag"),nl,
                  write("8.Chernoknig")  ,nl,write("9.Dryid"),nl,
                  write("10.RicarSmerti"),nl,write("11.DemonXant"),nl,read(X4).

question5(X5):-write("Kakoi pol vashego personaga?"),nl,
                  write("0.Woman"),nl,
                  write("1.Man"),nl,read(X5).

addPers(Pers,X1,X2,X3,X4,X5):-
  append('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/1.txt'),
  nl,write(Pers),nl,write(X1),write("."),told,

  append('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/2.txt'),
  nl,write(Pers),nl,write(X2),write("."),told,

  append('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/3.txt'),
  nl,write(Pers),nl,write(X3),write("."),told,

  append('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/4.txt'),
  nl,write(Pers),nl,write(X4),write("."),told,

  append('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/5.txt'),
  nl,write(Pers),nl,write(X5),write("."),told.

pr:- beret,question1(X1),question2(X2),question3(X3),question4(X4),question5(X5),
    (party(X,X1),faction(X,X2),rasa(X,X3),class(X,X4),pol(X,X5),write(X);
    (write("Pers -> "),read(Pers),asserta(party(Pers,X1)),
     asserta(faction(Pers,X2)),asserta(rasa(Pers,X3)),asserta(class(Pers,X4)),
     asserta(pol(Pers,X5)),otdaet,nl,write("Pers nasholsa!"))).
