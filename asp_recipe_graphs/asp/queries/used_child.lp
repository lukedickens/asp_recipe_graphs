used_child(Child, Parent) :-
    type_of(Graph, NodeID, UsedType),
    subtype_or_equal(UsedType, Child),
    child(Child, Parent).

#show used_child/2.


