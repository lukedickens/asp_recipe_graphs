%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% HUMMUS AND RELATED RECIPES

% Domain specific recipe data file to be run with "GraphRecipes.lp"

% last updated: 9/5/2023

% run with the command "clingo 0 GraphRecipes.lp HummusExample.lp"
% or with the command "clingo 1 GraphRecipes.lp HummusExample.lp"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The size of the universal sets of comestible and action nodes for these examples:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (max_c_node_index + 1) is the maximum number of 
% comestible nodes allowed in a recipe graph.
% Change this according to your needs:
#const max_c_node_index=11.
% Similarly for action nodes:
#const max_a_node_index=5.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe graph: hummus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%recipe_graph(rg_hummus).
%
in(arcs(rg_hummus),arc(c(0),a(0))).
in(arcs(rg_hummus),arc(a(0),c(6))).
%
in(arcs(rg_hummus),arc(c(1),a(1))).
in(arcs(rg_hummus),arc(c(2),a(1))).
in(arcs(rg_hummus),arc(c(3),a(1))).
in(arcs(rg_hummus),arc(c(4),a(1))).
in(arcs(rg_hummus),arc(c(5),a(1))).
in(arcs(rg_hummus),arc(c(6),a(1))).
in(arcs(rg_hummus),arc(a(1),c(8))).
%
in(arcs(rg_hummus),arc(c(7),a(2))).
in(arcs(rg_hummus),arc(a(2),c(9))).
%%
in(arcs(rg_hummus),arc(c(8),a(3))).
in(arcs(rg_hummus),arc(c(9),a(3))).
in(arcs(rg_hummus),arc(a(3),c(10))).
connected(rg_hummus).

#show connected/1.
