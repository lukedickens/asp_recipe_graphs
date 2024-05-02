import os
from asp_recipe_graphs.api.modules import SRC_ROOT_DIR
from asp_recipe_graphs.api.modules import SHOW_DIR

#acceptability_tuples.lp  is_connected.lp     show_recipe.lp                     used_child.lp
#atomic_recipe_graph.lp   is_cyclic.lp        not_properly_connected_graph.lp  why_not_recipe_graph.lp
#badly_defined_type.lp    show_recipe_graph.lp  used_ancestor.lp                 why_not_recipe.lp

# ideally the dependencies here would also be auto discovered just as for the 
# domain independent modules
SHOW_DATA = {}
SHOW_DATA['is_cyclic'] = {
    'requires' : ['graph_properties']}
SHOW_DATA['is_connected'] = {
    'parameters' : [],
    'requires' : ['graph_properties']}
SHOW_DATA['arcs'] = {
    'requires' : ['graph_properties']}
SHOW_DATA['types'] = {
    'requires' : ['graph_properties','type_hierarchies']}
SHOW_DATA['arcs_and_types'] = {
    'requires' : ['graph_properties','type_hierarchies']}
SHOW_DATA['show_recipe_graph'] = {
    'parameters' : [],
    'requires' : ['recipe_graphs']}
SHOW_DATA['show_recipe'] = {
    'requires' : ['recipes']}
SHOW_DATA['why_not_recipe_graph'] = {
    'requires' : ['graph_properties']}
SHOW_DATA['why_not_recipe'] = {
    'requires' : ['graph_properties', 'recipe_graphs', 'type_hierarchies']}
    
SHOW_DATA['describe_recipe_graphs'] = {
    'requires' : ['recipe_graphs']}
SHOW_DATA['describe_recipes'] = {
    'requires' : ['recipes']}

SHOW_DATA['used_child'] = {
    'requires' : ['universal_types','type_hierarchies']}

SHOW_DATA['show_child'] = {
    'requires' : ['type_hierarchies']}

def get_show_path(call, src_root_dir=SRC_ROOT_DIR):
    path = SHOW_DATA[call]['path']
    return path

def generate_show_data(show_data=SHOW_DATA, show_dir=SHOW_DIR):
    files = os.listdir(show_dir)
    show_paths = { f[:-3]:path for f in files \
        if f[-3:] == '.lp' and os.path.isfile((path := os.path.join(SHOW_DIR, f))) }
    for call_name, this_data in show_data.items():
        show_path = show_paths[call_name]
        this_data['parameters'] = list()
        this_data['path'] = show_path
        with open(show_path, 'r') as ifile:
            this_data['programme'] = ''.join(ifile.readlines())
    return show_data

## now update call data dictioary with these new details    
SHOW_DATA = generate_show_data(show_data=SHOW_DATA)
CALLS = list(SHOW_DATA.keys())
    
    
if __name__ == '__main__':
    call_files = os.listdir(SHOW_DIR)
    print(f"call_files = {call_files}")
    call_names = [ f[:-3] for f in call_files \
        if f[-3:] == '.lp' and os.path.isfile(os.path.join(SHOW_DIR, f)) ]
    print(f"call_names = {call_names}")
        
    show_paths = { f[:-3]:path for f in call_files \
        if f[-3:] == '.lp' and os.path.isfile((path := os.path.join(SHOW_DIR, f))) }
            
    print(f"show_paths = {show_paths}")
    example_call_name = 'why_not_recipe'
    with open(show_paths[example_call_name],'r') as ifile:
        text = ifile.readlines()
    print(f"text = {text}")
