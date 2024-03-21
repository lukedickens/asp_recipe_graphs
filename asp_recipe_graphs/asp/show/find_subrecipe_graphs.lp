%
strict_subrecipe_graph(a_subgraph).
subrecipe_graph_of(a_subgraph, rg_grilled_cheese_on_toast).
%in(nodes(a_subgraph),c(0)).
%in(nodes(a_subgraph),c(1)).
%in(nodes(a_subgraph),a(0)).
%1 { subrecipe_graph_of(RG1, RG2) } 1 :-
%    recipe_graph(RG1), recipe_graph(RG2), RG1 < RG2.

% this says that if there are two recipes in the domain then one must be
% a subrecipe of the other
%subrecipe_graph_comparable(RG1, RG2) :-
%    subrecipe_graph_of(RG1, RG2).
%subrecipe_graph_comparable(RG1, RG2) :-
%    subrecipe_graph_of(RG2, RG1).
%:- recipe_graph(RG1), recipe_graph(RG2), RG1 < RG2,
%    not subrecipe_graph_of(RG1, RG2).

%1 { subrecipe_graph_of(RG1, RG2) } 1 :-
%    recipe_graph(RG1), recipe_graph(RG2), RG1 < RG2.

#show strict_subrecipe_graph/1.
#show subrecipe_graph_of/2.
#show in/2.
