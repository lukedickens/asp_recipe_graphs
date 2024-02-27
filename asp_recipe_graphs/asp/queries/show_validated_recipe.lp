#show candidate_recipe/2.
#show valid_recipe(RG,TF) :
    valid_recipe(RG,TF),
    candidate_recipe(RG,TF).
#show -valid_recipe(RG,TF) :
    -valid_recipe(RG,TF),
    candidate_recipe(RG,TF).



