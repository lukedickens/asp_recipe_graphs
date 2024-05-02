import re
import graphviz
import os

from asp_recipe_graphs.api.modules import SRC_ROOT_DIR
RESULTS_DIR = os.path.join(SRC_ROOT_DIR, 'results')
RECIPE_GRAPH_RESDIR = os.path.join(RESULTS_DIR, 'recipe_graphs')
RECIPE_RESDIR = os.path.join(RESULTS_DIR, 'recipe')
TYPE_GRAPH_RESDIR = os.path.join(RESULTS_DIR, 'types')

RES_C_OR_A = '(?:c|a)\([0-9]+\)'
RES_FIND_ARC = fr'arc\(({RES_C_OR_A}),({RES_C_OR_A})\)'
RES_FIND_ARCS_GRAPH = fr'arcs\(([a-zA-Z][a-zA-Z_]*)\)'
RE_FIND_ARCS = re.compile(fr'(?:^|\s)in\(arcs\(([a-z][a-z_]*)\),{RES_FIND_ARC}\)')
RE_RMV_BRCK = re.compile('(\(|\))')

RES_VAR_OR_CONST = '[a-zA-Z][a-zA-Z_]*'
RES_STRING = '"[a-z][a-zA-Z0-9, \-]*"'
RES_FIND_ARCS_GRAPH = fr'arcs\(([a-zA-Z][a-zA-Z_]*)\)'
RE_FIND_TYPE_OF = re.compile(fr'(?:^|\s)type_of\(({RES_VAR_OR_CONST}),({RES_C_OR_A}),({RES_STRING})\)')

RE_FIND_RECIPE = re.compile(fr'(?:^|\s)recipe\(({RES_VAR_OR_CONST}),({RES_VAR_OR_CONST})\)')

RE_FIND_USED_CHILDS = re.compile(
    fr'used_child\(({RES_STRING}),({RES_STRING})\)')

GRAPH_TYPES = ['recipe_graph', 'recipe', 'types', 'compressed_types']

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
            dot.node(n, label=node_str,
            style='filled', color='yellow', shape='box')
        elif node_type =='c':
            dot.node(n, label=node_str,
            style='filled', color='gray', shape='oval')
    for arc_desc in arcs:
        source = arc_desc['source']
        target = arc_desc['target']
        dot.edge(source, target)
    return dot
    
def recipe_graph_to_dot_node_descs(graph):
    nodes = {}
    for arc in graph:
        type_ = arc['type_']
        source = arc['source']
        target = arc['target']
        type_ = arc['type_']
        nodes[source] = {'type_': type_[0], 'str_': source}
        nodes[target] = {'type_': type_[1], 'str_': target}
    return nodes

def type_function_to_dot_node_descs(type_function):
    nodes = {}
    for node, name in type_function.items():
        node_desc = {}
        node_desc['type_'] = node[0]
        node_desc['str_'] = node + ':' + name
        nodes[node] = node_desc
    return nodes

def recipe_to_dot(recipe_id, graphs, type_functions):
    gid, tfid = recipe_id
    arcs = graphs[gid]
    type_function = type_functions[tfid]
    nodes = type_function_to_dot_node_descs(type_function)
    return graph_to_dot(nodes, arcs)

def recipe_graph_to_dot(graph_id, graphs):
    graph = graphs[graph_id]
    nodes = recipe_graph_to_dot_node_descs(graph)
    return graph_to_dot(nodes, graph)

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

## Type hierarchies
def create_type_hierarchy_graph(neighbours):
    dot = graphviz.Digraph()
    seen = set()
    for source, targets in neighbours.items():
        if not source in seen:
            dot.node(
                source, label=source,
                style='filled', color='skyblue', shape='oval')
            seen.add(source)
        for target in targets:
            dot.edge(source,target)
            if not target in seen:
                dot.node(target, label=target,
                style='filled', color='skyblue', shape='oval')
                seen.add(target)
    return dot


def parse_type_hierarchy(asp_model, root='comestible', child_predicate='used_child'):
    neighbours = {}
    re_find_childs = re.compile(
        fr'{child_predicate}\(({RES_STRING}),({RES_STRING})\)')
    for child, parent in re_find_childs.findall(asp_model):
        parent = parent.strip('"')
        child = child.strip('"')
        these_children = neighbours.get(parent, set())
        these_children.add(child)
        neighbours[parent] = these_children
    neighbours = isolate_hierarchy(neighbours, root)
    return neighbours

def isolate_hierarchy(neighbours, root):
    nodes = set([root])
    seen = set()
    while nodes:
        node = nodes.pop()
        seen.add(node)
        nodes |= neighbours.get(node,set()) - seen
    return { n:neighbours[n] for n in seen if n in neighbours }

