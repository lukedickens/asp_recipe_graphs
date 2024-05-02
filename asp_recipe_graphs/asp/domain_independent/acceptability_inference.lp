% all given tuples are valid under any rule
valid_acceptability_tuple((Valid,AType,AType2)) :-
    valid_acceptability_tuple(Valid),
    action_element(Tuple, AType),
    action_element((Valid,AType,AType2), AType2),
    child(AType,AType2),
    sufficient_match_input((Valid,AType,AType2),Valid),
    necessary_match_input((Valid,AType,AType2),Valid),
    sufficient_match_output((Valid,AType,AType2),Valid),
    necessary_match_output((Valid,AType,AType2),Valid).

