#show candidate_acceptability_tuple/1.
#show valid_acceptability_tuple(Key) :
    valid_acceptability_tuple(Key),
    candidate_acceptability_tuple(Key).
#show -valid_acceptability_tuple(Key) : 
    -valid_acceptability_tuple(Key),
    candidate_acceptability_tuple(Key).
#show action_element(Key, AType) :
    action_element(Key, AType),
    valid_acceptability_tuple(Key),
    candidate_acceptability_tuple(Key).
#show input_element_position(Key, CType, M) :
    input_element_position(Key, CType, M),
    valid_acceptability_tuple(Key),
    candidate_acceptability_tuple(Key).
#show output_element_position(Key, CType, M) :
    output_element_position(Key, CType, M),
    valid_acceptability_tuple(Key),
    candidate_acceptability_tuple(Key).



