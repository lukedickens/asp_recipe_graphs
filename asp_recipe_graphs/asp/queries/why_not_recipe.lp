%
is_typed(TF,V) :-
    action_or_comestible_type(T),
    type_of(TF,V,T).


untyped_node(given_recipe(RG,TF),V) :-
    given_recipe(RG,TF),
    in(nodes(RG),V),
    not is_typed(TF,V).

badly_typed_a_node(given_recipe(RG,TF),type_of(TF,a(N),T)) :-
    given_recipe(RG,TF), in(a_nodes(RG),a(N)),
    type_of(TF,a(N),T),
    not action_type(T).

badly_typed_c_node(given_recipe(RG,TF),type_of(TF,c(N),T)) :-
    given_recipe(RG,TF), in(c_nodes(RG),c(N)),
    type_of(TF,c(N),T),
    not comestible_type(T).

multiply_typed_node(given_recipe(RG,TF),type_of(TF,V,T1),type_of(TF,V,T2)) :-
    given_recipe(RG,TF), 
    in(nodes(RG),V),
    type_of(TF,V,T1),
    type_of(TF,V,T2),
    % this is equivalent to T1 != T2 but avoid symmetrical groundings
    T1 < T2.


% constraint
% for each recipe, type_of is restricted to its nodes only:
typed_node_not_in_graph(given_recipe(RG,TF),type_of(TF,N,T)) :-
    given_recipe(RG,TF), type_of(TF,N,T), not in(nodes(RG),N).

% all the comestible node types in a recipe must be in different type paths:
comestible_types_from_same_type_path(given_recipe(RG,TF), type_of(TF,N1,T1), type_of(TF,N2,T2)) :-
    given_recipe(RG,TF), in(c_nodes(RG),N1), in(c_nodes(RG),N2), N1 != N2, 
    type_of(TF,N1,T1), type_of(TF,N2,T2), same_type_path(T1,T2).

%%% old definitions
%%
%%-well_typed_a_node(G, TF, a(N)) :-
%%    typed_graph(G,TF), in(a_nodes(G),a(N)),
%%    not well_typed_a_node(G, TF, a(N)).
%%
%%well_typed_c_node(G, TF, c(N)) :-
%%    typed_graph(G, TF), in(c_nodes(G),c(N)),
%%    type_of(TF,c(N),T), comestible_type(T).
%%
%%-well_typed_c_node(G, TF, c(N)) :-
%%    typed_graph(G, TF), in(c_nodes(G),c(N)),
%%    not well_typed_c_node(G, TF, c(N)).
%%
%%untyped_node(G, TF, N) :-
%%    action_or_comestible_type(T),
%%    in(nodes(G),N),
%%    typed_graph(G, TF),
%%    not type_of(TF,N,T).
%%
%%unused_type(G,TF,T) :-
%%    type_of(TF,N,T),
%%    not in(nodes(G),N),
%%    typed_graph(G, TF).


#show typed_node_not_in_graph/2.
#show comestible_types_from_same_type_path/3.
#show untyped_node/2.
#show badly_typed_a_node/2.
#show badly_typed_c_node/2.
#show multiply_typed_node/3.

