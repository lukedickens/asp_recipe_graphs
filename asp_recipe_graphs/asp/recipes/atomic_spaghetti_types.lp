%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: rg_atomic_spaghetti
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

recipe(rg_atomic_spaghetti,tf_atomic_spaghetti).

type_of(tf_atomic_spaghetti,c(0),"boiling salted water").
type_of(tf_atomic_spaghetti,c(1),"uncooked spaghetti").
type_of(tf_atomic_spaghetti,c(2),"undrained cooked spaghetti").
% actions
type_of(tf_atomic_spaghetti,a(0),"boil for 10 min").

child("boil for 10 min", "boil").
