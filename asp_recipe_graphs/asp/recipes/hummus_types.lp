%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: hummus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% "tf" indicates "type function"
given_type_of(tf_hummus,c(0),"whole garlic").
given_type_of(tf_hummus,c(1),"tahini").
given_type_of(tf_hummus,c(2),"salt").
given_type_of(tf_hummus,c(3),"lemon juice").
given_type_of(tf_hummus,c(4),"olive oil").
given_type_of(tf_hummus,c(5),"water").
given_type_of(tf_hummus,c(6),"diced garlic").
given_type_of(tf_hummus,c(7),"tinned chick peas").
given_type_of(tf_hummus,c(8),"mixture of garlic, tahini, salt, lemon juice, olive oil and water").
given_type_of(tf_hummus,c(9),"rinsed chick peas").
given_type_of(tf_hummus,c(10),"hummus").
% actions
given_type_of(tf_hummus,a(0),"dice").
given_type_of(tf_hummus,a(1),"blend until uniform").
given_type_of(tf_hummus,a(2),"rinse and drain").
given_type_of(tf_hummus,a(3),"blend together").


child("mixture of garlic, tahini, salt, lemon juice, olive oil and water", "mixture").

given_recipe(rg_hummus,tf_hummus).
