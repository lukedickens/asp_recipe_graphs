import clingo

from asp_recipe_graphs.api.modules import get_dependencies
from asp_recipe_graphs.api.modules import get_module_path
from asp_recipe_graphs.api.queries import QUERY_DATA
from asp_recipe_graphs.api.queries import get_query_path

    
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

def load_and_solve(query, domain_files):
    ctl = clingo.Control()
    query_info = QUERY_DATA[query]
    parameters = query_info['parameters']
    programme = query_info['programme']
    dependencies = get_dependencies(query_info['requires'])
    load_modules(ctl, dependencies)
    load_paths(ctl, domain_files)
#    load_queries(ctl, [query])
    ctl.add(query, parameters, programme)
    ctl.add(programme)
    ctl.ground([("base",[]), (query, parameters)])
    ctl.solve(on_model=lambda m: print("Answer: {}".format(m)))
    
    
if __name__ == '__main__':
    fpaths = ['asp_recipe_graphs/asp/recipes/hummus_graph.lp']
    fpaths.append('asp_recipe_graphs/asp/recipes/hummus_types.lp')
#    fpaths = ['asp_recipe_graphs/asp/recipes/cannellini_hummus_graph.lp']
#    fpaths = ['asp_recipe_graphs/asp/recipes/cannellini_hummus_types.lp']
#    load_and_solve('connected', fpaths)    
#    load_and_solve('cyclic', fpaths)    
#    load_and_solve('arcs',fpaths)       
#    load_and_solve('types',fpaths)       
    load_and_solve('recipes',fpaths)       
    
