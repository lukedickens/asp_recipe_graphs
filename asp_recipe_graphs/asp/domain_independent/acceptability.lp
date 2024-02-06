% Sufficient and necessary conditions for outputs
match_for_output(Questionable, Good, AType, CType) :-
    good_comestible_position_in_output_tuple(Good,AType,CType,M1),
    questionable_comestible_position_in_output_tuple(Questionable,AType,CType,M2).

-sufficient_match_output(Questionable, Good) :-
    questionable_comestible_position_in_output_tuple(Questionable, AType, CType2, M1),
    good_comestible_position_in_output_tuple(Good, AType, CType, M2),
    not match_for_output(Questionable, Good, AType, CType).

-necessary_match_output(Questionable, Good) :-
    good_comestible_position_in_output_tuple(Good, AType, CType2, M2),
    questionable_comestible_position_in_output_tuple(Questionable, AType, CType, M1),
    not match_for_output(Questionable, Good, AType, CType).

sufficient_match_output(Questionable, Good) :-
    good_comestible_position_in_output_tuple(Good, AType, CType1, M1),
    questionable_comestible_position_in_output_tuple(Questionable, AType, CType2, M2),
    not -sufficient_match_output(Questionable, Good).

necessary_match_output(Questionable, Good) :-
    good_comestible_position_in_output_tuple(Good, AType, CType1, M1),
    questionable_comestible_position_in_output_tuple(Questionable, AType, CType2, M2),
    not -necessary_match_output(Questionable, Good).

% Sufficient and necessary conditions for inputs
match_for_input(Questionable, Good, AType, CType) :-
    good_comestible_position_in_input_tuple(Good,AType,CType,M1),
    questionable_comestible_position_in_input_tuple(Questionable,AType,CType,M2).

-sufficient_match_input(Questionable, Good) :-
    questionable_comestible_position_in_input_tuple(Questionable, AType, CType2, M1),
    good_comestible_position_in_input_tuple(Good, AType, CType, M2),
    not match_for_input(Questionable, Good, AType, CType).

-necessary_match_input(Questionable, Good) :-
    good_comestible_position_in_input_tuple(Good, AType, CType2, M2),
    questionable_comestible_position_in_input_tuple(Questionable, AType, CType, M1),
    not match_for_input(Questionable, Good, AType, CType).

sufficient_match_input(Questionable, Good) :-
    good_comestible_position_in_input_tuple(Good, AType, CType1, M1),
    questionable_comestible_position_in_input_tuple(Questionable, AType, CType2, M2),
    not -sufficient_match_input(Questionable, Good).

necessary_match_input(Questionable, Good) :-
    good_comestible_position_in_input_tuple(Good, AType, CType1, M1),
    questionable_comestible_position_in_input_tuple(Questionable, AType, CType2, M2),
    not -necessary_match_input(Questionable, Good).

% Sufficient and necessary condition for both inputs and outputs
acceptable_node(Questionable) :-
    sufficient_match_input(Questionable, Good),
    necessary_match_input(Questionable, Good),
    sufficient_match_output(Questionable, Good),
    necessary_match_output(Questionable, Good).

-acceptable_node(Questionable) :-
    questionable_comestible_position_in_input_tuple(Questionable, AType, CType2, M2),
    not acceptable_node(Questionable).

#show acceptable_node/1.
#show -acceptable_node/1.