%
#const max_c_node_index=13.
#const max_a_node_index=4.


given_recipe_graph(rg_bbc_vegan_sponge_cake).
% Put the dairy-free milk into a jug and add the vinegar, leave for a few minutes until it looks a little lumpy.
in(arcs(rg_bbc_vegan_sponge_cake),arc(c(0),a(0))).
in(arcs(rg_bbc_vegan_sponge_cake),arc(c(1),a(0))).
in(arcs(rg_bbc_vegan_sponge_cake),arc(a(0),c(2))).
% Put half of the vanilla seeds and all the other cake ingredients into a large bowl, then pour over the milk mixture. Using electric beaters or a wooden spoon, beat everything together until smooth.
in(arcs(rg_bbc_vegan_sponge_cake),arc(c(3),a(1))).
in(arcs(rg_bbc_vegan_sponge_cake),arc(c(4),a(1))).
in(arcs(rg_bbc_vegan_sponge_cake),arc(c(5),a(1))).
in(arcs(rg_bbc_vegan_sponge_cake),arc(c(6),a(1))).
in(arcs(rg_bbc_vegan_sponge_cake),arc(c(7),a(1))).
in(arcs(rg_bbc_vegan_sponge_cake),arc(a(1),c(8))).
%
in(arcs(rg_bbc_vegan_sponge_cake),arc(c(8),a(2))).
in(arcs(rg_bbc_vegan_sponge_cake),arc(c(2),a(2))).
in(arcs(rg_bbc_vegan_sponge_cake),arc(a(2),c(9))).
%
in(arcs(rg_bbc_vegan_sponge_cake),arc(c(9),a(3))).
in(arcs(rg_bbc_vegan_sponge_cake),arc(a(3),c(10))).
%
in(arcs(rg_bbc_vegan_sponge_cake),arc(c(10),a(4))).
in(arcs(rg_bbc_vegan_sponge_cake),arc(c(11),a(4))).
in(arcs(rg_bbc_vegan_sponge_cake),arc(c(12),a(4))).
in(arcs(rg_bbc_vegan_sponge_cake),arc(a(4),c(13))).

