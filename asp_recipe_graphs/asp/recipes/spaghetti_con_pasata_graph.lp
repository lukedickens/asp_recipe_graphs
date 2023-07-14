%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe graph: spaghetti_con pasata
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


given_recipe_graph(rg_spaghetti_con_pasata).
% boil spaghetti
in(arcs(rg_spaghetti_con_pasata),arc(c(0),a(0))).
in(arcs(rg_spaghetti_con_pasata),arc(c(1),a(0))).
in(arcs(rg_spaghetti_con_pasata),arc(a(0),c(2))).
% mix pasata with onions
in(arcs(rg_spaghetti_con_pasata),arc(c(3),a(1))).
in(arcs(rg_spaghetti_con_pasata),arc(c(4),a(1))).
in(arcs(rg_spaghetti_con_pasata),arc(a(1),c(5))).
% drain spaghetti
in(arcs(rg_spaghetti_con_pasata),arc(c(2),a(2))).
in(arcs(rg_spaghetti_con_pasata),arc(a(2),c(6))).
in(arcs(rg_spaghetti_con_pasata),arc(a(2),c(7))).
%% put in bowl
in(arcs(rg_spaghetti_con_pasata),arc(c(7),a(3))).
in(arcs(rg_spaghetti_con_pasata),arc(a(3),c(8))).
% mix in bowl
in(arcs(rg_spaghetti_con_pasata),arc(c(5),a(4))).
in(arcs(rg_spaghetti_con_pasata),arc(c(8),a(4))).
in(arcs(rg_spaghetti_con_pasata),arc(a(4),c(9))).

