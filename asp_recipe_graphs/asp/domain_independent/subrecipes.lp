%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ASP Part Implementation of Section 5 of 
% "A Graphical Formalism for Commonsense Reasoning with Recipes",
% by Antonis Bikakis , Aissatou Diallo , Luke Dickens, Anthony Hunter, Rob Miller

% to run, also requires
%     type_hierarchies.lp   (i.e. code for Section 2)
%     graph_properties.lp, recipe_graphs.lp    (i.e. code for Section 3)
% does not appear to require
%     acceptability.lp     (i.e. code for Section 4)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition 5 of a subrecipe:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of definition of a subrecipe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

