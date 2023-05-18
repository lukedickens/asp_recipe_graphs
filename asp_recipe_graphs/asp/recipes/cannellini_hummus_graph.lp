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
#const max_c_node_index=11.
% Similarly for action nodes:
#const max_a_node_index=5.

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
% draining beans
in(arcs(rg_cannellini_hummus),arc(c(10),a(5))).
in(arcs(rg_cannellini_hummus),arc(a(5),c(11))).
% blending beans
in(arcs(rg_cannellini_hummus),arc(c(12),a(6))).
in(arcs(rg_cannellini_hummus),arc(a(6),c(13))).
%% blending in herbs
in(arcs(rg_cannellini_hummus),arc(c(5),a(7))).
in(arcs(rg_cannellini_hummus),arc(c(7),a(7))).
in(arcs(rg_cannellini_hummus),arc(c(9),a(7))).
in(arcs(rg_cannellini_hummus),arc(c(13),a(7))).
in(arcs(rg_cannellini_hummus),arc(a(7),c(14))).
% blending in garlic
in(arcs(rg_cannellini_hummus),arc(c(3),a(8))).
in(arcs(rg_cannellini_hummus),arc(c(14),a(8))).
in(arcs(rg_cannellini_hummus),arc(a(8),c(15))).
% chopping tomatoes
in(arcs(rg_cannellini_hummus),arc(c(8),a(9))).
in(arcs(rg_cannellini_hummus),arc(a(9),c(9))).
% blending in garlic
in(arcs(rg_cannellini_hummus),arc(c(3),a(7))).
in(arcs(rg_cannellini_hummus),arc(c(14),a(7))).
in(arcs(rg_cannellini_hummus),arc(a(7),c(15))).

