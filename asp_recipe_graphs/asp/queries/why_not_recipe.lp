%
is_typed(TF,V) :-
    action_or_comestible_type(T),
    given_type_of(TF,V,T).
-is_typed(TF,V) :-
    not is_typed(TF,V),
    in(nodes(RG),V),
    given_recipe(RG, TF).

untyped_node(given_recipe(RG,TF),V) :-
    given_recipe(RG,TF),
    in(nodes(RG),V),
    not is_typed(TF,V).

badly_typed_a_node(given_recipe(RG,TF),type_of(TF,a(N),T)) :-
    given_recipe(RG,TF), in(a_nodes(RG),a(N)),
    given_type_of(TF,a(N),T),
    not action_type(T).

badly_typed_c_node(given_recipe(RG,TF), given_type_of(TF,c(N),T)) :-
    given_recipe(RG,TF), in(c_nodes(RG),c(N)),
    given_type_of(TF,c(N),T),
    not comestible_type(T).

multiply_typed_node(given_recipe(RG,TF), given_type_of(TF,V,T1), given_type_of(TF,V,T2)) :-
    given_recipe(RG,TF), 
    in(nodes(RG),V),
    given_type_of(TF,V,T1),
    given_type_of(TF,V,T2),
    % this is equivalent to T1 != T2 but avoid symmetrical groundings
    T1 < T2.


% constraint
% for each recipe, given_type_of is restricted to its nodes only:
typed_node_not_in_graph(given_recipe(RG,TF),given_type_of(TF,N,T)) :-
    given_recipe(RG,TF), given_type_of(TF,N,T), not in(nodes(RG),N).

% all the comestible node types in a recipe must be in different type paths:
comestible_types_from_same_type_path(given_recipe(RG,TF), given_type_of(TF,N1,T1), given_type_of(TF,N2,T2)) :-
    given_recipe(RG,TF), in(c_nodes(RG),N1), in(c_nodes(RG),N2), N1 != N2, 
    given_type_of(TF,N1,T1), given_type_of(TF,N2,T2), same_type_path(T1,T2).


#show typed_node_not_in_graph/2.
#show comestible_types_from_same_type_path/3.
%#show is_typed/2.
%#show -is_typed/2.
%#show in/2.
%#show given_type_of/3.
%#show given_recipe/2.
#show untyped_node/2.
#show badly_typed_a_node/2.
#show badly_typed_c_node/2.
#show multiply_typed_node/3.

