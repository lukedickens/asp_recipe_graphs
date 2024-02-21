% Define a type substitution in terms of a new type function and a primary substitution set.
recipe(RG,PartSpecTF) :-
    given_recipe(RG,TF),
    type_substitution(RG,TF,PartSpecTF).
    
type_of(PartSpecTF,Node,NewType) :-
    recipe(RG,PartSpecTF),
    primary_substitution((RG,TF,PartSpecTF),Node,NewType).
:- -valid_recipe(RG,PartSpecTF), type_substitution(RG,TF,PartSpecTF), given_recipe(RG,TF).

#maximize{ 1,X : 
    type_of(TF,X,Y),
    type_of(PartSpecTF,X,Y),
    given_recipe(RG,TF),
    type_substitution(RG,TF,PartSpecTF)}.

secondary_substitution((RG,TF,PartSpecTF),Node,NewType) :-
    given_recipe(RG,TF),
    type_substitution(RG, TF, PartSpecTF),
    valid_recipe(RG,PartSpecTF),
    not primary_substitution((RG, TF, PartSpecTF), Node, NewType),
    type_of(TF,Node,Type),
    type_of(PartSpecTF,Node,NewType),
    NewType != Type.

% domain specific
type_substitution(rg_spaghetti_pomodoro,tf_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub).
primary_substitution((rg_spaghetti_pomodoro,tf_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub),c(1),"uncooked fusilli").


