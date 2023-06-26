%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  recipe graph (beans on toast):
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#const max_c_node_index=4.
#const max_a_node_index=1.

recipe_graph(rg_beans_on_toast).   
in(arcs(rg_beans_on_toast),arc(c(0),a(0))).
in(arcs(rg_beans_on_toast),arc(c(1),a(0))).
in(arcs(rg_beans_on_toast),arc(a(0),c(2))).
in(arcs(rg_beans_on_toast),arc(c(3),a(1))).
in(arcs(rg_beans_on_toast),arc(c(2),a(1))).
in(arcs(rg_beans_on_toast),arc(a(1),c(4))).


