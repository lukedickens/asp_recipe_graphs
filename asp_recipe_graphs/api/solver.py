import clingo

from asp_recipe_graphs.api.modules import get_dependencies
from asp_recipe_graphs.api.modules import get_module_path
from asp_recipe_graphs.api.queries import QUERY_DATA
from asp_recipe_graphs.api.queries import get_query_path

from asp_recipe_graphs.api.recipes import RECIPE_GRAPH_PATHS
from asp_recipe_graphs.api.recipes import RECIPE_TYPE_FUNCTION_PATHS

def load_modules(ctl, modules):
    print("loading...")
    for m in modules:
        fpath = get_module_path(m)
        print(f"fpath ={fpath}")
        ctl.load(fpath)

def load_queries(ctl, queries):
    for q in queries:
        fpath = get_query_path(q)
        print(f"fpath ={fpath}")
        ctl.load(fpath)
        
def load_paths(ctl, paths):
    for fpath in paths:
        print(f"fpath ={fpath}")
        ctl.load(fpath)


def load_and_solve_recipes(
        query, recipes, domain_files=None, include_graphs=True,
        include_type_functions=True,
        recipe_graph_paths=RECIPE_GRAPH_PATHS,
        recipe_type_function_paths=RECIPE_TYPE_FUNCTION_PATHS):
    print(f"recipe_graph_paths = {recipe_graph_paths}")
    print(f"recipe_type_function_paths = {recipe_type_function_paths}")
    if domain_files is None:
        domain_files = []
    for recipe in recipes:
        if include_graphs:
            domain_files.append(recipe_graph_paths[recipe])
        if include_type_functions:
            domain_files.append(recipe_type_function_paths[recipe])
    return load_and_solve(query, domain_files, additional_asp=None)
    

def load_and_solve(query, domain_files, additional_asp=None):
    ctl = clingo.Control()
    query_info = QUERY_DATA[query]
    parameters = query_info['parameters']
    programme = query_info['programme']
    dependencies = get_dependencies(query_info['requires'])
    load_modules(ctl, dependencies)
    load_paths(ctl, domain_files)
#    load_queries(ctl, [query])
#    ctl.add(query, parameters, programme)
    ctl.add(programme)
    if not additional_asp is None:
        ctl.add(additional_asp)
    ctl.ground([("base",[]), (query, parameters)])
    models = []
#    ctl.solve(on_model=lambda m: print("Answer: {}".format(m)))
    ctl.solve(on_model=lambda m: models.append(str(m)))
    return models
    
if __name__ == '__main__':
    fpaths = ['asp_recipe_graphs/asp/recipes/hummus_graph.lp']
    fpaths.append('asp_recipe_graphs/asp/recipes/hummus_types.lp')
    load_and_solve('recipes',fpaths)       
    
