poorly_typed_node(TF,a(N),Type) :-
    type_of(TF,a(N),Type),
    not action_type(Type).

poorly_typed_node(TF,c(N),Type) :-
    type_of(TF,c(N),Type),
    not comestible_type(Type).
    
#show poorly_typed_node/3.
