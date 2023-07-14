%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe graph: baba_ganoush
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

given_recipe_graph(rg_baba_ganoush).
% halve and oil
in(arcs(rg_baba_ganoush),arc(c(0),a(0))).
in(arcs(rg_baba_ganoush),arc(c(1),a(0))).
in(arcs(rg_baba_ganoush),arc(a(0),c(2))).
% roast
in(arcs(rg_baba_ganoush),arc(c(2),a(1))).
in(arcs(rg_baba_ganoush),arc(a(1),c(3))).
% scoop out flesh
in(arcs(rg_baba_ganoush),arc(c(3),a(2))).
in(arcs(rg_baba_ganoush),arc(a(2),c(4))).
in(arcs(rg_baba_ganoush),arc(a(2),c(5))).
% scoop out flesh
in(arcs(rg_baba_ganoush),arc(c(3),a(2))).
in(arcs(rg_baba_ganoush),arc(a(2),c(4))).
in(arcs(rg_baba_ganoush),arc(a(2),c(5))).
% strain
in(arcs(rg_baba_ganoush),arc(c(5),a(3))).
in(arcs(rg_baba_ganoush),arc(a(3),c(6))).
in(arcs(rg_baba_ganoush),arc(a(3),c(7))).
% stir together
in(arcs(rg_baba_ganoush),arc(c(7),a(4))).
in(arcs(rg_baba_ganoush),arc(c(8),a(4))).
in(arcs(rg_baba_ganoush),arc(c(9),a(4))).
in(arcs(rg_baba_ganoush),arc(a(4),c(10))).
% stir in tahini
in(arcs(rg_baba_ganoush),arc(c(10),a(5))).
in(arcs(rg_baba_ganoush),arc(c(11),a(5))).
in(arcs(rg_baba_ganoush),arc(a(5),c(12))).
% drizzle in oil while stirring
in(arcs(rg_baba_ganoush),arc(c(12),a(6))).
in(arcs(rg_baba_ganoush),arc(c(1),a(6))).
in(arcs(rg_baba_ganoush),arc(a(6),c(13))).
% Stir in the parsley, salt and cumin
in(arcs(rg_baba_ganoush),arc(c(13),a(7))).
in(arcs(rg_baba_ganoush),arc(c(14),a(7))).
in(arcs(rg_baba_ganoush),arc(c(15),a(7))).
in(arcs(rg_baba_ganoush),arc(c(16),a(7))).
in(arcs(rg_baba_ganoush),arc(a(7),c(17))).
% season
in(arcs(rg_baba_ganoush),arc(c(17),a(8))).
in(arcs(rg_baba_ganoush),arc(c(15),a(8))).
in(arcs(rg_baba_ganoush),arc(c(9),a(8))).
in(arcs(rg_baba_ganoush),arc(a(8),c(18))).
% garnish
in(arcs(rg_baba_ganoush),arc(c(18),a(9))).
in(arcs(rg_baba_ganoush),arc(c(19),a(9))).
in(arcs(rg_baba_ganoush),arc(a(9),c(20))).


