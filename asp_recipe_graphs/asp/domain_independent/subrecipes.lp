%%WARNING: Code in this file is not currently fully tested

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Used in subrecipes Defn. 5 of paper
% strict subrecipe graphs are in the body of
% high_indexes_allowed (defined here).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-subrecipe_graph_of(RG1,RG2) :-           % the first argument is the  
    recipe_graph(RG2),                    % subrecipe graph
    in(arcs(RG1),Arc), 
    not in(arcs(RG2),Arc).
subrecipe_graph_of(RG1,RG2) :-
    recipe_graph(RG1),
    recipe_graph(RG2),
    not -subrecipe_graph_of(RG1,RG2).
strict_subrecipe_graph(RG) :-              % need this for the constraints
    subrecipe_graph_of(RG,RG2),            % in lines 171-191
    in(arcs(RG2),Arc),
    not in(arcs(RG),Arc).
-strict_subrecipe_graph(RG) :- 
    recipe_graph(RG),
    not strict_subrecipe_graph(RG).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition 5 of a subrecipe:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-subrecipe_of(RG1,TF1,RG2,TF2) :-          % the first two arguments  
    recipe(RG1,TF1),                       % are the subrecipe
    recipe(RG2,TF2),
    -subrecipe_graph_of(RG1,RG2).
-subrecipe_of(RG1,TF1,RG2,TF2) :- 
    recipe(RG1,TF1),
    recipe(RG2,TF2),
    type_of(TF1,N,T1),
    type_of(TF2,N,T2),
    T1 != T2.
subrecipe_of(RG1,TF1,RG2,TF2) :- 
    recipe(RG1,TF1),
    recipe(RG2,TF2),
    not -subrecipe_of(RG1,TF1,RG2,TF2).

high_indexes_allowed(RG) :- strict_subrecipe_graph(RG).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of definition of a subrecipe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

