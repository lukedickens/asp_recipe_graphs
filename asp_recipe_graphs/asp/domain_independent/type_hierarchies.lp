%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ASP Implementation of Section 2 of 
% "A Graphical Formalism for Commonsense Reasoning with Recipes",
% by Antonis Bikakis , Aissatou Diallo , Luke Dickens, Anthony Hunter, Rob Miller

% Version 0.1

% last updated: 17/5/2023

% run with the command: 
% clingo 0 GraphRecipesExcludingSections76543.lp [list of domain specific files]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Section 2 of paper, Type hierarchies
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

action_type("action").
action_type(A) :- 
    child(A,A1), 
    action_type(A1).

comestible_type("comestible").
comestible_type(C) :- 
    child(C,C1), 
    comestible_type(C1).
    
action_or_comestible_type(T) :-
    action_type(T).
action_or_comestible_type(T) :-
    comestible_type(T).

subtype(Ts,T) :- child(Ts,T).
subtype(Ts,T1) :- child(Ts,T2), 
                  subtype(T2,T1).
subtype_or_equal(Ts,T) :- subtype(Ts,T).
subtype_or_equal(T,T) :- action_type(T).
subtype_or_equal(T,T) :- comestible_type(T).

same_type_path(T1,T2) :- subtype_or_equal(T1,T2).   % mathematically "comparable"
same_type_path(T1,T2) :- subtype_or_equal(T2,T1).


