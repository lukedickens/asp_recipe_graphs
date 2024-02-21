% INPUT: Spaghetti Pomodoro (rg_spaghetti_pomodoro,tf_spaghetti_pomodoro)
% Acceptability tuples from Fusilli Pomodoro
% Primary Type Substitution
%
% tf_spaghetti_pomodoro_sub maps the nodes in rg_spaghetti_pomodoro
% (that tf_spaghetti_pomodoro maps to uncooked spaghetti) to uncooked fusilli

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
    recipe(RG,PartSpecTF),
    not primary_substitution((RG, TF, PartSpecTF), Node, NewType),
    type_of(TF,Node,Type),
    type_of(PartSpecTF,Node,NewType),
    NewType != Type.

% domain specific
%recipe(rg_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub).
%type_of(tf_spaghetti_pomodoro_sub,c(1),"uncooked fusilli").
%:- -valid_recipe(rg_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub).
type_substitution(rg_spaghetti_pomodoro,tf_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub).
primary_substitution((rg_spaghetti_pomodoro,tf_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub),c(1),"uncooked fusilli").

%#maximize{ 1,X : type_of(tf_spaghetti_pomodoro,X,Y), type_of(tf_spaghetti_pomodoro_sub,X,Y) }.


