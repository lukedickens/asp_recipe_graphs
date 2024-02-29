%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: rg_atomic_fusilli_alt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

recipe(rg_atomic_fusilli_alt,tf_atomic_fusilli_alt).

type_of(tf_atomic_fusilli_alt,c(0),"boiling salted water").
type_of(tf_atomic_fusilli_alt,c(1),"uncooked fusilli").
type_of(tf_atomic_fusilli_alt,c(2),"undrained cooked fusilli").
% actions
type_of(tf_atomic_fusilli_alt,a(0),"steam for 10 min").

child("steam for 10 min", "steam").
