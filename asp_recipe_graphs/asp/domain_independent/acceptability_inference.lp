
% should we be saying in validity.lp

% the existing way
% all given tuples are valid under any rule
valid_tuple(Valid) :-
    tuple_inference_ruleset(RuleSet),
    valid_action_element(Valid, AType).

valid_action_element(Key,AType) :-
    tuple_inference_ruleset(RuleSet),
    potential_action_element(Key,AType),
    inferred_action_element(Rules,Key,AType).
    
valid_input_element(Key,CType,M) :-
    tuple_inference_ruleset(RuleSet),
    potential_action_element(Key,CType,M),
    inferred_action_element(Rules,Key,CType,M).

valid_output_element(Key,CType,M) :-
    tuple_inference_ruleset(RuleSet),
    potential_action_element(Key,CType,M),
    inferred_action_element(Rules,Key,CType,M).
    
    
% or should we be validating the key rather than the elements?

