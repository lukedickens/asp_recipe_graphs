%%WARNING: Code in this file is not currently fully tested

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition of composition of recipes:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set_of(mid(RG),RG) :- recipe_graph(RG).
set_of(in(RG),RG) :- recipe_graph(RG).
set_of(out(RG),RG) :- recipe_graph(RG).
set_of(acts(RG),RG) :- recipe_graph(RG).

-join_types_match(TF1,out(RG1),TF2,in(RG2)) :-
    in(out(RG1),c(N)),
    in(in(RG2),c(N)),
    type_of(TF1,c(N),T1),
    type_of(TF2,c(N),T2),
    T1 != T2.    
join_types_match(TF1,out(RG1),TF2,in(RG2)) :-
    recipe(RG1,TF1),
    recipe(RG2,TF2),
    -empty_intersection(out(RG1),in(RG2)),
    not -join_types_match(TF1,out(RG1),TF2,in(RG2)).
    
% This fixes a bug in Definition 11 of the paper:
incompatible_node_types(RG1,TF1,RG2,TF2) :-
    in(c_nodes(RG1),N1),
    in(c_nodes(RG2),N2),
    N1 != N2,
    type_of(TF1,N1,T1),
    type_of(TF2,N2,T2),
    same_type_path(T1,T2).
-incompatible_node_types(RG1,TF1,RG2,TF2) :-
    recipe(RG1,TF1),
    recipe(RG2,TF2),
    not incompatible_node_types(RG1,TF1,RG2,TF2).

-empty_intersection(S1,S2) :-
    set_of(S1,RG1),
    set_of(S2,RG2),
    in(S1,X),
    in(S2,X).
empty_intersection(S1,S2) :- 
    set_of(S1,RG1),
    set_of(S2,RG2),
    not -empty_intersection(S1,S2).

composable(RG1,TF1,RG2,TF2) :-
    recipe(RG1,TF1),
    recipe(RG2,TF2),
    -empty_intersection(out(RG1),in(RG2)),      % condition (1) in definition
    empty_intersection(mid(RG1),mid(RG2)),      % condition (2) in definition
    empty_intersection(acts(RG1),acts(RG2)),    % condition (3) in definition
    empty_intersection(out(RG2),in(RG1)),       % condition (4) in definition
    join_types_match(TF1,out(RG1),TF2,in(RG2)), % condition (5) in definition
    -incompatible_node_types(RG1,TF1,RG2,TF2).  % condition (6) in definition (fixed)
    
% Define "composition(RG1,TF1,RG2,TF2,RGc,TFc)" by constraints, so
% that ASP can find both compositions and decompositions of recipes:

composition(RG1,TF1,RG2,TF2,RGc,TFc) | -composition(RG1,TF1,RG2,TF2,RGc,TFc) :-
    recipe(RG1,TF1),
    recipe(RG2,TF2),
    recipe(RGc,TFc).
    
:- composition(RG1,TF1,RG2,TF2,RGc,TFc), not composable(RG1,TF1,RG2,TF2).
:- in(arcs(RGc),A), not in(arcs(RG1),A), not in(arcs(RG2),A), 
   composition(RG1,TF1,RG2,TF2,RGc,TFc). 
:- in(nodes(RGc),N), not in(nodes(RG1),N), not in(nodes(RG2),N), 
   composition(RG1,TF1,RG2,TF2,RGc,TFc).  
:- not in(arcs(RGc),A), in(arcs(RG1),A), composition(RG1,TF1,RG2,TF2,RGc,TFc). 
:- not in(arcs(RGc),A), in(arcs(RG2),A), composition(RG1,TF1,RG2,TF2,RGc,TFc). 
:- not in(nodes(RGc),N), in(nodes(RG1),N), composition(RG1,TF1,RG2,TF2,RGc,TFc). 
:- not in(nodes(RGc),N), in(nodes(RG2),N), composition(RG1,TF1,RG2,TF2,RGc,TFc). 
:- type_of(TFc,N,Tc), type_of(TF1,N,T1), Tc != T1, composition(RG1,TF1,RG2,TF2,RGc,TFc).
:- type_of(TFc,N,Tc), type_of(TF2,N,T2), Tc != T2, composition(RG1,TF1,RG2,TF2,RGc,TFc).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of definition of composition of recipes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
