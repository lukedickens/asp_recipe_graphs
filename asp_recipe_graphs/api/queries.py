import os
from asp_recipe_graphs.api.modules import SRC_ROOT_DIR
from asp_recipe_graphs.api.modules import QUERIES_DIR

#acceptability_tuples.lp  is_connected.lp     is_recipe.lp                     used_child.lp
#atomic_recipe_graph.lp   is_cyclic.lp        not_properly_connected_graph.lp  why_not_recipe_graph.lp
#badly_defined_type.lp    is_recipe_graph.lp  used_ancestor.lp                 why_not_recipe.lp

# ideally the dependencies here would also be auto discovered just as for the 
# domain independent modules
QUERY_DATA = {}
QUERY_DATA['is_cyclic'] = {
    'requires' : ['graph_properties']}
QUERY_DATA['is_connected'] = {
    'parameters' : [],
    'requires' : ['graph_properties']}
QUERY_DATA['arcs'] = {
    'requires' : ['graph_properties']}
QUERY_DATA['types'] = {
    'requires' : ['graph_properties']}
QUERY_DATA['arcs_and_types'] = {
    'requires' : ['graph_properties']}
QUERY_DATA['is_recipe_graph'] = {
    'parameters' : [],
    'requires' : ['recipe_graphs']}
QUERY_DATA['is_recipe'] = {
    'requires' : ['recipe']}
QUERY_DATA['why_not_recipe_graph'] = {
    'requires' : ['graph_properties']}
QUERY_DATA['why_not_recipe'] = {
    'requires' : ['graph_properties', 'recipe_graph', 'type_hierarchies']}
QUERY_DATA['acceptability_tuples'] = {
    'requires' : ['acceptability']}
    
QUERY_DATA['describe_recipe_graphs'] = {
    'requires' : ['recipe_graphs']}
QUERY_DATA['describe_recipes'] = {
    'requires' : ['recipe']}

def generate_query_data(query_data=QUERY_DATA, queries_dir=QUERIES_DIR):
    files = os.listdir(queries_dir)
    query_paths = { f[:-3]:path for f in files \
        if f[-3:] == '.lp' and os.path.isfile((path := os.path.join(QUERIES_DIR, f))) }
    print(f"query_paths = {query_paths}")
    for query_name, this_data in query_data.items():
        query_path = query_paths[query_name]
        this_data['parameters'] = list()
        this_data['path'] = query_path
        with open(query_path, 'r') as ifile:
            this_data['programme'] = ''.join(ifile.readlines())
QUERY_DATA = generate_query_data(query_data=QUERY_DATA)
    
QUERY_SUBDIR = os.path.join('asp_recipe_graphs', 'asp', 'queries')

def get_query_path(query, src_root_dir=SRC_ROOT_DIR):
    path = QUERY_DATA[query]['path']
    return path
    
    
if __name__ == '__main__':
    query_files = os.listdir(QUERIES_DIR)
    print(f"query_files = {query_files}")
    query_names = [ f[:-3] for f in query_files \
        if f[-3:] == '.lp' and os.path.isfile(os.path.join(QUERIES_DIR, f)) ]
    print(f"query_names = {query_names}")
#    query_paths = { name: os.path.join(QUERIES_DIR, f) \
#        for name, f in zip(query_names, query_files)}
        
    query_paths = { f[:-3]:path for f in query_files \
        if f[-3:] == '.lp' and os.path.isfile((path := os.path.join(QUERIES_DIR, f))) }
            
    print(f"query_paths = {query_paths}")
    example_query_name = 'why_not_recipe'
    with open(query_paths[example_query_name],'r') as ifile:
        text = ifile.readlines()
    print(f"text = {text}")
