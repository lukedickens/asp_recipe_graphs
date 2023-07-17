%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe graph: hummus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

given_recipe_graph(rg_edamame_hummus).
% thawing edamame
in(arcs(rg_edamame_hummus),arc(c(0),a(0))).
in(arcs(rg_edamame_hummus),arc(a(0),c(1))).
% shelling edamame
in(arcs(rg_edamame_hummus),arc(c(1),a(1))).
in(arcs(rg_edamame_hummus),arc(a(1),c(2))).
% blend lemon juice and tahini
in(arcs(rg_edamame_hummus),arc(c(3),a(2))).
in(arcs(rg_edamame_hummus),arc(c(4),a(2))).
in(arcs(rg_edamame_hummus),arc(a(2),c(5))).
% blend in other flavours
in(arcs(rg_edamame_hummus),arc(c(5),a(3))).
in(arcs(rg_edamame_hummus),arc(c(6),a(3))).
in(arcs(rg_edamame_hummus),arc(c(7),a(3))).
in(arcs(rg_edamame_hummus),arc(c(8),a(3))).
in(arcs(rg_edamame_hummus),arc(c(9),a(3))).
in(arcs(rg_edamame_hummus),arc(a(3),c(10))).
% blend in beans
in(arcs(rg_edamame_hummus),arc(c(10),a(4))).
in(arcs(rg_edamame_hummus),arc(c(2),a(4))).
in(arcs(rg_edamame_hummus),arc(a(4),c(11))).
% top
in(arcs(rg_edamame_hummus),arc(c(11),a(5))).
in(arcs(rg_edamame_hummus),arc(c(2),a(5))).
in(arcs(rg_edamame_hummus),arc(a(5),c(12))).
% garnish
in(arcs(rg_edamame_hummus),arc(c(12),a(6))).
in(arcs(rg_edamame_hummus),arc(c(13),a(6))).
in(arcs(rg_edamame_hummus),arc(c(14),a(6))).
in(arcs(rg_edamame_hummus),arc(a(6),c(15))).


