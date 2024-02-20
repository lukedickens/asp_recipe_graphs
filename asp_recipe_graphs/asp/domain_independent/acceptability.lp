% Sufficient and necessary conditions for outputs
match_for_output(Candidate, Valid, AType, CType) :-
    valid_output_element(Valid,AType,CType,M1),
    candidate_output_element(Candidate,AType,CType,M2).

-sufficient_match_output(Candidate, Valid) :-
    candidate_output_element(Candidate, AType, CType2, M1),
    valid_output_element(Valid, AType, CType, M2),
    not match_for_output(Candidate, Valid, AType, CType).

-necessary_match_output(Candidate, Valid) :-
    valid_output_element(Valid, AType, CType2, M2),
    candidate_output_element(Candidate, AType, CType, M1),
    not match_for_output(Candidate, Valid, AType, CType).

sufficient_match_output(Candidate, Valid) :-
    valid_output_element(Valid, AType, CType1, M1),
    candidate_output_element(Candidate, AType, CType2, M2),
    not -sufficient_match_output(Candidate, Valid).

necessary_match_output(Candidate, Valid) :-
    valid_output_element(Valid, AType, CType1, M1),
    candidate_output_element(Candidate, AType, CType2, M2),
    not -necessary_match_output(Candidate, Valid).

% Sufficient and necessary conditions for inputs
match_for_input(Candidate, Valid, AType, CType) :-
    valid_input_element(Valid,AType,CType,M1),
    candidate_input_element(Candidate,AType,CType,M2).

-sufficient_match_input(Candidate, Valid) :-
    candidate_input_element(Candidate, AType, CType2, M1),
    valid_input_element(Valid, AType, CType, M2),
    not match_for_input(Candidate, Valid, AType, CType).

-necessary_match_input(Candidate, Valid) :-
    valid_input_element(Valid, AType, CType2, M2),
    candidate_input_element(Candidate, AType, CType, M1),
    not match_for_input(Candidate, Valid, AType, CType).

sufficient_match_input(Candidate, Valid) :-
    valid_input_element(Valid, AType, CType1, M1),
    candidate_input_element(Candidate, AType, CType2, M2),
    not -sufficient_match_input(Candidate, Valid).

necessary_match_input(Candidate, Valid) :-
    valid_input_element(Valid, AType, CType1, M1),
    candidate_input_element(Candidate, AType, CType2, M2),
    not -necessary_match_input(Candidate, Valid).

% Sufficient and necessary condition for both inputs and outputs
acceptable_node(Candidate) :-
    sufficient_match_input(Candidate, Valid),
    necessary_match_input(Candidate, Valid),
    sufficient_match_output(Candidate, Valid),
    necessary_match_output(Candidate, Valid).

-acceptable_node(Candidate) :-
    candidate_input_element(Candidate, AType, CType2, M2),
    not acceptable_node(Candidate).

#show acceptable_node/1.
#show -acceptable_node/1.
