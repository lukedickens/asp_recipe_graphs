% INPUT: Spaghetti Pomodoro (rg_spaghetti_pomodoro,tf_spaghetti_pomodoro)
% Acceptability tuples from Fusilli Pomodoro
% Primary Type Substitution
%
% tf_spaghetti_pomodoro_sub maps the nodes in rg_spaghetti_pomodoro
% (that tf_spaghetti_pomodoro maps to uncooked spaghetti) to uncooked fusilli

-valid_recipe(RG,TF) :-
	candidate_recipe(RG,TF),
	in(a_nodes(RG),a(N)),
	not valid_candidate_tuple((RG,TF,a(N))).

valid_recipe(RG,TF) :- candidate_recipe(RG,TF), not -valid_recipe(RG,TF).

recipe(rg_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub).
type_of(tf_spaghetti_pomodoro_sub,c(1),"uncooked fusilli").
:- -valid_recipe(rg_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub).

#maximize{ 1,X : type_of(tf_spaghetti_pomodoro,X,Y), type_of(tf_spaghetti_pomodoro_sub,X,Y) }.


