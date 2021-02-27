party(varian,1).
party(trall,1).
party(artas,0).
party(andyin,1).
party(silvana,1).
party(garrosh,0).
party(velen,1).
party(leadrin,1).
party(gyldan,0).
party(megakrut,1).
party(goleviks,1).
party(keltas,0).
party(sedogriv,1).
party(kern,1).
party(ashara,0).
party(dgaina,1).
party(voldgin,1).
party(illidan,0).
party(kadgar,1).
party(zyldgin,1).
party(manorot,0).
party(vilfred,1).
party(myln,1).
party(arximond,0).
party(malfyrion,1).
party(morroyz,1).
party(smertokril,0).
party(irel,1).
party(valira,1).
party(vaish,0).
party(myradin,1).
party(reksar,1).
party(teronkrov,0).
party(moira,1).
party(gazloy,1).
party(keltyzad,0).
party(tess,1).
party(magata,1).
party(glaidalis,1).

faction(varian,1).
faction(andyin,1).
faction(velen,1).
faction(megakrut,1).
faction(sedogriv,1).
faction(dgaina,1).
faction(kadgar,0).
faction(vilfred,1).
faction(malfyrion,1).
faction(irel,1).
faction(myradin,1).
faction(moira,1).
faction(tess,1).
faction(glaidalis,1).
faction(trall,2).
faction(silvana,0).
faction(leadrin,2).
faction(goleviks,2).
faction(kern,0).
faction(voldgin,2).
faction(zyldgin,2).
faction(myln,2).
faction(morroyz,0).
faction(valira,0).
faction(reksar,0).
faction(gazloy,2).
faction(magata,2).
faction(artas,1).
faction(garrosh,2).
faction(gyldan,0).
faction(keltas,2).
faction(ashara,0).
faction(illidan,1).
faction(manorot,0).
faction(arximond,0).
faction(smertokril,0).
faction(vaish,0).
faction(teronkrov,2).
faction(keltyzad,1).

rasa(varian,1).
rasa(andyin,1).
rasa(velen,5).
rasa(megakrut,4).
rasa(sedogriv,6).
rasa(dgaina,1).
rasa(kadgar,1).
rasa(vilfred,4).
rasa(malfyrion,3).
rasa(irel,5).
rasa(myradin,2).
rasa(moira,2).
rasa(tess,6).
rasa(glaidalis,6).
rasa(trall,7).
rasa(silvana,8).
rasa(leadrin,11).
rasa(goleviks,12).
rasa(kern,9).
rasa(voldgin,10).
rasa(zyldgin,10).
rasa(myln,9).
rasa(morroyz,8).
rasa(valira,11).
rasa(reksar,7).
rasa(gazloy,12).
rasa(magata,9).
rasa(artas,1).
rasa(garrosh,7).
rasa(gyldan,7).
rasa(keltas,11).
rasa(ashara,3).
rasa(illidan,3).
rasa(manorot,0).
rasa(arximond,0).
rasa(smertokril,0).
rasa(vaish,0).
rasa(teronkrov,7).
rasa(keltyzad,8).

class(varian,1).
class(andyin,5).
class(velen,5).
class(megakrut,0).
class(sedogriv,1).
class(dgaina,7).
class(kadgar,7).
class(vilfred,8).
class(malfyrion,9).
class(irel,2).
class(myradin,1).
class(moira,5).
class(tess,4).
class(glaidalis,9).
class(trall,6).
class(silvana,3).
class(leadrin,2).
class(goleviks,0).
class(kern,1).
class(voldgin,3).
class(zyldgin,4).
class(myln,6).
class(morroyz,4).
class(valira,4).
class(reksar,3).
class(gazloy,0).
class(magata,6).
class(artas,10).
class(garrosh,1).
class(gyldan,8).
class(keltas,8).
class(ashara,7).
class(illidan,11).
class(manorot,1).
class(arximond,8).
class(smertokril,0).
class(vaish,3).
class(teronkrov,10).
class(keltyzad,7).

pol(varian,1).
pol(andyin,1).
pol(velen,1).
pol(megakrut,1).
pol(sedogriv,1).
pol(dgaina,0).
pol(kadgar,1).
pol(vilfred,1).
pol(malfyrion,1).
pol(irel,0).
pol(myradin,1).
pol(moira,0).
pol(tess,0).
pol(glaidalis,1).
pol(trall,1).
pol(silvana,0).
pol(leadrin,0).
pol(goleviks,1).
pol(kern,1).
pol(voldgin,1).
pol(zyldgin,1).
pol(myln,1).
pol(morroyz,1).
pol(valira,0).
pol(reksar,1).
pol(gazloy,1).
pol(magata,0).
pol(artas,1).
pol(garrosh,1).
pol(gyldan,1).
pol(keltas,1).
pol(ashara,0).
pol(illidan,1).
pol(manorot,1).
pol(arximond,1).
pol(smertokril,1).
pol(vaish,0).
pol(teronkrov,1).
pol(keltyzad,1).

quest1(X1):-write("Vash personag za dobro ili zlo?"),nl,
                  write("0.Zlo"),nl,
                  write("1.Dobro"),nl,read(X1).

quest2(X2):-write("K kakoi fraction otnositsa vash personag?"),nl,
                  write("0.Neitral"),nl,
                  write("1.Alience"),nl,
                  write("2.Horde"),nl,read(X2).

quest3(X3):-write("K Kakoi rase prinadlegit vash personag?"),nl,
                  write("0.Raznoe") ,nl,write("1.Human"),nl,
                  write("2.Dforf")  ,nl,write("3.Nochnoi elf"),nl,
                  write("4.Gnom")   ,nl,write("5.Drenei"),nl,
                  write("6.Vorgen") ,nl,write("7.Ork"),nl,
                  write("8.Negit")  ,nl,write("9.Tayren"),nl,
                  write("10.Troll") ,nl,write("11.Elf krovi"),nl,
                  write("12.Goblin"),nl,read(X3).

quest4(X4):-write("Kakoi class y vashego personaga?"),nl,
                  write("0.Neizvestno")  ,nl,write("1.Voin"),nl,
                  write("2.Paladin")     ,nl,write("3.Oxotnik"),nl,
                  write("4.Razboinik")   ,nl,write("5.Priest"),nl,
                  write("6.Shaman")      ,nl,write("7.Mag"),nl,
                  write("8.Chernoknig")  ,nl,write("9.Dryid"),nl,
                  write("10.RicarSmerti"),nl,write("11.DemonXant"),nl,read(X4).

quest5(X5):-write("Kakoi pol vashego personaga?"),nl,
                  write("0.Woman"),nl,
                  write("1.Man"),nl,read(X5).

pr:-quest1(X1),quest2(X2),quest3(X3),quest4(X4),quest5(X5),
    party(X,X1),faction(X,X2),rasa(X,X3),class(X,X4),pol(X,X5),write(X).
