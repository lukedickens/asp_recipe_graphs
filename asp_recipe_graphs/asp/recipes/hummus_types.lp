%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: hummus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

recipe(rg_hummus,tf_hummus).

type_of(tf_hummus,c(0),"whole garlic").
type_of(tf_hummus,c(1),"tahini").
type_of(tf_hummus,c(2),"salt").
type_of(tf_hummus,c(3),"lemon juice").
type_of(tf_hummus,c(4),"olive oil").
type_of(tf_hummus,c(5),"water").
type_of(tf_hummus,c(6),"diced garlic").
type_of(tf_hummus,c(7),"tinned chick peas").
type_of(tf_hummus,c(8),"mixture of garlic, tahini, salt, lemon juice, olive oil and water").
type_of(tf_hummus,c(9),"rinsed chick peas").
type_of(tf_hummus,c(10),"hummus").
% actions
type_of(tf_hummus,a(0),"dice").
type_of(tf_hummus,a(1),"blend until uniform").
type_of(tf_hummus,a(2),"rinse and drain").
type_of(tf_hummus,a(3),"blend together").


child("mixture of garlic, tahini, salt, lemon juice, olive oil and water", "mixture").


