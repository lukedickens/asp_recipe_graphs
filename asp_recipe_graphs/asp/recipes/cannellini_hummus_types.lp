%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: hummus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% "tf" indicates "type function"
type_of(tf_cannellini_hummus,c(0),"whole garlic").
type_of(tf_cannellini_hummus,c(1),"olive oil").
type_of(tf_cannellini_hummus,c(2),"kosher salt").
type_of(tf_cannellini_hummus,c(3),"roasted peeled garlic").
type_of(tf_cannellini_hummus,c(4),"fresh thyme sprigs").
type_of(tf_cannellini_hummus,c(5),"chopped fresh thyme").
type_of(tf_cannellini_hummus,c(6),"fresh rosemary sprigs").
type_of(tf_cannellini_hummus,c(7),"chopped fresh rosemary").
type_of(tf_cannellini_hummus,c(8),"fresh sage leaves").
type_of(tf_cannellini_hummus,c(9),"chopped fresh sage").
type_of(tf_cannellini_hummus,c(10),"thyme, rosemary and sage infused oil").
type_of(tf_cannellini_hummus,c(11),"tinned cannellini beans").
type_of(tf_cannellini_hummus,c(12),"drained cannellini beans").
type_of(tf_cannellini_hummus,c(13),"blended cannellini beans").
type_of(tf_cannellini_hummus,c(14),"herb and cannellini bean blend").
type_of(tf_cannellini_hummus,c(15),"garlic, herb and cannellini bean blend").
type_of(tf_cannellini_hummus,c(16),"sun-dried tomato halves").
type_of(tf_cannellini_hummus,c(17),"chopped sun-dried tomatoes").
type_of(tf_cannellini_hummus,c(18),"cannellini hummus").
% actions
type_of(tf_cannellini_hummus,a(0),"oil and salt garlic then roast").
type_of(tf_cannellini_hummus,a(1),"chop").
type_of(tf_cannellini_hummus,a(2),"chop").
type_of(tf_cannellini_hummus,a(3),"chop").
type_of(tf_cannellini_hummus,a(4),"infuse in hot oil").
type_of(tf_cannellini_hummus,a(5),"drain").
type_of(tf_cannellini_hummus,a(6),"pulse in blender").
type_of(tf_cannellini_hummus,a(7),"blend together").
type_of(tf_cannellini_hummus,a(8),"blend together").
type_of(tf_cannellini_hummus,a(9),"chop").
type_of(tf_cannellini_hummus,a(10),"blend together").

child("oil and salt garlic then roast", "combine then roast").
child("thyme, rosemary and sage infused oil", "infusion").
child("herb and cannellini bean blend", "blended mixture").
child("garlic, herb and cannellini bean blend", "blended mixture").
child("cannellini hummus", "dips").

%% uncomment when resolved
%typed_graph(rg_cannellini_hummus,tf_cannellini_hummus).
given_recipe(rg_cannellini_hummus,tf_cannellini_hummus).

