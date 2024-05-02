%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition 3: Recipe
%%%%%%%%%%%%%%%%%%%%%%%%%%%

recipe(RG,TF) :- given_recipe(RG,TF).
recipe_graph(RG) :- recipe(RG,TF).

given_recipe_graph(RG) :- given_recipe(RG,TF).
given_type_of(TF, V, T) :- 
    given_recipe(RG,TF),
    in(nodes(RG),V),
    type_of(TF, V, T).

% the 3rd argument of type_of is a function of the first two arguments:
% range of function is the c_nodes and a_nodes of corresponding graph
1 { type_of(TF,c(N),Ctype) : comestible_type(Ctype) } 1 :-
    recipe(RG,TF), in(c_nodes(RG),c(N)).
1 { type_of(TF,a(N),Atype) : action_type(Atype) } 1 :-
    recipe(RG,TF), in(a_nodes(RG),a(N)).

% for each recipe, type_of is restricted to its nodes only:
:- type_of(TF,N,T), recipe(RG,TF), not in(nodes(RG),N).

% all the comestible node types in a recipe must be in different type paths:
:- recipe(RG,TF), in(c_nodes(RG),N1), in(c_nodes(RG),N2), N1 != N2, 
   type_of(TF,N1,T1), type_of(TF,N2,T2), same_type_path(T1,T2).

% given recipes have an extra constraint that all nodes must have "given" types
has_given_type(TF, V) :-
    given_type_of(TF, V, T), action_or_comestible_type(T).
:- given_recipe(RG, TF), in(nodes(RG), V), not has_given_type(TF, V).

%%%%%%%%%%%%%%%%%%%%%
% End of Definition 3
%%%%%%%%%%%%%%%%%%%%%

comestible_type_in(recipe(RG,TF),Type) :- recipe(RG,TF), type_of(TF,V,Type), in(c_nodes(RG),V).
action_type_in(recipe(RG,TF),Type) :- recipe(RG,TF), type_of(TF,V,Type), in(a_nodes(RG),V).

