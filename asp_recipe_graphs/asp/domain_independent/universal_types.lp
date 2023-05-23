%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The type hierarchies for these examples:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


child("put", "action").
    child("pour", "put").
        child("pour onto toast", "pour").
    child("spread", "put").
        child("spread on toast", "spread").
child("combine", "action").
    child("mix", "combine").
    child("blend", "combine").
        child("blend until uniform", "blend").
        child("blend together", "blend").
        child("pulse in blender", "blend").
child("infuse", "action").
    child("infuse in hot oil", "infuse").

child("bake", "action").
    child("bake at 180C for 45min", "bake").
child("boil", "action").
child("fry", "action").
    child("fry onion", "fry").
        child("fry onion for 4 min", "fry onion").
    child("fry for 4 min", "fry").
        child("fry onion for 4 min", "fry for 4 min").
child("chop", "action").
    child("finely chop", "chop").
        child("finely chop onion", "finely chop").
    child("chop carrot", "chop").
        child("finely chop onion", "chop onion").
    child("chop onion", "chop").
    child("dice", "chop").
child("rinse", "action").
    %%TODO is rinse and drain a subtype of rinse?
    child("rinse and drain", "rinse").
child("roast", "action").
child("drain", "action").
    %%TODO is rinse and drain a subtype of drain?
    child("rinse and drain", "drain").


% multistep
child("combine then roast", "roast").
child("combine then roast", "combine").


child("fish", "comestible").
child("water", "comestible").
child("pasta", "comestible").
    child("spaghetti", "pasta").
    child("fusilli", "pasta").
child("pulses", "comestible").
    child("chick peas", "pulses").
        child("tinned chick peas", "chick peas").
        child("rinsed chick peas", "chick peas").
    child("cannellini beans", "pulses").
        child("tinned cannellini beans", "cannellini beans").
        child("drained cannellini beans", "cannellini beans").
        child("blended cannellini beans", "cannellini beans").
child("vegetable", "comestible").
    child("preserved vegetable","vegetable").
        child("sun-dried tomato", "preserved vegetable").
    child("aubergine", "vegetable").
    child("garlic", "vegetable").
        child("diced garlic", "garlic").
        child("whole garlic", "garlic").
        child("minced garlic", "garlic").
        %child("roasted peeled garlic", "roasted whole garlic").
        %child("roasted peeled garlic", "peeled garlic").
        child("roasted peeled garlic", "garlic").
    child("onion", "vegetable").
        child("raw onion", "onion").
        child("fried onion", "onion").
        child("sliced onion", "onion").
    child("carrot", "vegetable").
    child("tomato", "vegetable").
        child("sun-dried tomato", "tomato").
            child("sun-dried tomato halves", "sun-dried tomato").
            child("chopped sun-dried tomatoes", "sun-dried tomato").
child("fruit", "comestible").
    child("lemon juice", "fruit").
child("dairy", "comestible").
    child("milk", "dairy").
child("dips", "comestible").
    child("hummus", "dips").
child("pastes", "comestible").
    child("tahini", "pastes").
child("oil", "comestible").
    child("olive oil", "oil").
        child("extra-virgin olive oil", "olive oil").
child("flavourings", "comestible").
    child("salt", "flavourings").
        child("kosher salt", "salt").
    child("spices", "flavourings").
        child("cumin", "spices").
            child("ground cumin", "cumin").
        child("paprika", "spices").
            child("smoked paprika", "paprika").
    child("herbs", "flavourings").
        child("parsley", "herbs").
            child("chopped parsley", "parsley").
                child("chopped fresh flat-leaf parsley", "chopped parsley").
            child("fresh flat-leaf parsley", "parsley").
                child("chopped fresh flat-leaf parsley", "fresh flat-leaf parsley").
    child("thyme", "herbs").
        child("fresh thyme sprigs", "thyme").
        child("chopped fresh thyme", "thyme").
    child("rosemary", "herbs").
        child("fresh rosemary sprigs", "rosemary").
        child("chopped fresh rosemary", "rosemary").
    child("sage", "herbs").
        child("fresh sage leaves", "sage").
        child("chopped fresh sage", "sage").
child("mixture", "comestible").
        child("infusion", "mixture").
        child("blend", "mixture").

%child("mixture", "comestible").
%child(numbered_mixture(X), "mixture") :- int(X), X < 10.

%%TODO any value in this?
%child(concat("diced ",X), X) :- child(X, "vegetable").
%%TODO or this?
% partof("lemon juice", "lemon").

%tahini

%chopped fresh flat-leaf parsley


%%TODO IDEA
% We could try to reason about the type hierarchy based on acceptable substitutions
% from the recipe data. For instance, if leeks are an acceptable substitute for onions
% in some recipe but carrots are not but leeks, carrots and onions are all children of vegetable
% then we need to refine the hierarchy to support that. Either there is a hidden intermediate node

