%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: hummus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% "tf" indicates "type function"
type_of(tf_edamame_hummus,c(0),"frozen shelled edamame soybeans").
type_of(tf_edamame_hummus,c(1),"thawed shelled edamame soybeans").
type_of(tf_edamame_hummus,c(2),"thawed hulled edamame soybeans").
type_of(tf_edamame_hummus,c(3),"lemon juice").
type_of(tf_edamame_hummus,c(4),"tahini").
type_of(tf_edamame_hummus,c(5),"blend of lemon juice and tahini").
% Add the olive oil, salt, ground cumin and garlic to the processor and process for another minute.
type_of(tf_edamame_hummus,c(6),"olive oil").
type_of(tf_edamame_hummus,c(7),"salt").
type_of(tf_edamame_hummus,c(8),"ground cumin").
type_of(tf_edamame_hummus,c(9),"frozen minced garlic").
type_of(tf_edamame_hummus,c(10),"blend of lemon juice, tahini, olive oil, salt, cumin and garlic").
type_of(tf_edamame_hummus,c(11),"untopped edamame hummus").
type_of(tf_edamame_hummus,c(12),"ungarnished edamame hummus").
type_of(tf_edamame_hummus,c(13),"thinly sliced radish").
type_of(tf_edamame_hummus,c(14),"chopped shisho leaves").
type_of(tf_edamame_hummus,c(15),"edamame hummus").
% actions
type_of(tf_edamame_hummus,a(0),"thaw").
type_of(tf_edamame_hummus,a(1),"hull").
%type_of(tf_edamame_hummus,a(2),"process lemon juice and tahini in a food processor").
type_of(tf_edamame_hummus,a(2),"blend together").
type_of(tf_edamame_hummus,a(3),"blend together").
type_of(tf_edamame_hummus,a(4),"blend together until smooth").
type_of(tf_edamame_hummus,a(5),"top with whole beans").
type_of(tf_edamame_hummus,a(6),"garnish").

child("process lemon juice and tahini in a food processor", "blend").
child("blend of lemon juice and tahini","mixture").
child("blend of lemon juice, tahini, olive oil, salt, cumin and garlic","mixture").

%% uncomment when resolved
%typed_graph(rg_edamame_hummus,tf_edamame_hummus).
given_recipe(rg_edamame_hummus,tf_edamame_hummus).

