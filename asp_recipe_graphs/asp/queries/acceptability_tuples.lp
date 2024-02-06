acceptability_element(Inset,Action,Outset) :-
    given_recipe(RG,TF),
    input_element(RG,TF,a(N)),
    output_element(RG,TF,a(N)),
    type_of(TF,a(N),Action).

%#show acceptability_tuple/3.
%#show recipe/2.
