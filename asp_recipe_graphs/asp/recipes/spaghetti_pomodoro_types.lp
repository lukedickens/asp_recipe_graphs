%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: hummus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

recipe(rg_spaghetti_pomodoro,tf_spaghetti_pomodoro).

type_of(tf_spaghetti_pomodoro,c(0),"boiling salted water").
type_of(tf_spaghetti_pomodoro,c(1),"uncooked spaghetti").
type_of(tf_spaghetti_pomodoro,c(2),"undrained cooked spaghetti").
type_of(tf_spaghetti_pomodoro,c(3),"cold pomodoro sauce").
type_of(tf_spaghetti_pomodoro,c(4),"fried onion").
type_of(tf_spaghetti_pomodoro,c(5),"hot pomodoro sauce").
type_of(tf_spaghetti_pomodoro,c(6),"pasta water").
type_of(tf_spaghetti_pomodoro,c(7),"drained cooked spaghetti").
type_of(tf_spaghetti_pomodoro,c(8),"spaghetti in bowl").
type_of(tf_spaghetti_pomodoro,c(9),"spaghetti pomodoro").
% actions
type_of(tf_spaghetti_pomodoro,a(0),"boil for 10 min").
type_of(tf_spaghetti_pomodoro,a(1),"mix and heat").
type_of(tf_spaghetti_pomodoro,a(2),"drain").
type_of(tf_spaghetti_pomodoro,a(3),"pour into bowl").
type_of(tf_spaghetti_pomodoro,a(4),"mix in bowl").


child("heated pasta sauce", "complex comestible").
child("spaghetti in bowl", "complex comestible").
child("spaghetti pomodoro", "complex comestible").

child("boil for 10 min", "boil").
child("mix in bowl", "mix").

