%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% From Section 2 of paper:
% Type hierarchies
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

% mathematically "comparable"
same_type_path(T1,T2) :- subtype_or_equal(T1,T2).   
same_type_path(T1,T2) :- subtype_or_equal(T2,T1).

type_of(TF, V, T) :- given_type_of(TF, V, T).

