%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: rg_atomic_fusilli
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

recipe(rg_atomic_fusilli,tf_atomic_fusilli).

type_of(tf_atomic_fusilli,c(0),"boiling salted water").
type_of(tf_atomic_fusilli,c(1),"uncooked fusilli").
type_of(tf_atomic_fusilli,c(2),"undrained cooked fusilli").
% actions
type_of(tf_atomic_fusilli,a(0),"boil for 10 min").

child("boil for 10 min", "boil").
