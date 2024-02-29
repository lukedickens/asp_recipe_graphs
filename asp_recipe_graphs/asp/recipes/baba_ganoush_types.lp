%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example recipe: baba_ganoush
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

recipe(rg_baba_ganoush,tf_baba_ganoush).
% "tf" indicates "type function"
type_of(tf_baba_ganoush,c(0),"whole aubergine").
type_of(tf_baba_ganoush,c(1),"extra-virgin olive oil").
type_of(tf_baba_ganoush,c(2),"oiled aubergine halves").
type_of(tf_baba_ganoush,c(3),"roasted aubergine halves").
type_of(tf_baba_ganoush,c(4),"roasted aubergine skin").
type_of(tf_baba_ganoush,c(5),"roasted aubergine flesh").
type_of(tf_baba_ganoush,c(6),"aubergine drippings").
type_of(tf_baba_ganoush,c(7),"strained aubergine flesh").
type_of(tf_baba_ganoush,c(8),"minced garlic").
type_of(tf_baba_ganoush,c(9),"lemon juice").
type_of(tf_baba_ganoush,c(10),"mixture of aubergine, garlic and lemon juice").
type_of(tf_baba_ganoush,c(11),"tahini").
type_of(tf_baba_ganoush,c(12),"mixture of aubergine, garlic, lemon juice and tahini").
type_of(tf_baba_ganoush,c(13),"mixture of aubergine, garlic, lemon juice, tahini and olive oil").
type_of(tf_baba_ganoush,c(14),"chopped fresh flat-leaf parsley").
type_of(tf_baba_ganoush,c(15),"salt").
type_of(tf_baba_ganoush,c(16),"ground cumin").
type_of(tf_baba_ganoush,c(17),"unseasoned baba ganoush").
type_of(tf_baba_ganoush,c(18),"ungarnished baba ganoush").
type_of(tf_baba_ganoush,c(19),"smoked paprika").
type_of(tf_baba_ganoush,c(20),"baba ganoush").
% actions
type_of(tf_baba_ganoush,a(0),"halve and oil aubergine").
type_of(tf_baba_ganoush,a(1),"roast").
type_of(tf_baba_ganoush,a(2),"scoop out flesh").
type_of(tf_baba_ganoush,a(3),"strain").
type_of(tf_baba_ganoush,a(4),"stir together vigorously").
type_of(tf_baba_ganoush,a(5),"stir until incorporated").
type_of(tf_baba_ganoush,a(6),"drizzle oil while stirring").
type_of(tf_baba_ganoush,a(7),"stir in parsley, salt and cumin").
type_of(tf_baba_ganoush,a(8),"season").
type_of(tf_baba_ganoush,a(9),"garnish").


child("mixture of aubergine, garlic, lemon juice and tahini", "mixture").
child("mixture of aubergine, garlic, lemon juice, tahini and olive oil", "mixture").

