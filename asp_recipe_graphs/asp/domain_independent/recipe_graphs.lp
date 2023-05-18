%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ASP Implementation of Section 3 of 
% "A Graphical Formalism for Commonsense Reasoning with Recipes",
% by Antonis Bikakis , Aissatou Diallo , Luke Dickens, Anthony Hunter, Rob Miller

% Version 0.1

% last updated: 17/5/2023

% to run, also requires
%     type_hierarchies.lp   (i.e. code for Section 2)
%     graph_properties.lp   (i.e. code which defines the graph properties used)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Section 3 of paper, Recipes as graphs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition 1 of a recipe graph:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% C contains only comestible nodes:
:- in(c_nodes(RG),X), not is_c_node(X), recipe_graph(RG).
% A contains only action nodes:
:- in(a_nodes(RG),X), not is_a_node(X), recipe_graph(RG).
% E contains only arcs: 
:- in(arcs(RG),X), not is_arc(X), recipe_graph(RG).
% C and A include all the nodes appearing in E:

:- empty(c_nodes(RG)), recipe_graph(RG).
:- empty(a_nodes(RG)), recipe_graph(RG).
:- empty(arcs(RG)), recipe_graph(RG).

:- cyclic(RG), recipe_graph(RG).
:- -connected(RG), recipe_graph(RG).

:- -a_node_properly_connected(RG,a(N)), recipe_graph(RG).

% for each comestible node in a recipe graph, there is at most one incoming arc:
:- in(arcs(RG),arc(a(N1),c(N))), in(arcs(RG),arc(a(N2),c(N))), N1 != N2, recipe_graph(RG).

% subsets of graphs and recipes:
graph(RG) :- recipe_graph(RG).
recipe_graph(RG) :- given_recipe_graph(RG).
recipe_graph(RG) :- recipe(RG,TF).
given_recipe_graph(RG) :- given_recipe(RG,TF).
recipe(RG,TF) :- given_recipe(RG,TF).

%%%%%%%%%%%%%%%%%%%%%
% End of Definition 1
%%%%%%%%%%%%%%%%%%%%%

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Here are some extra constraints on how nodes can be chosen to make up a recipe
% graph, not included in the paper, but included here to reduce the number of 
% possible configurations for under-specified recipe graphs:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% in the construction of recipe graphs that are not strict sub-recipe graphs of  
% another recipe graph, and not "given recipe graphs", nodes have to be used with 
% as low indexes as possible:

high_indexes_allowed(RG) :- given_recipe_graph(RG).
high_indexes_allowed(RG) :- strict_subrecipe_graph(RG).

:- recipe_graph(RG), in(c_nodes(RG),c(N2)), not high_indexes_allowed(RG),
   c_node_index(N1), N1<N2, not in(c_nodes(RG),c(N1)).
:- recipe_graph(RG), in(a_nodes(RG),a(N2)), not high_indexes_allowed(RG),
   a_node_index(N1), N1<N2, not in(a_nodes(RG),a(N1)).
   
% there can't be a path from a node to another node with 
% a lower index if the other node is of the same type:
:- path(RG,c(N2),c(N1)), N1<N2, recipe_graph(RG).
:- path(RG,a(N2),a(N1)), N1<N2, recipe_graph(RG).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% end of extra constraints not in the paper.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
   
%%%%%%%%%%%%%%%%%%%%%
% End of Definition 3
%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Coding of extra notation at the end of Section 3:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

in(mid(RG),c(N)) :- 
    in(arcs(RG),arc(a(N1),c(N))), 
    in(arcs(RG),arc(c(N),a(N2))).
in(in(RG),c(N)) :- 
    in(arcs(RG),arc(c(N),a(N1))),
    not in(mid(RG),c(N)).
in(out(RG),c(N)) :- 
    in(arcs(RG),arc(a(N1),c(N))),
    not in(mid(RG),c(N)).
in(acts(RG),a(N)) :- 
    in(arcs(RG),arc(a(N),c(N1))).
in(acts(RG),a(N)) :- 
    in(arcs(RG),arc(c(N1),a(N))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of coding of extra notation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
