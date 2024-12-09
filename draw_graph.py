import os

from asp_recipe_graphs.api.asp2graph import create_dependency_graph
from asp_recipe_graphs.api.asp2graph import get_graphs
from asp_recipe_graphs.api.asp2graph import typed_arcs_to_dot
from asp_recipe_graphs.api.asp2graph import get_type_functions
from asp_recipe_graphs.api.asp2graph import get_recipes
from asp_recipe_graphs.api.asp2graph import recipe_graph_to_dot
from asp_recipe_graphs.api.asp2graph import recipe_to_dot
from asp_recipe_graphs.api.asp2graph import GRAPH_TYPES
from asp_recipe_graphs.api.asp2graph import parse_type_hierarchy
from asp_recipe_graphs.api.asp2graph import create_type_hierarchy_graph
from asp_recipe_graphs.api.asp2graph import RECIPE_RESDIR
from asp_recipe_graphs.api.asp2graph import RECIPE_GRAPH_RESDIR
from asp_recipe_graphs.api.asp2graph import TYPE_GRAPH_RESDIR

from asp_recipe_graphs.api.solver import load_and_solve
from asp_recipe_graphs.api.recipes import RECIPES

from asp_recipe_graphs.api.recipes import RECIPE_GRAPH_PATHS
from asp_recipe_graphs.api.recipes import RECIPE_TYPE_FUNCTION_PATHS


def recipe_graphs_to_fpaths_and_str(recipe_graphs,
        recipe_graph_paths=RECIPE_GRAPH_PATHS):
    """
    recipe_graphs - 
        string containing recipe graph name or recipe graph names (comma separated).
    """
    # find the file paths
    fpaths =[]
    recipe_graph_list = recipe_graphs.split(',')
    for rid in recipe_graph_list:
        graph_fpath = recipe_graph_paths[rid]
        fpaths.append(graph_fpath)
    return fpaths, '_'.join(recipe_graph_list)

def recipes_to_fpaths_and_str(recipes,
        recipe_graph_paths=RECIPE_GRAPH_PATHS,
        recipe_type_function_paths=RECIPE_TYPE_FUNCTION_PATHS):
    """
    recipes - 
        string containing recipe or recipes (comma separated).
    """
    # find the file paths
    fpaths =[]
    recipe_list = recipes.split(',')
    for rid in recipe_list:
        graph_fpath = recipe_graph_paths[rid]
        types_fpath = recipe_type_function_paths[rid]
        fpaths.append(graph_fpath)
        fpaths.append(types_fpath)
    return fpaths, '_'.join(recipe_list)

def load_and_draw_recipe(
        recipe='beans_on_toast', **kwargs):
    fpaths, recipe_name = recipes_to_fpaths_and_str(recipe)
    
    # recipe identifier
    graph_id, typef_id = (f'rg_{recipe}',f'tf_{recipe}')
    # run the asp to get the arcs and types
    asp_model = load_and_solve('arcs_and_types',fpaths)[0]
    # parses asp_model string to get the graph info
    graphs = get_graphs(asp_model)
    # parses the asp model string to get type function info
    type_functions = get_type_functions(asp_model)
    dot = recipe_to_dot((graph_id, typef_id), graphs, type_functions)
    bare_ofname = os.path.join(RECIPE_RESDIR,recipe_name)
    ofname = dot.render(bare_ofname)
    print(f"recipe graph for {recipe} saved to:\n\t{ofname}")

def load_and_draw_recipe_graph(
        recipe='beans_on_toast', outdir=RECIPE_GRAPH_RESDIR, **kwargs):
#    # find the file path (just one graph)
    fpaths, recipe_graph_name = recipe_graphs_to_fpaths_and_str(recipe)
    print(f"fpaths = {fpaths}")
    print(f"recipe_graph_name = {recipe_graph_name}")
    # recipe identifier
    graph_id = f'rg_{recipe}'
    # run the asp to get the arcs and types
    asp_model = load_and_solve('arcs',fpaths)[0]
    # parses asp_model string to get the graph info
    graphs = get_graphs(asp_model)
    print(f"graph_id = {graph_id}")
    dot = recipe_graph_to_dot(graph_id, graphs)
    bare_ofname = os.path.join(outdir, recipe_graph_name)
    ofname = dot.render(bare_ofname)
    print(f"recipe graph for {recipe_graph_name} saved to:\n\t{ofname}")

def load_and_draw_type_hierarchy(recipe=None, base_type=None, hierarchy_fpath=None, **kwargs):
    print(f"Creating type hierarchy for recipe(s): {recipe}")
    fpaths, recipes_name = recipes_to_fpaths_and_str(recipe)
    fpaths.append(hierarchy_fpath)
    asp_model = load_and_solve('used_child',fpaths)[0]
    parent2children = parse_type_hierarchy(asp_model, root=base_type, child_predicate='used_child')
    print(f"parent2children = {parent2children}")
    dot = create_type_hierarchy_graph(parent2children)
    ofstem = recipes_name+'_'+base_type
    bare_ofname = os.path.join(TYPE_GRAPH_RESDIR,ofstem)
    ofname = dot.render(bare_ofname)
    print(f"Type hierarchy for {recipe} saved to:\n\t{ofname}")

def draw_preexisting_type_hierarchy(fpath=None, base_type=None, **kwargs):
    print(f"Creating type hierarchy in {fpath}")
    fpaths = [fpath ]
    asp_model = load_and_solve('show_child',fpaths)[0]
    parent2children = parse_type_hierarchy(asp_model, root=base_type, child_predicate='child')
    dot = create_type_hierarchy_graph(parent2children)
    ofstem = fpath.split('/')[-1].split('.')[0] +'_'+base_type
    bare_ofname = os.path.join(TYPE_GRAPH_RESDIR,ofstem)
    ofname = dot.render(bare_ofname)
    print(f"Type hierarchy from {fpath} saved to:\n\t{ofname}")

def main(graph_type=None, **kwargs):
    if graph_type == 'recipe_graph':
        load_and_draw_recipe_graph(**kwargs)
    elif graph_type == 'recipe':
        load_and_draw_recipe(**kwargs)
    elif graph_type == 'types':
        recipe = kwargs.pop('recipe',None)
        if not recipe is None:
            load_and_draw_type_hierarchy(recipe, **kwargs)
        else:
            fpath = kwargs.get('hierarchy_fpath',None)
            draw_preexisting_type_hierarchy(fpath, **kwargs)
    else:
        raise ValueError(f"graph_type {graph_type} not recognised")


def create_parser():
    description= """
        Provides functionality to draw graphs of ASP results"""
    parser = argparse.ArgumentParser(
        prog='draw_graph',
        description=description,
        epilog='See git repository readme for more details.')

    graph_type_options = GRAPH_TYPES
    parser.add_argument('--graph-type', '-t', type=str,
        choices=graph_type_options,
        help='Specify type of graph you wish to plot')
    parser.add_argument('--base-type', '-b', type=str,
        default='comestible',
        help='Specify base type')
    parser.add_argument('--recipe', '-r', type=str,
        help='Specify recipe by identifier')
    parser.add_argument('--hierarchy-fpath', type=str, default='./asp_recipe_graphs/asp/domains/universal_types.lp')
    return parser
    
if __name__ == '__main__':
    import argparse
    args = create_parser().parse_args()
    main(**vars(args))    

