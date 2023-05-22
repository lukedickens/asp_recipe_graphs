import re
import graphviz




RES_C_OR_A = '(?:c|a)\([0-9]+\)'
RES_FIND_ARC = fr'arc\(({RES_C_OR_A}),({RES_C_OR_A})\)'
RES_FIND_ARCS_GRAPH = fr'arcs\(([a-zA-Z][a-zA-Z_]*)\)'
RE_FIND_ARCS = re.compile(fr'(?:^|\s)in\(arcs\(([a-z][a-z_]*)\),{RES_FIND_ARC}\)')
RE_RMV_BRCK = re.compile('(\(|\))')

RES_VAR_OR_CONST = '[a-zA-Z][a-zA-Z_]*'
RES_STRING = '"[a-z][a-zA-Z, \-]*"'
RES_FIND_TYPE_OF = fr'arc\(({RES_C_OR_A}),({RES_C_OR_A})\)'
RES_FIND_ARCS_GRAPH = fr'arcs\(([a-zA-Z][a-zA-Z_]*)\)'
RE_FIND_TYPE_OF = re.compile(fr'(?:^|\s)type_of\(({RES_VAR_OR_CONST}),({RES_C_OR_A}),({RES_STRING})\)')

RE_FIND_RECIPE = re.compile(fr'(?:^|\s)recipe\(({RES_VAR_OR_CONST}),({RES_VAR_OR_CONST})\)')

def remove_brackets(str_):
    return str_.replace('(','').replace(')','')

# extract graphs (arcs), type functions and recipes (graph,function) pairs
# from asp model strings
def get_graphs(asp_model):
    graphs = {}
    for gid, source, target in RE_FIND_ARCS.findall(asp_model):
        source = remove_brackets(source)
        target = remove_brackets(target)
        type_ = source[0]+target[0]
        graph_arcs = graphs.get(gid, list())
        graph_arcs.append({'type_':type_,'source':source,'target':target})
        graphs[gid] = graph_arcs
    return graphs

def get_type_functions(asp_model):
    type_functions = {}
    for tfid, node, name in RE_FIND_TYPE_OF.findall(asp_model):
        mapping = type_functions.get(tfid, dict())
        node = remove_brackets(node)
        mapping[node] = name
        type_functions[tfid] = mapping
    return type_functions

def get_recipes(asp_model):
    return RE_FIND_RECIPE.findall(asp_model)

# dot support code
def extract_nodes_from_typed_arcs(typed_arcs):
    nodes = {}
    for arc_desc in typed_arcs:
        type_ = arc_desc['type_']
        source = arc_desc['source']
        target = arc_desc['target']
        nodes[source] = {'type_': type_[0], 'str_': str(source)}
        nodes[target] = {'type_': type_[1], 'str_': str(target)}
    return nodes

def typed_arcs_to_dot(typed_arcs):
    nodes = extract_nodes_from_typed_arcs(typed_arcs)
    dot = graph_to_dot(nodes, typed_arcs)
    return dot

def graph_to_dot(nodes, arcs):
    dot = graphviz.Digraph()
    for n, node_desc in nodes.items():
        node_type = node_desc['type_']
        node_str = node_desc['str_']
        if node_type =='a':
            dot.node(n, label=node_str, style='filled', color='yellow', shape='box')
        elif node_type =='c':
            dot.node(n, label=node_str, style='filled', color='gray', shape='oval')
    for arc_desc in arcs:
        source = arc_desc['source']
        target = arc_desc['target']
        dot.edge(source, target)
    return dot
    
def type_function_to_dot_nodes(type_function):
    nodes = {}
    for node, name in type_function.items():
        node_desc = {}
        node_desc['type_'] = node[0]
        node_desc['str_'] = node + ':' + name
        nodes[node] = node_desc
    return nodes

def recipe_graph_to_dot(recipe, graphs, type_functions):
    gid, tfid = recipe
    arcs = graphs[gid]
    type_function = type_functions[tfid]
    nodes = type_function_to_dot_nodes(type_function)
    return graph_to_dot(nodes, arcs)

# unlike the above graphs which relate to recipes this is a graph
# of the module dependency structure.
def create_dependency_graph(dependency_map):
    dot = graphviz.Digraph()
    for k in dependency_map.keys():
        dot.node(k, label=k)
    for source, targets in dependency_map.items():
        for target in targets:
            dot.edge(source,target)
    return dot

