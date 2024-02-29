import os
from asp_recipe_graphs.api.modules import SRC_ROOT_DIR
from asp_recipe_graphs.api.modules import RECIPES_DIR
import warnings

GRAPH_INDICATOR = 'graph'
TF_INDICATOR = 'types'
TUPLES_INDICATOR = 'tuples'
GIVEN_INDICATOR = 'given'



def detect_recipes(recipes_dir=RECIPES_DIR):
    files = os.listdir(recipes_dir)
    recipe_file_paths = { f[:-3]:path for f in files \
        if f[-3:] == '.lp' \
            and os.path.isfile((path := os.path.join(RECIPES_DIR, f))) }
    recipe_graph_paths = {}
    recipe_type_function_paths = {}
    for short_name, path in recipe_file_paths.items():
#        print(f"short_name = {short_name}")
        GLEN  = len(GRAPH_INDICATOR) 
        TLEN  = len(TF_INDICATOR) 
        if short_name.endswith(GRAPH_INDICATOR):
            recipe_graph_paths[short_name[:-GLEN-1]] = path
        elif short_name.endswith(TF_INDICATOR):
            recipe_type_function_paths[short_name[:-TLEN-1]] = path
        elif short_name.endswith(TUPLES_INDICATOR):
            pass
        elif short_name.endswith(GIVEN_INDICATOR):
            pass
        else:
            warnings.warn(f"Unrecognised recipe file:\n\t{path}")
    return recipe_graph_paths, recipe_type_function_paths

RECIPE_GRAPH_PATHS, RECIPE_TYPE_FUNCTION_PATHS = \
    detect_recipes(recipes_dir=RECIPES_DIR)
    
#RECIPES = set(RECIPE_GRAPH_PATHS.keys()).union(set(RECIPE_TYPE_FUNCTION_PATHS.keys()))
RECIPES = set(RECIPE_GRAPH_PATHS.keys())
RECIPES |= set(RECIPE_TYPE_FUNCTION_PATHS.keys())
