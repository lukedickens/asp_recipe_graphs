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


QUERY_DATA['arcs and types'] = {
    'parameters' : [],
    'programme' : """
        #show in/2.
        #show type_of/3.
        """,
    'requires' : ['graph_properties']}
QUERY_DATA['recipe_graph'] = {
    'parameters' : [],
    'programme' : """
        #show recipe_graph/1.
        """,
    'requires' : ['recipe_graphs']}
QUERY_DATA['recipes'] = {
    'parameters' : [],
    'programme' : """
        #show recipe/2.
        #show in/2.
        #show type_of/3.
        """,
    'requires' : ['recipe_graphs']}
QUERY_DATA['conflicting types'] = {
    'parameters' : [],
    'programme' : """
        #show conflicting_types_in/4.
        """,
    'requires' : ['recipe_graphs']}

QUERY_DATA['explain not recipe'] = {
    'parameters' : [],
    'programme' : """
        #show cyclic/1.
        #show -connected/1.
        #show empty/1.
        #show has_untyped_node/2.
        #show -well_typed_a_node/3.
        #show -well_typed_c_node/3.
        #show typed_graph/2.
        #show conflicting_types/4.
        """,
        # should also check for nodes that aren't c or a nodes, and arcs that aren't in the arcs set
    'requires' : ['recipe_graphs', 'debug_recipes']}

QUERY_DATA['untyped nodes'] = {
    'parameters' : [],
    'programme' : """
        #show has_untyped_node/2.
        #show well_typed_a_node/3.
        #show well_typed_c_node/3.
        #show -well_typed_a_node/3.
        #show -well_typed_c_node/3.
        #show typed_graph/2.
        #show in/2.
        #show action_type/1.
        #show comestible_type/1.
        #show conflicting_types/4.
        #show type_of/3.
        """,
        # should also check for nodes that aren't c or a nodes, and arcs that aren't in the arcs set
    'requires' : ['recipe_graphs', 'debug_recipes']}

QUERY_DATA['acceptability'] = {
    'parameters' : [],
    'programme' : """
        #show acceptability_tuple/3.
        """,
        # should also check for nodes that aren't c or a nodes, and arcs that aren't in the arcs set
    'requires' : ['acceptability']}


#QUERY_DATA['explain not recipe'] = {
#    'parameters' : [],
#    'programme' : """
#        #show -a_node_properly_connected/2.
#        #show cyclic/1.
#        #show -connected/1.
#        #show empty/1.
#        #show conflicting_types_in/4.
#        #show has_untyped_node/2.
#        #show c_node_not_comestible_type/2.
#        #show a_node_not_action_type/2.
#        """,
#        # should also check for nodes that aren't c or a nodes, and arcs that aren't in the arcs set
#    'requires' : ['recipe_graphs']}

QUERY_DATA['is recipe'] = {
    'parameters' : [],
    'programme' : """
        #show recipe/2.
        """,
    'requires' : ['recipe_graphs']}
    
QUERY_SUBDIR = os.path.join('asp_recipe_graphs', 'asp', 'queries')

def get_query_path(query, src_root_dir=SRC_ROOT_DIR):
    fname = QUERY_DATA[query]['fname']
    return os.path.join(src_root_dir, QUERY_SUBDIR, fname )
