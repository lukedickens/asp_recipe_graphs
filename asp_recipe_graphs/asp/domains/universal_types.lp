%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The type hierarchies for all supported recipes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


child("complex action", "action").
    child("add and cook", "complex action").
    child("wash and quarter", "complex action").
child("bake", "action").
    child("bake at 180C for 45min", "bake").
child("beat","action").
child("blend", "action").
    child("blend until uniform", "blend").
    child("blend together", "blend").
        child("pulse in blender", "blend").
            child("blend together until smooth", "blend together").
child("boil", "action").
    child("simmer", "boil").
child("coat", "action").
child("cook", "action").
    child("cook together", "cook").
    child("fry", "cook").
    child("grill", "cook").
    child("toast", "cook").
    child("simmer", "cook").
    child("steam","cook").
        child("steam for 10 min","steam").
child("cool", "action").
child("check temperature", "action").
child("cut", "action").
    child("slice", "cut").
    child("chop", "cut").
        child("finely chop", "chop").
        child("dice", "chop").
child("combine", "action").
    child("mix", "combine").
        child("mix together","action").
    child("beat together", "mix").
        child("beat together until smooth", "beat together").
    child("blend together", "mix").
    child("cream together", "mix").
    child("stir together", "mix").
child("divide", "action").
    child("scoop out", "divide").
    child("halve", "divide").
        child("halve and oil", "halve").
child("drain", "action").
    child("strain", "drain").
child("dust","action").
child("fill","action").
child("form","action").
child("grind","action").
child("heat", "action").
child("hull", "action").
child("infuse", "action").
    child("infuse in hot oil", "infuse").
child("put", "action").
    child("pour", "put").
        child("pour onto toast", "pour").
        child("pour into bowl", "pour").
    child("spread", "put").
        child("spread on toast", "spread").
    child("sprinkle", "put").
child("rinse", "action").
child("roast", "cook").
child("shell", "action").
child("serve", "action").
child("sift","action").
child("stir", "action").
    child("drizzle oil while stirring","stir").
    child("stir together", "stir").
        child("stir together vigorously", "stir together").
        child("stir until incorporated", "stir together").

child("thaw", "action").



% multistep
child("combine then roast", "roast").
child("combine then roast", "combine").
    child("add", "combine").
        child("top", "add").
        child("garnish", "add").
        child("season", "add").
    
%%TODO is rinse and drain a subtype of rinse?
child("rinse and drain", "rinse").
%%TODO is rinse and drain a subtype of drain?
child("rinse and drain", "drain").
child("fill and dust","dust").
child("fill and dust","fill").
child("mix and heat", "mix").
child("mix and heat", "heat").

child("baking agent","comestible").
    % these two should be aliases not siblings 
    child("bicarbonate of soda","baking agent"). 
    child("baking soda","baking agent").
    child("baking powder","baking agent").

child("bread", "comestible").
    child("sliced bread","bread").
    child("toast", "bread").
        child("plain toast", "toast").
        child("buttered toast", "toast").
child("cake","comestible").
    child("sponge cake","cake").
        child("victoria sponge","sponge cake").
        child("unfinished sponge cake","sponge cake").
        child("unfinished vegan sponge cake","unfinished sponge cake").
        child("vegan sponge cake","sponge cake").
child("fish", "comestible").
child("water", "comestible").
    child("boiling salted water", "water").
    child("pasta water", "water").
child("pasta", "comestible").
    child("spaghetti", "pasta").
        child("uncooked spaghetti", "spaghetti").
        child("undrained cooked spaghetti", "spaghetti").
        child("drained cooked spaghetti", "spaghetti").
    child("fusilli", "pasta").
        child("uncooked fusilli", "fusilli").
        child("undrained cooked fusilli", "fusilli").
        child("drained cooked fusilli", "fusilli").
child("pulses", "comestible").
    child("chick peas", "pulses").
        child("tinned chick peas", "chick peas").
        child("rinsed chick peas", "chick peas").
    child("cannellini beans", "pulses").
        child("tinned cannellini beans", "cannellini beans").
        child("drained cannellini beans", "cannellini beans").
        child("blended cannellini beans", "cannellini beans").
    child("edamame soybeans", "pulses").
        child("shelled edamame soybeans","edamame soybeans").
            child("frozen shelled edamame soybeans","shelled edamame soybeans").
            child("thawed shelled edamame soybeans","shelled edamame soybeans").
            child("thawed hulled edamame soybeans","hulled edamame soybeans").
        child("hulled edamame soybeans","edamame soybeans").

    child("baked beans", "pulses").
        child("heated beans", "baked beans").
