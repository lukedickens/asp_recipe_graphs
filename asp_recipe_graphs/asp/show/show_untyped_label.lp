untyped_label(Type) :-
    type_of(TF,V,Type),
    not action_or_comestible_type(Type).
    
#show untyped_label/1.
