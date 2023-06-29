%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition 2 of an atomic recipe graph:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-atomic_recipe_graph(RG) :- 
    in(a_nodes(RG),a(N1)), 
    in(a_nodes(RG),a(N2)), 
    N1 != N2.
atomic_recipe_graph(RG) :- 
    recipe_graph(RG), 
    not -atomic_recipe_graph(RG).

%%%%%%%%%%%%%%%%%%%%%
% End of Definition 2
%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%
% From Definition 3 : atomic recipes
%%%%%%%%%%%%%%%%%%%%
atomic_recipe(RG, TF) :-
    recipe(RG, TF),
    atomic_recipe_graph(RG).    
%%%%%%%%%%%%%%%%%%%%%
% End of Definition 2
%%%%%%%%%%%%%%%%%%%%%

