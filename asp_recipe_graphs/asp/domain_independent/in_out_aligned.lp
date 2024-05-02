%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition 7: in-out aligned recipes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% this definition checks that the types of the in and out 
% nodes are the same
in(in_types(RG,TF),T) :-
    recipe(RG,TF),
    in(in(RG),c(N)),
    type_of(TF,c(N),T).
in(out_types(RG,TF),T) :-
    recipe(RG,TF),
    in(out(RG),c(N)),
    type_of(TF,c(N),T).
-in_out_aligned(RG1,TF1,RG2,TF2) :-
    recipe(RG1,TF1),
    recipe(RG2,TF2),
    in(in_types(RG1,TF1),T),
    not in(in_types(RG2,TF2),T).
-in_out_aligned(RG1,TF1,RG2,TF2) :-
    recipe(RG1,TF1),
    recipe(RG2,TF2),
    not in(in_types(RG1,TF1),T),
    in(in_types(RG2,TF2),T).
-in_out_aligned(RG1,TF1,RG2,TF2) :-
    recipe(RG1,TF1),
    recipe(RG2,TF2),
    in(out_types(RG1,TF1),T),
    not in(out_types(RG2,TF2),T).
-in_out_aligned(RG1,TF1,RG2,TF2) :-
    recipe(RG1,TF1),
    recipe(RG2,TF2),
    not in(out_types(RG1,TF1),T),
    in(out_types(RG2,TF2),T).
in_out_aligned(RG1,TF1,RG2,TF2) :-
   recipe(RG1,TF1),
   recipe(RG2,TF2),
   not -in_out_aligned(RG1,TF1,RG2,TF2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of definition: in-out aligned recipes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
