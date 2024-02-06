import clingo

def model_to_lp(m):
    temp = ""
    for t in m.symbols(atoms=True):
        temp += t.__str__()+".\n"
    return temp

def main():
    main = clingo.control.Control(['-Wno-atom-undefined'])
    main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/universal_types.lp")
    main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/type_hierarchies.lp")
    main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/graph_properties.lp")
    main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/recipe_graphs.lp")
    main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/recipe.lp")
    # main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/recipes/hummus_graph.lp")
    # main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/recipes/hummus_types.lp")
    # main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/recipes/fusilli_pomodoro_graph.lp")

    # INPUT RECIPE:
    main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/recipes/atomic_spaghetti_graph.lp")
    main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/recipes/atomic_spaghetti_types.lp")

    # OTHER RECIPES:
    main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/recipes/atomic_fusilli_graph.lp")
    main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/recipes/atomic_fusilli_types.lp")
    #main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/recipes/atomic_fusilli_alt_graph.lp")
    #main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/recipes/atomic_fusilli_alt_types.lp")

    main.ground([("base", [])])
    with main.solve(yield_=True) as handle:
        for m in handle:
            #print(m) # --> shows the model
            model = m

    first_model = model_to_lp(model)
    # print(first_model)

    # creates a new grounder and solver
    main2 = clingo.control.Control(['-Wno-atom-undefined'])
    main2.add("base", [], first_model)
    main2.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/queries/acceptability_tuples.lp")
    main2.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/input_output_sets.lp")
    main2.ground([("base", [])])

    print("----------")

    main2.configuration.solve.models = 0
    with main2.solve(yield_=True) as handle:
        for m in handle:
            # print(m) # --> shows the model
            model = m

    # second model has extracted acceptability tuples from provided input recipe
    second_model = model_to_lp(model)
    # print(second_model)

    # creates a new grounder and solver
    main3 = clingo.control.Control([])
    main3.add("base", [], second_model)
    main3.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/recipe.lp")
    main3.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/input_output_sets.lp")
    #main3.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/substitution.lp")
    #main3.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/universal_types.lp")
    #main3.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/type_hierarchies.lp")
    # main3.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/graph_properties.lp")
    # main3.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/recipe_graphs.lp")
    #main3.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/acceptability.lp")
    main3.ground([("base", [])])

    print("----------")
    main3.configuration.solve.models = 0
    with main3.solve(yield_=True) as handle:
        for m in handle:
            print(m) # --> shows the model

if __name__ == "__main__":
    main()