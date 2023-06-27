%
#const max_c_node_index=10.
#const max_a_node_index=3.


recipe_graph(rg_victoria_sponge).
% Beat together the sugar and butter until light and fluffy. Beat as much air as you can into the mixture for a light and airy cake.
in(arcs(rg_victoria_sponge),arc(c(0),a(0))).
in(arcs(rg_victoria_sponge),arc(c(1),a(0))).
in(arcs(rg_victoria_sponge),arc(a(0),c(2))).
in(arcs(rg_victoria_sponge),arc(c(2),a(1))).
in(arcs(rg_victoria_sponge),arc(c(3),a(1))).
in(arcs(rg_victoria_sponge),arc(c(4),a(1))).
in(arcs(rg_victoria_sponge),arc(c(5),a(1))).
in(arcs(rg_victoria_sponge),arc(a(1),c(6))).
in(arcs(rg_victoria_sponge),arc(c(6),a(2))).
in(arcs(rg_victoria_sponge),arc(a(2),c(7))).
in(arcs(rg_victoria_sponge),arc(c(7),a(3))).
in(arcs(rg_victoria_sponge),arc(c(8),a(3))).
in(arcs(rg_victoria_sponge),arc(c(9),a(3))).
in(arcs(rg_victoria_sponge),arc(a(3),c(10))).

