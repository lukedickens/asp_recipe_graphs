used_ancestor(UsedType, Root) :-
    Root = "comestible",
    type_of(Graph, NodeID, UsedType),
    same_type_path(UsedType, Root).
used_ancestor(UsedType, Root) :-
    Root = "action",
    type_of(Graph, NodeID, UsedType),
    same_type_path(UsedType, Root).

#show used_ancestor/2.


