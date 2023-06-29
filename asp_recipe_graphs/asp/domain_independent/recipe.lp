%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition 3 of a recipe:
%%%%%%%%%%%%%%%%%%%%%%%%%%%

recipe_graph(RG) :- recipe(RG,TF).
recipe(RG,TF) :- given_recipe(RG,TF).
%TODO Luke: constrain the recipe predicate to only act on type functions
%TODO Luke: constrain type functions to only associate one type with each node
%TODO Luke: constrain type functions paired with a recipe graph to only define types for nodes within the graph 
%type_function(TF) :- given_recipe(RG,TF).
%%:- recipe(RG, TF), not graph(RG).
%:- recipe(RG, TF), not type_function(TF).
%:- recipe(RG,TF), type_of(TF,V,Type1), type_of(TF,V,Type2), Type1 != Type2.
%:- recipe(RG,TF), type_of(TF,V,Type), not in(nodes(RG),V).


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

    
%%%%%%%%%%%%%%%%%%%%%
% End of Definition 3
%%%%%%%%%%%%%%%%%%%%%

