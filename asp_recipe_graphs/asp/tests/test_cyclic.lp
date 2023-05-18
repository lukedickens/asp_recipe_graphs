%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cyclic connected graph
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

% an unconnected graph
in(arcs(rg_hummus),arc(c(0),a(0))).
in(arcs(rg_hummus),arc(a(0),c(1))).
%
in(arcs(rg_hummus),arc(c(1),a(1))).
%
in(arcs(rg_hummus),arc(a(1),c(0))).
%%
cyclic(rg_hummus).

#show cyclic/1.
