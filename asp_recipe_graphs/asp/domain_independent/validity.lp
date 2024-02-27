% a given acceptability tuple is a valid one
valid_acceptability_tuple(Given) :-
    given_acceptability_tuple(Given).

% actions match
match_for_action(Candidate,Valid) :-
    valid_acceptability_tuple(Valid),
    action_element(Valid,AType),
    candidate_acceptability_tuple(Candidate),
    action_element(Candidate,AType).

% Sufficient and necessary conditions for outputs
% Commented out lines are now possible because we can state whether the
% acceptability tuple itself is valid or candidate (rather than input or output elements)
% This commenting out speeds up code by factor of 80x
match_for_output(Candidate,Valid,CType) :-
    valid_acceptability_tuple(Valid),
    there_is_output_element_position(Valid,CType),
    candidate_acceptability_tuple(Candidate),
    there_is_output_element_position(Candidate,CType).

-sufficient_match_output(Candidate,Valid) :-
    candidate_acceptability_tuple(Candidate),
    valid_acceptability_tuple(Valid),
    there_is_output_element_position(Valid,CType),
    not match_for_output(Candidate,Valid,CType).

-necessary_match_output(Candidate,Valid) :-
    valid_acceptability_tuple(Valid),
    candidate_acceptability_tuple(Candidate),
    there_is_output_element_position(Candidate,CType),
    not match_for_output(Candidate,Valid,CType).

sufficient_match_output(Candidate,Valid) :-
    valid_acceptability_tuple(Valid),
    candidate_acceptability_tuple(Candidate),
    not -sufficient_match_output(Candidate,Valid).

necessary_match_output(Candidate,Valid) :-
    valid_acceptability_tuple(Valid),
    candidate_acceptability_tuple(Candidate),
    not -necessary_match_output(Candidate,Valid).

% Sufficient and necessary conditions for inputs
match_for_input(Candidate,Valid,CType) :-
    valid_acceptability_tuple(Valid),
    there_is_input_element_position(Valid,CType),
    candidate_acceptability_tuple(Candidate),
    there_is_input_element_position(Valid,CType).

-sufficient_match_input(Candidate,Valid) :-
    candidate_acceptability_tuple(Candidate),
    valid_acceptability_tuple(Valid),
    there_is_input_element_position(Valid,CType),
    not match_for_input(Candidate,Valid,CType).

-necessary_match_input(Candidate,Valid) :-
    valid_acceptability_tuple(Valid),
    candidate_acceptability_tuple(Candidate),
    there_is_input_element_position(Candidate,CType),
    not match_for_input(Candidate,Valid,CType).

sufficient_match_input(Candidate,Valid) :-
    valid_acceptability_tuple(Valid),
    candidate_acceptability_tuple(Candidate),
    not -sufficient_match_input(Candidate,Valid).

necessary_match_input(Candidate,Valid) :-
    valid_acceptability_tuple(Valid),
    candidate_acceptability_tuple(Candidate),
    not -necessary_match_input(Candidate,Valid).
    

% Sufficient and necessary condition for both inputs and outputs
valid_acceptability_tuple(Candidate) :-
    match_for_action(Candidate,Valid),
    sufficient_match_input(Candidate,Valid),
    necessary_match_input(Candidate,Valid),
    sufficient_match_output(Candidate,Valid),
    necessary_match_output(Candidate,Valid).

-valid_acceptability_tuple(Candidate) :-
    candidate_acceptability_tuple(Candidate),
    not valid_acceptability_tuple(Candidate).

-valid_recipe(RG,TF) :-
	candidate_recipe(RG,TF),
	in(a_nodes(RG),a(N)),
	not valid_acceptability_tuple((RG,TF,a(N))).

valid_recipe(RG,TF) :- candidate_recipe(RG,TF), not -valid_recipe(RG,TF).

