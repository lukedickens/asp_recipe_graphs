acceptability_element(Action) :-
    given_recipe(RG,TF),
    input_element(RG,TF,a(N)),
    output_element(RG,TF,a(N)),
    type_of(TF,a(N),Action).

#show acceptability_element/1.
%#show recipe/2.
