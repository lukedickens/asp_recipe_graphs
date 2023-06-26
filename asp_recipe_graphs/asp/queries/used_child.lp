used_child(Child, Parent) :-
    type_of(Graph, NodeID, UsedType),
    same_type_path(UsedType, Child),
    child(Child, Parent).

#show used_child/2.