child("mushrooms and fungi", "comestible").
    child("mushrooms", "mushrooms and fungi").
        child("button mushrooms", "mushrooms").
        child("white mushrooms", "mushrooms").
        child("quartered mushrooms", "mushrooms").
child("vegetable", "comestible").
    child("preserved vegetable","vegetable").
        child("sun-dried tomato", "preserved vegetable").
    child("aubergine", "vegetable").
        child("whole aubergine", "aubergine").
        child("oiled aubergine halves", "aubergine").
        child("roasted aubergine", "aubergine").
            child("roasted aubergine halves", "roasted aubergine").
            child("roasted aubergine flesh", "roasted aubergine").
            child("strained aubergine flesh", "roasted aubergine").
            child("roasted aubergine skin", "roasted aubergine").
        child("aubergine drippings", "aubergine").
    child("carrot", "vegetable").
        child("julienned carrots", "carrot").
    child("garlic", "vegetable").
        child("diced garlic", "garlic").
        child("whole garlic", "garlic").
        child("crushed garlic", "garlic").
        child("minced garlic", "garlic").
            child("frozen minced garlic", "minced garlic").
        %child("roasted peeled garlic", "roasted whole garlic").
        %child("roasted peeled garlic", "peeled garlic").
        child("roasted peeled garlic", "garlic").
    child("onion", "vegetable").
        child("raw onion rings","onion").
        child("chopped onion","onion").
            child("raw chopped onion", "chopped onion").
                child("finely chopped onion", "chopped onion").
        child("raw onion", "onion").
            child("raw chopped onion", "raw onion").
                child("raw finely chopped onion", "raw chopped onion").
                child("raw sliced onion", "raw chopped onion").
                    child("raw thinly sliced onion", "raw chopped onion").
        child("fried onion", "onion").
            child("browned onion", "onion").
        child("sliced onion", "onion").
    child("peas", "vegetable").
    child("potato", "vegetable").
        child("potato pieces", "potato").
    child("radish", "vegetable").
        child("sliced radish", "radish").
            child("thinly sliced radish", "radish").
    child("spinach","vegetable").
        child("frozen spinach","spinach").
        child("thawed spinach","spinach").
        child("chopped spinach","spinach").
    child("tomato", "vegetable").
        child("chopped tomato", "tomato").
        child("tomato paste", "tomato").
        child("pasata", "tomato").
        child("sun-dried tomato", "tomato").
            child("sun-dried tomato halves", "sun-dried tomato").
            child("chopped sun-dried tomatoes", "sun-dried tomato").

child("egg", "comestible").
    child("whole egg", "egg").
    child("beaten egg", "egg").
child("dairy","comestible").
    child("milk","dairy").
    child("yogurt","dairy").
        child("plain yogurt","yogurt").
child("milk or milk analog","comestible").
    child("milk","milk or milk analog").
    child("vegan milk analog","milk or milk analog").
        child("oat milk","vegan milk analog").
        child("cashew milk","vegan milk analog").
        child("almond milk","vegan milk analog").
        child("soya milk","vegan milk analog").
child("flour", "comestible").
    child("wheat flour", "flour").
        child("self-raising flour", "wheat flour").
        child("plain flour", "wheat flour").
    child("chickpea flour", "flour").
    child("besan flour", "flour").
    child("rice flour", "flour").
child("fruit", "comestible").
    child("lemon juice", "fruit").
child("dairy", "comestible").
    child("milk", "dairy").
    child("cheese", "dairy").
        child("grated cheese", "dairy").
child("dips", "comestible").
    child("hummus", "dips").
child("pastes", "comestible").
    child("tahini", "pastes").
child("fat", "comestible").
    child("ghee or vegetable oil", "comestible").
        child("ghee", "ghee or vegetable oil").
    child("ghee", "fat").
        child("unheated ghee", "ghee").
        child("heated ghee", "ghee").
child("oil", "fat").
    child("sunflower oil", "oil").
    child("vegetable oil", "oil").
    child("vegetable oil", "ghee or vegetable oil").

    child("olive oil", "oil").
        child("extra-virgin olive oil", "olive oil").
    child("unheated oil", "oil").
    child("heated oil", "oil").
        child("unchecked heated oil", "heated oil").
        child("oil ready for frying", "heated oil").
