%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% typing function (beans on toast):
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

recipe(rg_grilled_cheese_on_toast,tf_grilled_cheese_on_toast).
type_of(tf_grilled_cheese_on_toast,c(0),"sliced bread").
type_of(tf_grilled_cheese_on_toast,c(1),"plain toast").
type_of(tf_grilled_cheese_on_toast,c(2),"grated cheese").
type_of(tf_grilled_cheese_on_toast,c(3),"grated cheese on toast").
type_of(tf_grilled_cheese_on_toast,c(4),"grilled cheese on toast").
type_of(tf_grilled_cheese_on_toast,a(0),"grill").
type_of(tf_grilled_cheese_on_toast,a(1),"sprinkle").
type_of(tf_grilled_cheese_on_toast,a(2),"grill").


child("grated cheese on toast", "complex comestible").
child("grilled cheese on toast", "complex comestible").

