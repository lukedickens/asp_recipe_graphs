import os
from asp_recipe_graphs.api.modules import SRC_ROOT_DIR

QUERY_DATA = {}

QUERY_DATA['cyclic'] = {
    'parameters' : [],
    'programme' : '#show cyclic/1.',
    'fname' : 'is_cyclic.lp',
    'requires' : ['graph_properties']}
QUERY_DATA['connected'] = {
    'parameters' : [],
    'programme' : '#show connected/1.',
    'fname' : 'is_connected.lp',
    'requires' : ['graph_properties']}
QUERY_DATA['arcs'] = {
    'parameters' : [],
    'programme' : """
        #show in/2.
        """,
    'requires' : ['graph_properties']}
QUERY_DATA['types'] = {
    'parameters' : [],
    'programme' : """
        #show type_of/3.
        """,
    'requires' : ['graph_properties']}
QUERY_DATA['recipes'] = {
    'parameters' : [],
    'programme' : """
        #show recipe/2.
        """,
    'requires' : ['recipe_graphs']}
    
QUERY_SUBDIR = os.path.join('asp_recipe_graphs', 'asp', 'queries')

def get_query_path(query, src_root_dir=SRC_ROOT_DIR):
    fname = QUERY_DATA[query]['fname']
    return os.path.join(src_root_dir, QUERY_SUBDIR, fname )
