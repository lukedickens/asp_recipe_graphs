%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: hummus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

given_recipe(rg_cannellini_hummus,tf_cannellini_hummus).
given_type_of(tf_cannellini_hummus,c(0),"whole garlic").
given_type_of(tf_cannellini_hummus,c(1),"olive oil").
given_type_of(tf_cannellini_hummus,c(2),"kosher salt").
given_type_of(tf_cannellini_hummus,c(3),"roasted peeled garlic").
given_type_of(tf_cannellini_hummus,c(4),"fresh thyme sprigs").
given_type_of(tf_cannellini_hummus,c(5),"chopped fresh thyme").
given_type_of(tf_cannellini_hummus,c(6),"fresh rosemary sprigs").
given_type_of(tf_cannellini_hummus,c(7),"chopped fresh rosemary").
given_type_of(tf_cannellini_hummus,c(8),"fresh sage leaves").
given_type_of(tf_cannellini_hummus,c(9),"chopped fresh sage").
given_type_of(tf_cannellini_hummus,c(10),"thyme, rosemary and sage infused oil").
given_type_of(tf_cannellini_hummus,c(11),"tinned cannellini beans").
given_type_of(tf_cannellini_hummus,c(12),"drained cannellini beans").
given_type_of(tf_cannellini_hummus,c(13),"blended cannellini beans").
given_type_of(tf_cannellini_hummus,c(14),"herb and cannellini bean blend").
given_type_of(tf_cannellini_hummus,c(15),"garlic, herb and cannellini bean blend").
given_type_of(tf_cannellini_hummus,c(16),"sun-dried tomato halves").
given_type_of(tf_cannellini_hummus,c(17),"chopped sun-dried tomatoes").
given_type_of(tf_cannellini_hummus,c(18),"cannellini hummus").
% actions
given_type_of(tf_cannellini_hummus,a(0),"oil and salt garlic then roast").
given_type_of(tf_cannellini_hummus,a(1),"chop").
given_type_of(tf_cannellini_hummus,a(2),"chop").
given_type_of(tf_cannellini_hummus,a(3),"chop").
given_type_of(tf_cannellini_hummus,a(4),"infuse in hot oil").
given_type_of(tf_cannellini_hummus,a(5),"drain").
given_type_of(tf_cannellini_hummus,a(6),"pulse in blender").
given_type_of(tf_cannellini_hummus,a(7),"blend together").
given_type_of(tf_cannellini_hummus,a(8),"blend together").
given_type_of(tf_cannellini_hummus,a(9),"chop").
given_type_of(tf_cannellini_hummus,a(10),"blend together").

child("oil and salt garlic then roast", "combine then roast").
child("thyme, rosemary and sage infused oil", "infusion").
child("herb and cannellini bean blend", "blended mixture").
child("garlic, herb and cannellini bean blend", "blended mixture").
child("cannellini hummus", "dips").


