%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The type hierarchies for these examples:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


child("bake", "action").
    child("bake at 180C for 45min", "bake").
child("boil", "action").
child("chop", "action").
    child("finely chop", "chop").
        child("finely chop onion", "finely chop").
    child("chop carrot", "chop").
        child("finely chop onion", "chop onion").
    child("chop onion", "chop").
    child("dice", "chop").
child("combine", "action").
    child("mix", "combine").
    child("beat together", "mix").
        child("beat together until smooth", "beat together").
    child("blend together", "mix").
    child("cream together", "mix").
    child("stir together", "mix").

child("blend", "action").
    child("blend until uniform", "blend").
    child("blend together", "blend").
        child("pulse in blender", "blend").
            child("blend together until smooth", "blend together").
child("drain", "action").
child("dust","action").
child("fill","action").

child("fry", "action").
    child("fry onion", "fry").
        child("fry onion for 4 min", "fry onion").
    child("fry for 4 min", "fry").
        child("fry onion for 4 min", "fry for 4 min").
child("hull", "action").
child("infuse", "action").
    child("infuse in hot oil", "infuse").
child("put", "action").
    child("pour", "put").
        child("pour onto toast", "pour").
    child("spread", "put").
        child("spread on toast", "spread").
child("rinse", "action").
child("roast", "action").
child("shell", "action").
child("stir", "action").
    child("stir together", "stir").
        child("stir together vigorously", "stir together").
child("thaw", "action").



% multistep
child("combine then roast", "roast").
child("combine then roast", "combine").
%%TODO is rinse and drain a subtype of rinse?
child("rinse and drain", "rinse").
%%TODO is rinse and drain a subtype of drain?
child("rinse and drain", "drain").
child("fill and dust","dust").
child("fill and dust","fill").

child("baking agent","comestible").
    child("bicarbonate of soda","baking agent").

child("bread", "comestible").
    child("toast", "bread").
        child("plain toast", "toast").
        child("buttered toast", "toast").
child("cake","comestible").
    child("sponge cake","cake").
        child("victoria sponge","sponge cake").
        child("unfinished vegan sponge cake","sponge cake").
        child("vegan sponge cake","sponge cake").
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
    child("edamame beans", "pulses").
        child("frozen shelled edamame beans", "edamame beans").
        child("thawed shelled edamame beans", "edamame beans").
        child("thawed hulled edamame beans", "edamame beans").
    child("baked beans", "pulses").
        child("heated beans", "baked beans").
child("vegetable", "comestible").
    child("preserved vegetable","vegetable").
        child("sun-dried tomato", "preserved vegetable").
    child("aubergine", "vegetable").
        child("oiled aubergine halves", "aubergine").
        child("roasted aubergine", "aubergine").
            child("roasted aubergine halves", "roasted aubergine").
            child("roasted aubergine flesh", "roasted aubergine").
            child("strained aubergine flesh", "roasted aubergine").
            child("roasted aubergine skin", "roasted aubergine").
        child("aubergine drippings", "aubergine").
    child("carrot", "vegetable").
    child("garlic", "vegetable").
        child("diced garlic", "garlic").
        child("whole garlic", "garlic").
        child("minced garlic", "garlic").
            child("frozen minced garlic", "minced garlic").
        %child("roasted peeled garlic", "roasted whole garlic").
        %child("roasted peeled garlic", "peeled garlic").
        child("roasted peeled garlic", "garlic").
    child("onion", "vegetable").
        child("raw onion", "onion").
        child("fried onion", "onion").
        child("sliced onion", "onion").
    child("radish", "vegetable").
        child("sliced radish", "radish").
            child("thinly sliced radish", "radish").
    child("tomato", "vegetable").
        child("sun-dried tomato", "tomato").
            child("sun-dried tomato halves", "sun-dried tomato").
            child("chopped sun-dried tomatoes", "sun-dried tomato").

child("milk or milk analog","comestible").
    child("milk","milk or milk analog").
    child("vegan milk analog","milk or milk analog").
        child("oat milk","vegan milk analog").
        child("cashew milk","vegan milk analog").
        child("almond milk","vegan milk analog").
        child("soya milk","vegan milk analog").
child("flour", "comestible").
    child("self-raising flour", "flour").
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
        child("vanilla seeds", "spices").
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
    child("shisho leaves", "herbs").
        child("chopped shisho leaves", "shisho leaves").
child("mixture", "comestible").
        child("infusion", "mixture").
        child("blended mixture","mixture").
        child("cake mix", "mixture").
            child("sponge cake mix", "cake mix").
                child("vegan sponge cake mix","sponge cake mix").
        
child("spreads", "comestible").
    child("butter", "spreads").
    child("dairy-free spread", "spreads").
child("sweetener","comestible").
    child("sugar","sweetener").
        child("caster sugar","sugar").
            child("golden caster sugar","caster sugar").
    child("icing sugar","sugar").
child("preserves", "comestible").
    child("jam", "preserves").
        child("strawberry jam", "jam").

child("vegan comestible","comestible").
    child("vegan sponge cake","vegan comestible").
    child("vegan milk analog","vegan comestible").
    
child("vinegar","comestible").
    child("cider vinegar","vinegar").
    
    
child("gluten free comestible","comestible").

child("complex comestible", "comestible").
    child("beans on toast", "complex comestible").

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

