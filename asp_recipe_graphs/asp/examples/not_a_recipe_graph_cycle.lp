%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% based on example recipe graph:
% rg_spaghetti_pomodoro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

given_recipe_graph(rg_spaghetti_pomodoro).
% boil spaghetti
in(arcs(rg_spaghetti_pomodoro),arc(c(0),a(0))).
in(arcs(rg_spaghetti_pomodoro),arc(c(1),a(0))).
in(arcs(rg_spaghetti_pomodoro),arc(a(0),c(2))).
% mix pasata with onions
in(arcs(rg_spaghetti_pomodoro),arc(c(3),a(1))).
in(arcs(rg_spaghetti_pomodoro),arc(c(4),a(1))).
in(arcs(rg_spaghetti_pomodoro),arc(a(1),c(5))).
% drain spaghetti
in(arcs(rg_spaghetti_pomodoro),arc(c(2),a(2))).
in(arcs(rg_spaghetti_pomodoro),arc(a(2),c(6))).
in(arcs(rg_spaghetti_pomodoro),arc(a(2),c(7))).
%% put in bowl
in(arcs(rg_spaghetti_pomodoro),arc(c(7),a(3))).
in(arcs(rg_spaghetti_pomodoro),arc(a(3),c(8))).
% mix in bowl
in(arcs(rg_spaghetti_pomodoro),arc(c(5),a(4))).
in(arcs(rg_spaghetti_pomodoro),arc(c(8),a(4))).
in(arcs(rg_spaghetti_pomodoro),arc(a(4),c(9))).

% erroneous connection causing cycle
% deliberately included for illustration
in(arcs(rg_spaghetti_pomodoro),arc(c(9),a(1))).

