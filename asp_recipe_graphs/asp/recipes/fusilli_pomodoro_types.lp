%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: hummus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

recipe(rg_fusilli_pomodoro,tf_fusilli_pomodoro).

type_of(tf_fusilli_pomodoro,c(0),"boiling salted water").
type_of(tf_fusilli_pomodoro,c(1),"uncooked fusilli").
type_of(tf_fusilli_pomodoro,c(2),"undrained cooked fusilli").
type_of(tf_fusilli_pomodoro,c(3),"cold pomodoro sauce").
type_of(tf_fusilli_pomodoro,c(4),"fried onion").
type_of(tf_fusilli_pomodoro,c(5),"hot pomodoro sauce").
type_of(tf_fusilli_pomodoro,c(6),"pasta water").
type_of(tf_fusilli_pomodoro,c(7),"drained cooked fusilli").
type_of(tf_fusilli_pomodoro,c(8),"fusilli in bowl").
type_of(tf_fusilli_pomodoro,c(9),"fusilli pomodoro").
% actions
type_of(tf_fusilli_pomodoro,a(0),"boil for 10 min").
type_of(tf_fusilli_pomodoro,a(1),"mix and heat").
type_of(tf_fusilli_pomodoro,a(2),"drain").
type_of(tf_fusilli_pomodoro,a(3),"pour into bowl").
type_of(tf_fusilli_pomodoro,a(4),"mix in bowl").


child("heated pasta sauce", "complex comestible").
child("fusilli in bowl", "complex comestible").
child("fusilli pomodoro", "complex comestible").

child("boil for 10 min", "boil").
child("mix in bowl", "mix").

