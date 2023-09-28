%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: hummus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

given_recipe(rg_spaghetti_pomodoro,tf_spaghetti_pomodoro).

given_type_of(tf_spaghetti_pomodoro,c(0),"boiling salted water").
given_type_of(tf_spaghetti_pomodoro,c(1),"uncooked spaghetti").
given_type_of(tf_spaghetti_pomodoro,c(2),"undrained cooked spaghetti").
given_type_of(tf_spaghetti_pomodoro,c(3),"cold pomodoro sauce").
given_type_of(tf_spaghetti_pomodoro,c(4),"fried onion").
given_type_of(tf_spaghetti_pomodoro,c(5),"hot pomodoro sauce").
given_type_of(tf_spaghetti_pomodoro,c(6),"pasta water").
given_type_of(tf_spaghetti_pomodoro,c(7),"drained cooked spaghetti").
given_type_of(tf_spaghetti_pomodoro,c(8),"spaghetti in bowl").
given_type_of(tf_spaghetti_pomodoro,c(9),"spaghetti pomodoro").
% actions
given_type_of(tf_spaghetti_pomodoro,a(0),"boil for 10 min").
given_type_of(tf_spaghetti_pomodoro,a(1),"mix and heat").
given_type_of(tf_spaghetti_pomodoro,a(2),"drain").
given_type_of(tf_spaghetti_pomodoro,a(3),"pour into bowl").
given_type_of(tf_spaghetti_pomodoro,a(4),"mix in bowl").


child("heated pasta sauce", "complex comestible").
child("spaghetti in bowl", "complex comestible").
child("spaghetti pomodoro", "complex comestible").

child("boil for 10 min", "boil").
child("mix in bowl", "mix").

