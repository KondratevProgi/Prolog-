sub_posl([], _) :- !.
sub_posl(_, []) :- fail, !.
sub_posl([H|Sub_list], [H|List]) :- sub_posl(Sub_list, List), !.
sub_posl(Sub_list, [_|List]) :- sub_posl(Sub_list, List).

sub_set([], []).
sub_set([H|Sub_set], [H|Set]) :- sub_set(Sub_set, Set).
sub_set(Sub_set, [H|Set]) :- sub_set(Sub_set, Set).

in_list([El|_], El).
in_list([_|T], El) :- in_list(T, El).


sprava_next(A, B, [C]):-fail.
sprava_next(A, B, [A|[B|Tail]]).
sprava_next(A, B, [_|List]) :- sprava_next(A, B, List).

sleva_next(A, B, [C]) :- fail.
sleva_next(A, B, [B|[A|Tail]]).
sleva_next(A, B, [_|List]) :- sleva_next(A, B, List).

next_to(A, B, List) :- sprava_next(A, B, List).
next_to(A, B, List) :- sleva_next(A, B, List).

el_no(List, Num, El) :- el_no(List, Num, 1, El).
el_no([H|_], Num, Num, H) :- !.
el_no([_|Tail], Num, Ind, El) :- Ind1 is Ind + 1, el_no(Tail, Num, Ind1, El).

%Nomer 1
pr_ein :- Houses = [_, _ ,_ ,_ ,_],

		in_list(Houses, [red, english, _, _, _]),
		in_list(Houses, [_, spanish, _, dog, _]),
		in_list(Houses, [green, _, coffee, _, _]),
		in_list(Houses, [_, ukrain, tea, _, _]),
		sprava_next([green, _, _, _, _], [white, _, _, _, _], Houses),
		in_list(Houses, [_, _, _, ulitka, old_gold]),
		in_list(Houses, [yellow, _, _, _, kool]),
		el_no(Houses, 3, [_, _, milk, _, _]),
		el_no(Houses, 1, [_, norway, _, _, _]),
		next_to([_, _, _, _, chester], [_, _, _, fox, _], Houses),
		next_to([_, _, _, _, kool],[_, _, _, horse, _], Houses),
		in_list(Houses, [_, _, orange, _, lucky]),
		in_list(Houses, [_, japan, _, _, parlament]),
		next_to([_, norway, _, _, _], [blue, _, _, _, _], Houses),


		in_list(Houses, [_, WHO1, water, _, _]),
		in_list(Houses, [_, WHO2, _, zebra, _]),
		write(Houses),
		write(WHO1), nl, write(WHO2).

%Nomer 2
pr_friends:- Friends = [_,_,_],

                in_list(Friends,[belokurov,_]),
                in_list(Friends,[rijov,_]),
                in_list(Friends,[chernov,_]),
                in_list(Friends,[_,white]),
                in_list(Friends,[_,black]),
                in_list(Friends,[_,red]),

                not(in_list(Friends,[belokurov,white])),
                not(in_list(Friends, [chernov, black])),
		not(in_list(Friends, [rijov, red])),

		write(Friends), !.

%Nomer 3
pr_girls:- Girls = [_,_,_],

                in_list(Girls,[_,white,_]),
                in_list(Girls,[_,green,_]),
                in_list(Girls,[_,blue,_]),
                in_list(Girls,[_,_,white]),
                in_list(Girls,[_,_,green]),
                in_list(Girls,[_,_,blue]),
                in_list(Girls,[anya,_,_]),
                in_list(Girls,[natasha,_,_]),
                in_list(Girls,[valya,_,_]),
                in_list(Girls,[natasha,_,green]),

                not(in_list(Girls,[valya,white,white])),

                write(Girls),!.

%Nomer 4
pr_factory:-Factory = [_,_,_],

                in_list(Factory,[slesar,_,netbs,mlad]),
                in_list(Factory,[tokar,_,_,sred]),
                in_list(Factory,[svarschik,_,_,_]),
                in_list(Factory,[_,borisov,yess,_]),
                in_list(Factory,[_,ivanov,_,_]),
                in_list(Factory,[_,semenov,_,star]),

                write(Factory),!.

%Nomer 5
pr_emkost:- Emkost = [_,_,_,_],

                in_list(Emkost,[bottle,_]),
                in_list(Emkost,[kyvshin,_]),
                in_list(Emkost,[stakan,_]),
                in_list(Emkost,[banka,_]),
                in_list(Emkost,[_,moloko]),
                in_list(Emkost,[_,limonad]),
                in_list(Emkost,[_,kvas]),
                in_list(Emkost,[_,voda]),

                not(in_list(Emkost,[bottle,voda])),
                not(in_list(Emkost,[bottle,moloko])),
                sprava_next([kyvshin,_],[_,limonad],Emkost),
                sprava_next([_,limonad],[_,kvas],Emkost),
                not(in_list(Emkost,[banka,limonad])),
                not(in_list(Emkost,[banka,voda])),
                next_to([banka,_],[stakan,_],Emkost),
                next_to([banka,_],[_,moloko],Emkost),

                write(Emkost),!.




