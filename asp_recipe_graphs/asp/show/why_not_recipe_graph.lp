graph(RG) :- recipe_graph(RG).
recipe_graph(RG) :- given_recipe_graph(RG).

fails_constraint_1(RG,X) :- in(c_nodes(RG),X), not is_c_node(X), recipe_graph(RG).
fails_constraint_2(RG,X) :- in(a_nodes(RG),X), not is_a_node(X), recipe_graph(RG).
fails_constraint_3(RG,X) :- in(arcs(RG),X), not is_arc(X), recipe_graph(RG).
fails_constraint_4(RG) :- empty(c_nodes(RG)), recipe_graph(RG).
fails_constraint_5(RG) :- empty(a_nodes(RG)), recipe_graph(RG).
fails_constraint_6(RG) :- empty(arcs(RG)), recipe_graph(RG).
fails_constraint_7(RG) :- cyclic(RG), recipe_graph(RG).
fails_constraint_8(RG) :- -connected(RG), recipe_graph(RG).

fails_constraint_9(RG,a(N)):- -a_node_properly_connected(RG,a(N)), recipe_graph(RG).

fails_constraint_10(RG,a(N1),a(N2),c(N)) :- 
    in(arcs(RG),arc(a(N1),c(N))),
    in(arcs(RG),arc(a(N2),c(N))),
    N1 != N2,
    recipe_graph(RG).

fails_contraint_11(RG,c(N1),c(N2)) :- 
    recipe_graph(RG), in(c_nodes(RG),c(N2)), not high_indexes_allowed(RG),
    c_node_index(N1), N1<N2, not in(c_nodes(RG),c(N1)).
fails_contraint_12(RG,a(N1),a(N2)) :- 
    recipe_graph(RG), in(a_nodes(RG),a(N2)), not high_indexes_allowed(RG),
    a_node_index(N1), N1<N2, not in(a_nodes(RG),a(N1)).
fails_contraint_13(RG,path(RG,c(N2),c(N1))) :- 
    path(RG,c(N2),c(N1)), N1<N2, recipe_graph(RG).
fails_contraint_14(RG,path(RG,a(N2),a(N1))) :- 
    path(RG,a(N2),a(N1)), N1<N2, recipe_graph(RG).

#show fails_constraint_1/2.
#show fails_constraint_2/2.
#show fails_constraint_3/2.
#show fails_constraint_4/1.
#show fails_constraint_5/1.
#show fails_constraint_6/1.
#show fails_constraint_7/1.
#show fails_constraint_8/1.
#show fails_constraint_9/2.
#show fails_constraint_10/4.
#show fails_constraint_11/3.
#show fails_constraint_12/3.
#show fails_constraint_13/2.
#show fails_constraint_14/2.

