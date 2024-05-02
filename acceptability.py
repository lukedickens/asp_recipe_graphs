import clingo
from clingo import script

script.enable_python()

def main():
    main = clingo.control.Control([])
    main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/universal_types.lp")
    main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/type_hierarchies.lp")
    main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/graph_properties.lp")
    main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/recipe_graphs.lp")
    main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/recipe.lp")
    main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/recipes/buttered_toast_graph.lp")
    main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/recipes/buttered_toast_types.lp")
    main.load("/Users/dasaro/Desktop/asp_recipe_graphs/asp_recipe_graphs/asp/domain_independent/input_output_set_alt.lp")
    main.ground([("base", [])])
    with main.solve(yield_=True) as handle:
        for m in handle:
            print(m)

if __name__ == "__main__":
    main()
