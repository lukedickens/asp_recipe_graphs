%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% typing function (beans on toast):
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

given_recipe(rg_grilled_cheese_on_toast,tf_grilled_cheese_on_toast).
given_type_of(tf_grilled_cheese_on_toast,c(0),"slice of bread").
given_type_of(tf_grilled_cheese_on_toast,c(1),"plain toast").
given_type_of(tf_grilled_cheese_on_toast,c(2),"grated cheese").
given_type_of(tf_grilled_cheese_on_toast,c(3),"grated cheese on toast").
given_type_of(tf_grilled_cheese_on_toast,c(4),"grilled cheese on toast").
given_type_of(tf_grilled_cheese_on_toast,a(0),"grill").
given_type_of(tf_grilled_cheese_on_toast,a(1),"sprinkle").
given_type_of(tf_grilled_cheese_on_toast,a(2),"grill").


child("grated cheese on toast", "complex comestible").
child("grilled cheese on toast", "complex comestible").

