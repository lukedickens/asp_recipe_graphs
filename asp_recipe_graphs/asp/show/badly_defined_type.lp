isolated_type(UsedType) :-
    type_of(Graph, NodeID, UsedType),
    not same_type_path(UsedType, "action"),
    not same_type_path(UsedType, "comestible").

conflicted_type(UsedType) :-
    type_of(Graph, NodeID, UsedType),
    same_type_path(UsedType, "action"),
    same_type_path(UsedType, "comestible").


#show isolated_type/1.
#show conflicted_type/1.


