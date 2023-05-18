%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: hummus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%TODO would be nice to have a switch to check for unconnected definitions
%allow_unconnected_recipes.
given_recipe(rg_hummus,tf_hummus).
% "tf" indicates "type function"
type_of(tf_hummus,c(0),"whole garlic").
type_of(tf_hummus,c(1),"tahini").
type_of(tf_hummus,c(2),"salt").
type_of(tf_hummus,c(3),"lemon juice").
type_of(tf_hummus,c(4),"olive oil").
type_of(tf_hummus,c(5),"water").
type_of(tf_hummus,c(6),"diced garlic").
type_of(tf_hummus,c(7),"tinned chick peas").
type_of(tf_hummus,c(8),"tahini mixture").
type_of(tf_hummus,c(9),"rinsed chick peas").
type_of(tf_hummus,c(10),"hummus").
% actions
type_of(tf_hummus,a(0),"dice").
type_of(tf_hummus,a(1),"blend until uniform").
type_of(tf_hummus,a(2),"rinse and drain").
type_of(tf_hummus,a(3),"blend together").


