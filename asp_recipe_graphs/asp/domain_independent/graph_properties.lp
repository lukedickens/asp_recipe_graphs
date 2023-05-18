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

% specify values of "max_c_node_index" 
c_node_index(0..max_c_node_index).
% and "max_a_node_index" in domain
a_node_index(0..max_a_node_index).
is_c_node(c(N)) :- c_node_index(N).
is_a_node(a(N)) :- a_node_index(N).
is_arc(arc(X,Y)) :- is_c_node(X), is_a_node(Y).
is_arc(arc(X,Y)) :- is_a_node(X), is_c_node(Y).
is_node(N) :- is_c_node(N).
is_node(N) :- is_a_node(N).

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

% C, A and E must be non-empty:
-empty(c_nodes(G)) :- 
    in(c_nodes(G),C).
empty(c_nodes(G)) :- 
    graph(G), 
    not -empty(c_nodes(G)).

-empty(a_nodes(G)) :- 
    in(a_nodes(G),C).
empty(a_nodes(G)) :- 
    graph(G), 
    not -empty(a_nodes(G)).

-empty(arcs(G)) :- 
    in(arcs(G),A).
empty(arcs(G)) :- 
    graph(G), 
    not -empty(arcs(G)).

% recipe graphs must be acyclic:
path(G,N1,N2) :- 
    in(arcs(G),arc(N1,N2)).
path(G,N1,N3) :- 
    path(G,N1,N2), 
    in(arcs(G),arc(N2,N3)).
cyclic(G) :- path(G,N,N).

% recipe graphs must be connected:
% for this definition we need "Nodes" (the union of sets C and A):
in(nodes(G),N) :- in(a_nodes(G),N).
in(nodes(G),N) :- in(c_nodes(G),N).
connected_in(G,N,N) :- in(nodes(G),N).
connected_in(G,N1,N2) :-
    in(nodes(G),N1),
    in(nodes(G),N2),
    in(nodes(G),N),
    connected_in(G,N1,N),
    in(arcs(G),arc(N,N2)).
connected_in(G,N1,N2) :-
    in(nodes(G),N1),
    in(nodes(G),N2),
    in(nodes(G),N),
    connected_in(G,N1,N),
    in(arcs(G),arc(N2,N)).
-connected(G) :- 
    in(nodes(G),N1),
    in(nodes(G),N2),
    not connected_in(G,N1,N2).

% all action nodes in a recipe graph must have both an incoming and an outgoing arc:
has_incoming_arc(G,N) :- in(arcs(G),arc(N1,N)).
has_outgoing_arc(G,N) :- in(arcs(G),arc(N,N1)).
-a_node_properly_connected(G,a(N)) :- 
    in(a_nodes(G),a(N)), 
    not has_incoming_arc(G,a(N)).
-a_node_properly_connected(G,a(N)) :- 
    in(a_nodes(G),a(N)), 
    not has_outgoing_arc(G,a(N)).

