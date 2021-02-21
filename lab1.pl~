
man(adam).
man(vova).
man(andrey).
man(ivan).
man(seva).
man(leon).

woman(eve).
woman(nastya).
woman(anna).
woman(alice).
woman(ale).
woman(katya).
woman(sonya).

parent(adam,vova).
parent(adam,anna).
parent(eve,vova).
parent(eve,anna).

parent(vova,ivan).
parent(vova,alice).
parent(nastya,ivan).
parent(nastya,alice).

parent(andrey,seva).
parent(andrey,leon).
parent(andrey,ale).
parent(andrey,katya).
parent(andrey,sonya).
parent(anna,seva).
parent(anna,leon).
parent(anna,ale).
parent(anna,katya).
parent(anna,sonya).

man:-man(X),write(X),nl,fail.
woman:-woman(Y),write(Y),nl,fail.
children(X):-parent(X,Y),write(Y),nl,fail.
mother(X,Y):-parent(X,Y),woman(X).
mother(X):-parent(Y,X),woman(Y),write(Y),nl,fail.
son(X,Y):-parent(Y,X).
son(X):-parent(X,Y),man(Y),write(Y),nl,fail.
brother(X,Y):-man(X),parent(Z,X),parent(Z,Y),woman(Z).
brothers(X):-brother(Y,X),dif(X,Y),write(Y),nl,fail.
husband(X,Y):-parent(Y,Z),parent(X,Z).
husband(X):-parent(X,Y),parent(Z,Y),man(Z),write(Z),!.
b_s(X,Y):-parent(Z,X),parent(Z,Y),dif(X,Y).
b_s(X):-parent(Z,X),parent(Z,Y),woman(Z),dif(X,Y),write(Y),nl,fail.
grand_pa(X,Y):-parent(Z,Y),parent(X,Z),man(X).
grand_pas(X):-parent(Z,X),parent(Y,Z),man(Y),write(Y),nl,fail.
grand_so(X,Y):-parent(Z,X),parent(Y,Z),man(X),!.
grand_sons(X):-parent(X,Y),parent(Y,Z),man(Z),write(Z),nl,fail.
grand_pa_and_son(X,Y):-grand_pa(X,Y),man(Y);grand_pa(Y,X),man(X),!.
grand_pa_and_da(X,Y):-parent(X,Z),parent(Z,Y),woman(Y);parent(Y,Z),parent(Z,X),woman(X).
