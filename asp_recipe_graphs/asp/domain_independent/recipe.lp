%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition 3 of a recipe:
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% the 3rd argument of type_of is a function of the first two arguments:
1 { type_of(TF,c(N),Ctype) : comestible_type(Ctype) } 1 :- 
    recipe(RG,TF), in(c_nodes(RG),c(N)).
1 { type_of(TF,a(N),Atype) : action_type(Atype) } 1 :- 
    recipe(RG,TF), in(a_nodes(RG),a(N)).

% for each recipe, type_of is restricted to its nodes only:
:- type_of(TF,N,T), recipe(RG,TF), not in(nodes(RG),N).

% all the comestible node types in a recipe must be in different type paths:
:- recipe(RG,TF), in(c_nodes(RG),N1), in(c_nodes(RG),N2), N1 != N2, 
   type_of(TF,N1,T1), type_of(TF,N2,T2), same_type_path(T1,T2).
    
atomic_recipe(RG, TF) :-
    recipe(RG, TF),
    atomic_recipe_graph(RG).    
    
%%%%%%%%%%%%%%%%%%%%%
% End of Definition 3
%%%%%%%%%%%%%%%%%%%%%

