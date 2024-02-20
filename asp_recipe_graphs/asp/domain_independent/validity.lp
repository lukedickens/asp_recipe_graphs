% actions match
match_for_action(Candidate,Valid,AType) :-
    valid_action_element(Valid,AType),
    candidate_action_element(Candidate,AType).

% Sufficient and necessary conditions for outputs
match_for_output(Candidate,Valid,CType) :-
    valid_output_element(Valid,CType,M1),
    candidate_output_element(Candidate,CType,M2).

-sufficient_match_output(Candidate,Valid) :-
    candidate_output_element(Candidate,CType2,M1),
    valid_output_element(Valid,CType,M2),
    not match_for_output(Candidate,Valid,CType).

-necessary_match_output(Candidate,Valid) :-
    valid_output_element(Valid,CType2,M2),
    candidate_output_element(Candidate,CType,M1),
    not match_for_output(Candidate,Valid,CType).

sufficient_match_output(Candidate,Valid) :-
    valid_output_element(Valid,CType1,M1),
    candidate_output_element(Candidate,CType2,M2),
    not -sufficient_match_output(Candidate,Valid).

necessary_match_output(Candidate,Valid) :-
    valid_output_element(Valid,CType1,M1),
    candidate_output_element(Candidate,CType2,M2),
    not -necessary_match_output(Candidate,Valid).

% Sufficient and necessary conditions for inputs
match_for_input(Candidate,Valid,CType) :-
    valid_input_element(Valid,CType,M1),
    candidate_input_element(Candidate,CType,M2).

-sufficient_match_input(Candidate,Valid) :-
    candidate_input_element(Candidate,CType2,M1),
    valid_input_element(Valid,CType,M2),
    not match_for_input(Candidate,Valid,CType).

-necessary_match_input(Candidate,Valid) :-
    valid_input_element(Valid,CType2,M2),
    candidate_input_element(Candidate,CType,M1),
    not match_for_input(Candidate,Valid,CType).

sufficient_match_input(Candidate,Valid) :-
    valid_input_element(Valid,CType1,M1),
    candidate_input_element(Candidate,CType2,M2),
    not -sufficient_match_input(Candidate,Valid).

necessary_match_input(Candidate,Valid) :-
    valid_input_element(Valid,CType1,M1),
    candidate_input_element(Candidate,CType2,M2),
    not -necessary_match_input(Candidate,Valid).
    

% Sufficient and necessary condition for both inputs and outputs
valid_candidate_tuple(Candidate) :-
    match_for_action(Candidate,Valid,AType),
    sufficient_match_input(Candidate,Valid),
    necessary_match_input(Candidate,Valid),
    sufficient_match_output(Candidate,Valid),
    necessary_match_output(Candidate,Valid).

-valid_candidate_tuple(Candidate) :-
    candidate_input_element(Candidate,CType2,M2),
    not valid_candidate_tuple(Candidate).


