% INPUT: Spaghetti Pomodoro (rg_spaghetti_pomodoro,tf_spaghetti_pomodoro)
% Acceptability tuples from Fusilli Pomodoro
% Primary Type Substitution
%
% tf_spaghetti_pomodoro_sub maps the nodes in rg_spaghetti_pomodoro
% (that tf_spaghetti_pomodoro maps to uncooked spaghetti) to uncooked fusilli

-acceptable_recipe(RG,TF) :-
	questionable_recipe(RG,TF),
	in(a_nodes(RG),a(N)),
	not acceptable_node((RG,TF,a(N))).

acceptable_recipe(RG,TF) :- questionable_recipe(RG,TF), not -acceptable_recipe(RG,TF).

recipe(rg_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub).
type_of(tf_spaghetti_pomodoro_sub,c(1),"uncooked fusilli").
:- -acceptable_recipe(rg_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub).

#maximize{ 1,X : type_of(tf_spaghetti_pomodoro,X,Y), type_of(tf_spaghetti_pomodoro_sub,X,Y) }.

%#show type_of/3.
#show acceptable_recipe/2.
#show -acceptable_recipe/2.
%#show recipe/2.
