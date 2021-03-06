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
		write(Houses),nl,
		write(WHO1), nl, write(WHO2),!.

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

%Nomer 6
pr_talant:- Talant = [_,_,_,_],

                in_list(Talant, [voronov, _, concert, writer]),
		in_list(Talant, [pavlov, _, _, artist]),
		in_list(Talant, [levitskiy, _, concert, _]),
		in_list(Talant, [saharov, _, _, writer]),

		in_list(Talant, [_, dancer, _, _]),
		in_list(Talant, [_, artist, _, _]),
		in_list(Talant, [_, singer, concert, _]),
		in_list(Talant, [_, writer, _, artist]),

		not(in_list(Talant, [pavlov, _, writer, _])),
		not(in_list(Talant, [levitskiy, _, singer, _])),

		write(Talant), !.

%Nomer 7
pr_sorev:- Sorev = [_,_,_],

                in_list(Sorev,[maikl,_,basteball]),
                in_list(Sorev,[saymon,israel,_]),
                in_list(Sorev,[richard,_,Sport]),
                in_list(Sorev,[Name,australian,_]),
                in_list(Sorev,[_,american,_]),
                in_list(Sorev,[_,_,tennis]),
                in_list(Sorev,[_,_,criket]),

                not(in_list(Sorev,[saymon,_,tennis])),
                not(in_list(Sorev,[maikl,american,_])),

                write(Name),nl,
                write(Sport),nl,
                write(Sorev),!.

%Nomer 8 Var 5
pr_domino:- Domino = [_,_,_,_],

                in_list(Domino,[kyznecov,_]),
                in_list(Domino,[tokarev,_]),
                in_list(Domino,[slesarev,_]),
                in_list(Domino,[rezchikov,_]),
                in_list(Domino,[_,kyznec]),
                in_list(Domino,[_,tokar]),
                in_list(Domino,[_,slesar]),
                in_list(Domino,[_,rezchik]),

                not(in_list(Domino,[kyznecov,kyznec])),
                not(in_list(Domino,[tokarev,tokar])),
                not(in_list(Domino,[slesarev,slesar])),
                not(in_list(Domino,[rezchikov,rezchik])),

                not(in_list(Domino,[kyznecov,slesar])),

                sprava_next([slesarev,_],[_,tokar],Domino),

                sleva_next([_,kyznec],[Name,_],Domino),

                write(Name),nl,
                write(Domino),!.




