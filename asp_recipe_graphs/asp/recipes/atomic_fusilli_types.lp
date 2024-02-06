%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: rg_atomic_fusilli
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

given_recipe(rg_atomic_fusilli,tf_atomic_fusilli).

given_type_of(tf_atomic_fusilli,c(0),"boiling salted water").
given_type_of(tf_atomic_fusilli,c(1),"uncooked fusilli").
given_type_of(tf_atomic_fusilli,c(2),"undrained cooked fusilli").
% actions
given_type_of(tf_atomic_fusilli,a(0),"boil for 10 min").

child("boil for 10 min", "boil").
