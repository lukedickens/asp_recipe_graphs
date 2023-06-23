%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% BUTTERED TOAST

% Domain specific recipe data file to be run with "GraphRecipesSection*.lp"

% This file contains the atomic recipe (rg1,tf1). It's for initial testing of
% the new definition of acceptability_tuple using sets of input and output
% comestibles

% Version 0.1

% last updated: 2/6/2023

% run with the command "clingo 0 GraphRecipesSection* ButteredToastExample.lp"
% or with the command "clingo 1 GraphRecipesSection* ButteredToastExample.lp"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The size of the universal sets of comestible and action nodes for this example:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (max_c_node_index + 1) is the maximum number of 
% comestible nodes allowed in a recipe graph.
% Change this according to your needs:
#const max_c_node_index=4.
% Similarly for action nodes:
#const max_a_node_index=4.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The type hierarchies for this example:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

child("put", "action").
child("spread", "put").
child("spread on toast", "spread").

child("toast", "comestible").
child("butter", "comestible").
child("plain toast", "toast").
child("buttered toast", "toast").


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The acceptability tuple for this example:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%acceptability_tuple(s_("butter",s_("plain toast",s_0)),
%                    "spread on toast",
%                    s_("buttered toast",s_0)).

% alternatively, sate that it's a "given recipe":

%given_recipe(rg1,tf1).   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example recipe graph (buttered toast):
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

recipe_graph(rg1).            
in(arcs(rg1),arc(c(0),a(0))).   
in(arcs(rg1),arc(c(1),a(0))).  
in(arcs(rg1),arc(a(0),c(2))). 
                            

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example recipe (buttered toast):
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

recipe(rg1,tf1).
type_of(tf1,c(0),"butter").
type_of(tf1,c(1),"plain toast").
type_of(tf1,c(2),"buttered toast").
type_of(tf1,a(0),"spread on toast").

% Extra predicate and #show directive to display recipe(rg1,tf1):

rg1_arc((N1,T1),(N2,T2)) :- 
    in(arcs(rg1),arc(N1,N2)),
    type_of(tf1,N1,T1),
    type_of(tf1,N2,T2).
#show rg1_arc/2.
#show -acceptable_recipe/2.
#show acceptable_recipe/2.
%#show partial_inset/4.
%#show -in_partial_inset/5.
%#show input_set/4.
%#show output_set/4.
#show acceptability_tuple/3.
