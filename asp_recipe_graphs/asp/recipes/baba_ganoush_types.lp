%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: baba_ganoush
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%TODO would be nice to have a switch to check for unconnected definitions
%allow_unconnected_recipes.
given_recipe(rg_baba_ganoush,tf_baba_ganoush).
% "tf" indicates "type function"
given_type_of(tf_baba_ganoush,c(0),"whole aubergine").
given_type_of(tf_baba_ganoush,c(1),"extra-virgin olive oil").
given_type_of(tf_baba_ganoush,c(2),"oiled aubergine halves").
given_type_of(tf_baba_ganoush,c(3),"roasted aubergine halves").
given_type_of(tf_baba_ganoush,c(4),"roasted aubergine skin").
given_type_of(tf_baba_ganoush,c(5),"roasted aubergine flesh").
given_type_of(tf_baba_ganoush,c(6),"aubergine drippings").
given_type_of(tf_baba_ganoush,c(7),"strained aubergine flesh").
given_type_of(tf_baba_ganoush,c(8),"minced garlic").
given_type_of(tf_baba_ganoush,c(9),"lemon juice").
given_type_of(tf_baba_ganoush,c(10),"mixture of aubergine, garlic and lemon juice").
given_type_of(tf_baba_ganoush,c(11),"tahini").
given_type_of(tf_baba_ganoush,c(12),"mixture of aubergine, garlic, lemon juice and tahini").
given_type_of(tf_baba_ganoush,c(13),"mixture of aubergine, garlic, lemon juice, tahini and olive oil").
given_type_of(tf_baba_ganoush,c(14),"chopped fresh flat-leaf parsley").
given_type_of(tf_baba_ganoush,c(15),"salt").
given_type_of(tf_baba_ganoush,c(16),"ground cumin").
given_type_of(tf_baba_ganoush,c(17),"unseasoned baba ganoush").
given_type_of(tf_baba_ganoush,c(18),"ungarnished baba ganoush").
given_type_of(tf_baba_ganoush,c(19),"smoked paprika").
given_type_of(tf_baba_ganoush,c(20),"baba ganoush").
% actions
given_type_of(tf_baba_ganoush,a(0),"halve and oil aubergine").
given_type_of(tf_baba_ganoush,a(1),"roast").
given_type_of(tf_baba_ganoush,a(2),"scoop out flesh").
given_type_of(tf_baba_ganoush,a(3),"strain").
given_type_of(tf_baba_ganoush,a(4),"stir together vigorously").
given_type_of(tf_baba_ganoush,a(5),"stir until incorporated").
given_type_of(tf_baba_ganoush,a(6),"drizzle oil while stirring").
given_type_of(tf_baba_ganoush,a(7),"stir in parsley, salt and cumin").
given_type_of(tf_baba_ganoush,a(8),"season").
given_type_of(tf_baba_ganoush,a(9),"garnish").


%child("mixture of garlic, tahini, salt, lemon juice, olive oil and water", "mixture").

given_recipe(rg_baba_ganoush,tf_baba_ganoush).