child("flavourings", "comestible").
    child("salt", "flavourings").
        child("kosher salt", "salt").
    child("spices", "flavourings").
        child("asafoetida","spices").
        child("chili", "spices").
            child("chopped chili","chili").
            child("cayenne pepper", "chili").
            child("serrano chili", "chili").
            child("chili powder", "chili").
            child("green chili", "chili").
                child("whole green chili", "green chili").
                child("chopped green chili", "green chili").
            child("red chili", "chili").
                child("dried red chili", "chili").
        child("cinnamon", "spices").
            child("ground cinnamon", "spices").
        child("coriander spice", "spices").
            child("ground coriander", "coriander spice").
        child("cumin", "spices").
            child("ground cumin", "cumin").
            child("cumin seeds", "cumin").
        child("fenugreek seeds","spices").
        child("garam masala","spices").
        child("ginger","spices").
            child("fresh ginger","ginger").
                child("grated fresh ginger","fresh ginger").
            child("grated ginger", "ginger").
                child("grated fresh ginger","grated ginger").
            child("ground ginger","ginger").
        child("mustard seeds", "spices").
            child("yellow mustard seeds","mustard seeds").
            child("brown mustard seeds","mustard seeds").
            child("black mustard seeds","mustard seeds").
        child("onion seeds", "spices").
            child("black onion seeds","onion seeds").

        child("paprika", "spices").
            child("smoked paprika", "paprika").
        child("turmeric", "spices").
            child("ground turmeric", "turmeric").
        child("vanilla seeds", "spices").
    child("herbs", "flavourings").
        child("cilantro", "herbs").
            child("chopped cilantro", "cilantro").
            child("fresh coriander", "cilantro").
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
        child("spice mixture", "mixture").
        
child("spreads", "comestible").
    child("butter", "spreads").
    child("butter", "fat").
        child("salted butter", "butter").
        child("unsalted butter", "butter").
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
    child("dish", "complex comestible").
        child("beans on toast", "dish").
        child("onion bhajias","dish").
        child("mushroom bhaji", "dish").
        child("onion bhajis","dish").
        child("green bhaji","dish").
        child("freshly fried bhajis","dish").
        child("onion bhajis with raita","dish").
        child("yogurt and mint raita","dish").
        child("indian potatoes with mustard seeds","dish").
        child("khumbi aur besan kibhaji", "dish").
    child("pasta sauce", "complex comestible").
        child("pomodoro sauce", "pasta sauce").
            child("cold pomodoro sauce", "pasta sauce").
            child("hot pomodoro sauce", "pasta sauce").
    child("creamed butter and sugar", "complex comestible").
    child("batter", "complex comestible").
        child("sponge batter", "batter").
        child("bhaji batter", "batter").
    child("preparation", "complex comestible").
        child("toasted spices", "spice mixture").
        child("bhaji spice mixture", "spice mixture").
        child("bhaji preparation", "preparation").
        child("bhaji paste", "preparation").
        child("masala paste", "preparation").
        child("fried masala mix", "preparation").
        child("fried garlic mixture", "preparation").
        child("garlic mushroom mixture", "preparation").
        child("floured mushroom mixture", "preparation").
        
        child("mushroom bhaji preparation", "preparation").
        child("sifted flour mix","preparation").
        child("battered onion and chilies","preparation").
        child("floured onion and chilies","preparation").
        child("spiced onion strands","preparation").
        child("vinegared onion mix","preparation").
        child("floured onions","preparation").
        child("formed onion balls","preparation").
        child("unfinished indian potatoes","preparation").

        child("unfinished green bhaji","preparation").

child("lemon-tahini blend","mixture").
child("hummus base","complex comestible").
child("untopped edamame hummus","complex comestible").
child("ungarnished edamame hummus","complex comestible").
child("edamame hummus","complex comestible").

child("coated vegetables", "preparation").
    child("coated onion", "coated vegetables").
child("drained bhajis", "preparation").
child("cooked bhajis", "dish").
child("onion and carrot bhajis", "dish").

child("spiced mixture","preparation").
    child("spiced onion mixture","spiced mixture").
    child("spiced potato mixture","spiced mixture").
    child("spiced mushroom mixture","spiced mixture").
    child("lemon spiced mushroom mixture","spiced mixture").
    child("spiced spinach mixture","spiced mixture").
child("spinach and onion bhajis", "dish").
child("cook seeds").
child("saute", "fry").

child("fried onion bhajis", "dish").
child("drained onion bhajis", "dish").
child("sattvic herbs bhaji","dish").
child("coriander chutney or cucumber raita", "complex comestible").
    child("coriander chutney","coriander chutney or cucumber raita").
    child("cucumber raita","coriander chutney or cucumber raita").
child("onion bhajis with chutney or raita", "dish").


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
% then we need to refine the hierarchy to support that. Either there is a hidden intermediate node or all similar siblings can also be used



