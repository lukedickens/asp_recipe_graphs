%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: rg_atomic_spaghetti
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

given_recipe(rg_atomic_spaghetti,tf_atomic_spaghetti).

given_type_of(tf_atomic_spaghetti,c(0),"boiling salted water").
given_type_of(tf_atomic_spaghetti,c(1),"uncooked spaghetti").
given_type_of(tf_atomic_spaghetti,c(2),"undrained cooked spaghetti").
% actions
given_type_of(tf_atomic_spaghetti,a(0),"boil for 10 min").

child("boil for 10 min", "boil").
