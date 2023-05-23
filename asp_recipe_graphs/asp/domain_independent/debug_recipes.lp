%% Luke added these to try to debug his recipes
conflicting_types(G, TF, T1, T2) :-
    typed_graph(G,TF),
    in(c_nodes(G),V1), in(c_nodes(G),V2), V1 != V2, 
    type_of(TF,V1,T1), type_of(TF,V2,T2), same_type_path(T1,T2).

well_typed_a_node(G, TF, a(N)) :-
    typed_graph(G,TF), in(a_nodes(G),a(N)),
    type_of(TF,a(N),T), action_type(T).

-well_typed_a_node(G, TF, a(N)) :-
    typed_graph(G,TF), in(a_nodes(G),a(N)),
    not well_typed_a_node(G, TF, a(N)).

well_typed_c_node(G, TF, c(N)) :-
    typed_graph(G, TF), in(c_nodes(G),c(N)),
    type_of(TF,c(N),T), comestible_type(T).

-well_typed_c_node(G, TF, c(N)) :-
    typed_graph(G, TF), in(c_nodes(G),c(N)),
    not well_typed_c_node(G, TF, c(N)).

has_untyped_node(G, TF) :-
    action_or_comestible_type(T),
    in(nodes(G),V),
    typed_graph(G, TF),
    not type_of(TF,V,T).

%c_node_not_comestible_type(TF, N):-    
%    type_of(TF,c(N),T), not comestible_type(T).
%a_node_not_action_type(TF, N):-    
%    type_of(TF,a(N),T), not action_type(T).

