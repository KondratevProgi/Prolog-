%Nomer 1
append_ch([],X,X).
append_ch([H|T1],X,[H|T2]):-append_ch(T1,X,T2).


