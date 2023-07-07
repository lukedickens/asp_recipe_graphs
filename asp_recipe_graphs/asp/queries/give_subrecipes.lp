%
recipe(subgraph, subtyping_function).

% this says that if there are two recipes in the domain then one must be
% a subrecipe of the other
subrecipe_comparable(RG1, TF1, RG2, TF2) :-
    subrecipe_of(RG1, TF1, RG2, TF2).
subrecipe_comparable(RG1, TF1, RG2, TF2) :-
    subrecipe_of(RG2, TF2, RG1, TF1).
:- recipe(RG1, TF1), recipe(RG2, TF2), 
    not subrecipe_comparable(RG1, TF1, RG2, TF2).


#show subrecipe_of/4.
