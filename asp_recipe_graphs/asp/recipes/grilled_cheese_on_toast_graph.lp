%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  recipe graph (beans on toast):
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%#const max_c_node_index=4.
%#const max_a_node_index=3.

given_recipe_graph(rg_grilled_cheese_on_toast).   
in(arcs(rg_grilled_cheese_on_toast),arc(c(0),a(0))).
in(arcs(rg_grilled_cheese_on_toast),arc(a(0),c(1))).
in(arcs(rg_grilled_cheese_on_toast),arc(c(1),a(1))).
in(arcs(rg_grilled_cheese_on_toast),arc(c(2),a(1))).
in(arcs(rg_grilled_cheese_on_toast),arc(a(1),c(3))).
in(arcs(rg_grilled_cheese_on_toast),arc(c(3),a(2))).
in(arcs(rg_grilled_cheese_on_toast),arc(a(2),c(4))).



