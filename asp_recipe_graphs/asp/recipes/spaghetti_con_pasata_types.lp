%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: hummus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

given_recipe(rg_spaghetti_con_pasata,tf_spaghetti_con_pasata).

given_type_of(tf_spaghetti_con_pasata,c(0),"boiling salted water").
given_type_of(tf_spaghetti_con_pasata,c(1),"uncooked spaghetti").
given_type_of(tf_spaghetti_con_pasata,c(2),"undrained cooked spaghetti").
given_type_of(tf_spaghetti_con_pasata,c(3),"pasata").
given_type_of(tf_spaghetti_con_pasata,c(4),"fried onion").
given_type_of(tf_spaghetti_con_pasata,c(5),"heated pasta sauce").
given_type_of(tf_spaghetti_con_pasata,c(6),"pasta water").
given_type_of(tf_spaghetti_con_pasata,c(7),"drained cooked spaghetti").
given_type_of(tf_spaghetti_con_pasata,c(8),"spaghetti in bowl").
given_type_of(tf_spaghetti_con_pasata,c(9),"spaghetti con pasata").
% actions
given_type_of(tf_spaghetti_con_pasata,a(0),"boil for 10 min").
given_type_of(tf_spaghetti_con_pasata,a(1),"mix and heat").
given_type_of(tf_spaghetti_con_pasata,a(2),"drain").
given_type_of(tf_spaghetti_con_pasata,a(3),"pour into bowl").
given_type_of(tf_spaghetti_con_pasata,a(4),"mix in bowl").


child("heated pasta sauce", "complex comestible").
child("spaghetti in bowl", "complex comestible").
child("spaghetti con pasata", "complex comestible").

child("boil for 10 min", "boil").
child("mix in bowl", "mix").

