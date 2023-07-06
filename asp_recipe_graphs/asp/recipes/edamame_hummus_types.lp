%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: hummus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

given_recipe(rg_edamame_hummus,tf_edamame_hummus).
% "tf" indicates "type function"
given_type_of(tf_edamame_hummus,c(0),"frozen shelled edamame soybeans").
given_type_of(tf_edamame_hummus,c(1),"thawed shelled edamame soybeans").
given_type_of(tf_edamame_hummus,c(2),"thawed hulled edamame soybeans").
given_type_of(tf_edamame_hummus,c(3),"lemon juice").
given_type_of(tf_edamame_hummus,c(4),"tahini").
given_type_of(tf_edamame_hummus,c(5),"blend of lemon juice and tahini").
% Add the olive oil, salt, ground cumin and garlic to the processor and process for another minute.
given_type_of(tf_edamame_hummus,c(6),"olive oil").
given_type_of(tf_edamame_hummus,c(7),"salt").
given_type_of(tf_edamame_hummus,c(8),"ground cumin").
given_type_of(tf_edamame_hummus,c(9),"frozen minced garlic").
given_type_of(tf_edamame_hummus,c(10),"blend of lemon juice, tahini, olive oil, salt, cumin and garlic").
given_type_of(tf_edamame_hummus,c(11),"untopped edamame hummus").
given_type_of(tf_edamame_hummus,c(12),"ungarnished edamame hummus").
given_type_of(tf_edamame_hummus,c(13),"thinly sliced radish").
given_type_of(tf_edamame_hummus,c(14),"chopped shisho leaves").
given_type_of(tf_edamame_hummus,c(15),"edamame hummus").
% actions
given_type_of(tf_edamame_hummus,a(0),"thaw").
given_type_of(tf_edamame_hummus,a(1),"hull").
%given_type_of(tf_edamame_hummus,a(2),"process lemon juice and tahini in a food processor").
given_type_of(tf_edamame_hummus,a(2),"blend together").
given_type_of(tf_edamame_hummus,a(3),"blend together").
given_type_of(tf_edamame_hummus,a(4),"blend together until smooth").
given_type_of(tf_edamame_hummus,a(5),"top with whole beans").
given_type_of(tf_edamame_hummus,a(6),"garnish").

child("process lemon juice and tahini in a food processor", "blend").
child("blend of lemon juice and tahini","mixture").
child("blend of lemon juice, tahini, olive oil, salt, cumin and garlic","mixture").


