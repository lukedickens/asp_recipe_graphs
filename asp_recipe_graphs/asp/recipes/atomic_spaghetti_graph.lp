%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe graph: rg_atomic_spaghetti
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


recipe_graph(rg_atomic_spaghetti).
% boil spaghetti
in(arcs(rg_atomic_spaghetti),arc(c(0),a(0))).
in(arcs(rg_atomic_spaghetti),arc(c(1),a(0))).
in(arcs(rg_atomic_spaghetti),arc(a(0),c(2))).
