%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% HUMMUS Recipe Graph

% run with the command "clingo 0 RecipeGraphs.lp Recipes.lp example_recipes/HummusGraph.lp <query>.lp"
% or with the command "clingo 1 RecipeGraphs.lp Recipes.lp example_recipes/HummusGraph.lp <query>.lp"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The size of the universal sets of comestible and action nodes for these examples:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (max_c_node_index + 1) is the maximum number of 
% comestible nodes allowed in a recipe graph.
% Change this according to your needs:
#const max_c_node_index=17.
% Similarly for action nodes:
#const max_a_node_index=10.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe graph: hummus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% roasting garlic
in(arcs(rg_cannellini_hummus),arc(c(0),a(0))).
in(arcs(rg_cannellini_hummus),arc(c(1),a(0))).
in(arcs(rg_cannellini_hummus),arc(c(2),a(0))).
in(arcs(rg_cannellini_hummus),arc(a(0),c(3))).
% chopping thyme
in(arcs(rg_cannellini_hummus),arc(c(4),a(1))).
in(arcs(rg_cannellini_hummus),arc(a(1),c(5))).
% chopping rosemary
in(arcs(rg_cannellini_hummus),arc(c(6),a(2))).
in(arcs(rg_cannellini_hummus),arc(a(2),c(7))).
% chopping sage
in(arcs(rg_cannellini_hummus),arc(c(8),a(3))).
in(arcs(rg_cannellini_hummus),arc(a(3),c(9))).
% infusing
in(arcs(rg_cannellini_hummus),arc(c(1),a(4))).
in(arcs(rg_cannellini_hummus),arc(c(5),a(4))).
in(arcs(rg_cannellini_hummus),arc(c(7),a(4))).
in(arcs(rg_cannellini_hummus),arc(c(9),a(4))).
in(arcs(rg_cannellini_hummus),arc(a(4),c(10))).
% draining beans
in(arcs(rg_cannellini_hummus),arc(c(11),a(5))).
in(arcs(rg_cannellini_hummus),arc(a(5),c(12))).
% blending beans
in(arcs(rg_cannellini_hummus),arc(c(12),a(6))).
in(arcs(rg_cannellini_hummus),arc(a(6),c(13))).
%% blending in herbs
in(arcs(rg_cannellini_hummus),arc(c(10),a(7))).
in(arcs(rg_cannellini_hummus),arc(c(13),a(7))).
in(arcs(rg_cannellini_hummus),arc(a(7),c(14))).
% blending in garlic
in(arcs(rg_cannellini_hummus),arc(c(3),a(8))).
in(arcs(rg_cannellini_hummus),arc(c(14),a(8))).
in(arcs(rg_cannellini_hummus),arc(a(8),c(15))).
% chopping tomatoes
in(arcs(rg_cannellini_hummus),arc(c(16),a(9))).
in(arcs(rg_cannellini_hummus),arc(a(9),c(17))).
% blending in tomatoes
in(arcs(rg_cannellini_hummus),arc(c(15),a(10))).
in(arcs(rg_cannellini_hummus),arc(c(17),a(10))).
in(arcs(rg_cannellini_hummus),arc(a(10),c(18))).

graph(rg_cannellini_hummus).
