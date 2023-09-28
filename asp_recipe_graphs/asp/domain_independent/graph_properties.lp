%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ASP Part Implementation of Section 3 of 
% "A Graphical Formalism for Commonsense Reasoning with Recipes",
% by Antonis Bikakis , Aissatou Diallo , Luke Dickens, Anthony Hunter, Rob Miller

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Properties for Section 3 of paper, Recipes as graphs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% define pools of comestible nodes, action nodes,   
%% and arcs with which to construct graphs:

%TODO get c_node_index(N) to be created if c(N) stated within a recipe.
% specify values of "max_c_node_index" 
%c_node_index(0..max_c_node_index).
%% and "max_a_node_index" in domain
%a_node_index(0..max_a_node_index).

% auto discover recipe graph nodes
%TODO is this safe? In Luke's sense of the word safe.
c_node_index(N1) :-
    in(arcs(RG),arc(c(N1),a(N2))).
a_node_index(N2) :-
    in(arcs(RG),arc(c(N1),a(N2))).
a_node_index(N1) :-
    in(arcs(RG),arc(a(N1),c(N2))).
c_node_index(N2) :-
    in(arcs(RG),arc(a(N1),c(N2))).

% 
is_c_node(c(N)) :- c_node_index(N).
is_a_node(a(N)) :- a_node_index(N).
is_arc(arc(X,Y)) :- is_c_node(X), is_a_node(Y).
is_arc(arc(X,Y)) :- is_a_node(X), is_c_node(Y).
is_node(V) :- is_c_node(V).
is_node(V) :- is_a_node(V).



% "Coms(R)" in the paper
in(c_nodes(G),c(N)) :- in(arcs(G),arc(c(N),a(N1))).
in(c_nodes(G),c(N)) :- in(arcs(G),arc(a(N1),c(N))).
% "Acts(R)" in the paper
in(a_nodes(G),a(N)) :- in(arcs(G),arc(a(N),c(N1))).
in(a_nodes(G),a(N)) :- in(arcs(G),arc(c(N1),a(N))).

% anything that contains arcs, c_nodes or a_nodes is assumed to be a graph
graph(G) :- in(arcs(G),Arc).
graph(G) :- in(a_nodes(G),A).
graph(G) :- in(c_nodes(G),C).

% C, A and E are non-empty if they contain elements:
-empty(c_nodes(G)) :- 
    in(c_nodes(G),C).
empty(c_nodes(G)) :- 
    graph(G), 
    not -empty(c_nodes(G)).

-empty(a_nodes(G)) :- 
    in(a_nodes(G),A).
empty(a_nodes(G)) :- 
    graph(G), 
    not -empty(a_nodes(G)).

-empty(arcs(G)) :- 
    in(arcs(G),Arc).
empty(arcs(G)) :- 
    graph(G), 
    not -empty(arcs(G)).

% recipe graphs must be acyclic:
path(G,V1,V2) :- 
    in(arcs(G),arc(V1,V2)).
path(G,V1,V3) :- 
    path(G,V1,V2), 
    in(arcs(G),arc(V2,V3)).
cyclic(G) :- path(G,V,V).

% recipe graphs must be connected (see recipe_graphs.lp)
% for this definition we need "Nodes" (the union of sets C and A):
in(nodes(G),V) :- in(a_nodes(G),V).
in(nodes(G),V) :- in(c_nodes(G),V).
connected_in(G,V,V) :- in(nodes(G),V).
connected_in(G,V1,V2) :-
    in(nodes(G),V1),
    in(nodes(G),V2),
    in(nodes(G),Vbetween),
    connected_in(G,V1,Vbetween),
    in(arcs(G),arc(Vbetween,V2)).
connected_in(G,V1,V2) :-
    in(nodes(G),V1),
    in(nodes(G),V2),
    in(nodes(G),Vbetween),
    connected_in(G,V1,Vbetween),
    in(arcs(G),arc(V2,Vbetween)).
connected_in(G,V1,V2) :-
    connected_in(G,V2,V1).
-connected(G) :- 
    in(nodes(G),V1),
    in(nodes(G),V2),
    not connected_in(G,V1,V2).
%NOTE Next line may not be needed
connected(G) :- graph(G), not -connected(G).

% all action nodes in a recipe graph must have both an incoming and an outgoing arc:
has_incoming_arc(G,V) :- in(arcs(G),arc(V1,V)).
has_outgoing_arc(G,V) :- in(arcs(G),arc(V,V1)).
-a_node_properly_connected(G,a(N)) :- 
    in(a_nodes(G),a(N)), 
    not has_incoming_arc(G,a(N)).
-a_node_properly_connected(G,a(N)) :- 
    in(a_nodes(G),a(N)), 
    not has_outgoing_arc(G,a(N)).

