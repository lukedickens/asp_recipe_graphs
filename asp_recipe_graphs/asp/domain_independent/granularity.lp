%%WARNING: Code in this file is not currently fully tested

% extra definition of "≤" ("path_or_equal") for use in the original Definition 8 below:
path_or_equal(RG,N1,N2) :- 
    path(RG,N1,N2).
path_or_equal(RG,N,N) :- 
    in(nodes(RG),N).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Original (but fixed) definition 8 of finer-grained:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

finer_grained(RG1,TF1,RG2,TF2) | -finer_grained(RG1,TF1,RG2,TF2) :- 
    recipe(RG1,TF1), 
    recipe(RG2,TF2).
finer_grained(RG,TF,RG,TF) :- recipe(RG,TF).

-finer_grained(RG1,TF1,RG2,TF2) :-
    -in_out_aligned(RG1,TF1,RG2,TF2).
    
% we don't want to bother to generate a g_function from a recipe to itself,
% so define a "not_same_recipe" predicate to expres this:
not_same_recipe(RG1,TF1,RG2,TF2) :-
    recipe(RG1,TF1), 
    recipe(RG2,TF2),
    RG1 != RG2.
not_same_recipe(RG1,TF1,RG2,TF2) :-
    recipe(RG1,TF1), 
    recipe(RG2,TF2),
    TF1 != TF2.   
    
1 {g_function(RG1,TF1,RG2,TF2,N1,N2) : in(nodes(RG2),N2)} 1 :-
    not_same_recipe(RG1,TF1,RG2,TF2),
    finer_grained(RG1,TF1,RG2,TF2),
    in(nodes(RG1),N1).

% the g function is an order preserving map:     
:- g_function(RG1,TF1,RG2,TF2,N1,N2), g_function(RG1,TF1,RG2,TF2,N11,N22),
   path_or_equal(RG1,N1,N11), not path_or_equal(RG2,N2,N22).
   
% the g function is onto:
mapped_to_by_g_function(RG1,TF1,RG2,TF2,N2) :-
    g_function(RG1,TF1,RG2,TF2,N1,N2).
:- finer_grained(RG1,TF1,RG2,TF2), in(nodes(RG2),N2),
   not mapped_to_by_g_function(RG1,TF1,RG2,TF2,N2).
   
% this next rule is not in the definition but is perhaps reasonable.
% the g function must map each in and out node to it's same type:
:- g_function(RG1,TF1,RG2,TF2,N1,N2), in(in(RG1),N1), 
   type_of(TF1,N1,T1), type_of(TF2,N2,T2), T1 != T2.
:- g_function(RG1,TF1,RG2,TF2,N1,N2), in(out(RG1),N1), 
   type_of(TF1,N1,T1), type_of(TF2,N2,T2), T1 != T2.
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of original definition of finer-grained
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Alternative definition 8 of finer-grained:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% we need the following clause for computational reasons related to grounding, see e.g.
%% stackoverflow.com/questions/74715495/calculating-the-distance-between-two-nodes-in-a-directed-graph
%number_of_action_nodes(RG,NAN) :- 
%    NAN = #count{N : in(a_nodes(RG),N)},
%    recipe_graph(RG).
%    
%% ASIDE: a very simple definition of "finer-grained" could just use the above
%% definition to check that, given two in-out-aligned recipes, the finer grained
%% one had more action nodes.
%
%% The idea here is that in the finer grained recipe, at least one of the paths
%% from an ingredient to a product has to be longer than in the equivalent path
%% in the other recipe, and there should be no such paths that are shorter. 
%
%path_with_half_length(RG,c(N1),c(N2),1) :- 
%    in(arcs(RG),arc(c(N1),a(N))),
%    in(arcs(RG),arc(a(N),c(N2))).
%path_with_half_length(RG,c(N1),c(N3),L+1) :- 
%    path_with_half_length(RG,c(N1),c(N2),L),
%    number_of_action_nodes(RG,NAN),
%    L<NAN, 
%    in(arcs(RG),arc(c(N2),a(N))),
%    in(arcs(RG),arc(a(N),c(N3))).
%    
%-finer_grained(RG1,TF1,RG2,TF2) :-
%    -in_out_aligned(RG1,TF1,RG2,TF2).
%    
%-finer_grained(RG1,TF1,RG2,TF2) :-
%    recipe(RG1,TF1),
%    recipe(RG2,TF2),
%    in(in(RG1),c(N1in)),
%    in(in(RG2),c(N2in)),
%    in(out(RG1),c(N1out)),
%    in(out(RG2),c(N2out)),
%    type_of(TF1,c(N1in),Tin),
%    type_of(TF2,c(N2in),Tin),
%    type_of(TF1,c(N1out),Tout),
%    type_of(TF2,c(N2out),Tout),
%    path_with_half_length(RG1,c(N1in),c(N1out),L1),
%    path_with_half_length(RG2,c(N2in),c(N2out),L2),
%    L1<L2.
%    
%one_path_longer(RG1,TF1,RG2,TF2) :-
%    recipe(RG1,TF1),
%    recipe(RG2,TF2),
%    in(in(RG1),c(N1in)),
%    in(in(RG2),c(N2in)),
%    in(out(RG1),c(N1out)),
%    in(out(RG2),c(N2out)),
%    type_of(TF1,c(N1in),Tin),
%    type_of(TF2,c(N2in),Tin),
%    type_of(TF1,c(N1out),Tout),
%    type_of(TF2,c(N2out),Tout),
%    path_with_half_length(RG1,c(N1in),c(N1out),L1),
%    path_with_half_length(RG2,c(N2in),c(N2out),L2),
%    L2<L1.
%  
%-finer_grained(RG1,TF1,RG2,TF2) :-
%    recipe(RG1,TF1),
%    recipe(RG2,TF2),
%    not one_path_longer(RG1,TF1,RG2,TF2).
%    
%finer_grained(RG1,TF1,RG2,TF2) :-
%    recipe(RG1,TF1),
%    recipe(RG2,TF2),
%    not -finer_grained(RG1,TF1,RG2,TF2).  
%
% NOTE: with SnacksOnToastExample.lp time taken to find one answer set:    
% 429.592s (Solving: 0.00s 1st Model: 0.00s Unsat: 0.00s)
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of alternative definition of finer-grained
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition 8 of more specific recipes:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

more_specific(RG1,TF1,RG2,TF2) | -more_specific(RG1,TF1,RG2,TF2) :- 
    recipe(RG1,TF1), 
    recipe(RG2,TF2).
more_specific(RG,TF,RG,TF) :- recipe(RG,TF).

:- more_specific(RG1,TF1,RG2,TF2), -isomorphic(RG1,RG2).
:- more_specific(RG1,TF1,RG2,TF2), bijection(RG1,RG2,c(N1),c(N2)),
   type_of(TF1,c(N1),T1), type_of(TF2,c(N2),T2), not subtype_or_equal(T1,T2).
:- more_specific(RG1,TF1,RG2,TF2), bijection(RG1,RG2,a(N1),a(N2)),
   type_of(TF1,a(N1),T1), type_of(TF2,a(N2),T2), not subtype_or_equal(T1,T2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of definition of equivalent recipes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
