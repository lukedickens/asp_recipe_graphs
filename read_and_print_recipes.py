import re
from typing import List, Dict

class Node:
    """Represents a node in the recipe graph."""
    def __init__(self, node_type: str, id: int):
        self.node_type = node_type  # 'c' or 'a'
        self.id = id

    def __repr__(self):
        return f"{self.node_type}({self.id})"

    def __eq__(self, other):
        if isinstance(other, Node):
            return self.node_type == other.node_type and self.id == other.id
        return False

    def __hash__(self):
        return hash((self.node_type, self.id))
        

class Arc:
    """Represents a directed arc between nodes in the recipe graph."""
    def __init__(self, from_node: Node, to_node: Node):
        self.from_node = from_node
        self.to_node = to_node

    def __repr__(self):
        return f"arc({self.from_node}, {self.to_node})"

    def str_signature(self, graph_name):
        return f"arc, {graph_name}, {self.from_node}, {self.to_node}"

    def tuple_form(self, graph_name):
        return "arc", graph_name, self.from_node, self.to_node


class RecipeGraph:
    """Represents a recipe graph with nodes and arcs."""
    def __init__(self, name: str):
        self.name = name
        self.nodes: List[Node] = []  # Store nodes by ID
        self.arcs: List[Arc] = []

    def add_node(self, node_type: str, node_id: int):
        node = Node(node_type, node_id)
        if node not in self.nodes:
            self.nodes.append(node)
        return node

    def get_node(self, node_type: str, node_id: int):
        node = Node(node_type, node_id)
        if node not in self.nodes:
            raise ValueError(f'Node {node} not present')
        return node

    def add_arc(self, from_type, from_id, to_type, to_id):
        # Ensure the nodes are created in the graph before adding the arc
        from_node = self.add_node(from_type, from_id)
        to_node = self.add_node(to_type, to_id)
        # Add the arc
        arc = self._add_arc(from_node, to_node)
        return arc
    

    def _add_arc(self, from_node: Node, to_node: Node):
        """
        Internal helper add arc. Assumes that nodes have already been
        retrieved/created
        """
        if from_node and to_node:
#            print(f"adding arc {from_node}-> {to_node}")
            arc = Arc(from_node, to_node)
            if not arc in self.arcs:
                self.arcs.append(arc)
#            print(self.arcs)
            return arc
        raise ValueError(f'{from_node} and {to_node} are not both nodes')

    def __repr__(self):
        return f"RecipeGraph(name={self.name}, nodes={self.nodes}, arcs={self.arcs})"

    def to_db(self):
        graph_decl = self.str_signature()
        arcs_decl = [ iterable_to_csv_string(tuple_form) \
            for tuple_form in self.tuple_form_arcs() ]
        return graph_decl, arcs_decl

    def str_signature(self):
        return iterable_to_csv_string(self.tuple_form_signature())

    def tuple_form_signature(self):
        return "recipe_graph", self.name

    def tuple_form_arcs(self):
        return [ arc.tuple_form(self.name) for arc in self.arcs  ]



class TypingFunction:
    """Maps nodes to their types with names."""
    def __init__(self, name: str):
        self.name = name
        self.types: Dict[Node, str] = {}  # Maps nodes to their types

    def _add_type_of(self, node: Node, node_name: str):
        self.types[node] = node_name

    def add_type_of(self, node_type, node_id, type_name):
        node = Node(node_type, node_id)
        # Update the typing function
        self._add_type_of(node, type_name)

    def __repr__(self):
        return f"TypingFunction(name={self.name}, types={self.types})"

    def to_db(self):
        typing_decl = self.str_signature()
        types_decl = [ iterable_to_csv_string(tuple_form) \
            for tuple_form in self.tuple_form_types() ]
        return typing_decl, types_decl

    def str_signature(self):
        return iterable_to_csv_string(self.tuple_form_signature())

    def tuple_form_signature(self):
        return "typing_function", self.name

    def tuple_form_types(self):
        return [
            ("type_of", self.name, node, type_label) \
                for node, type_label in self.types.items()  ]

class Recipe:
    """Represents an entire recipe including graph and typing."""
    def __init__(
            self, name: str, typing_name: str,
            graph:RecipeGraph=None,
            typing_func:TypingFunction=None):
        # adds empty graph and typing function by default
        self.graph = graph 
        if self.graph is None:
            self.graph = RecipeGraph(name)
        self.typing_func = typing_func
        if self.typing_func is None:
            self.typing_func = TypingFunction(typing_name)

    def __repr__(self):
        return f"Recipe(name={self.graph.name}, graph={self.graph}, typing_func={self.typing_func})"
        
    def to_db(self):
        recipe_decl = self.str_signature()
        graph_decl, arcs_decl = self.graph.to_db()
        typing_decl, types_decl = self.typing_func.to_db()
        return recipe_decl, graph_decl, arcs_decl, typing_decl, types_decl

    @classmethod
    def db_types(cls):
        return [
            "recipe", "recipe_graph", "arc", "typing_function", "type_of"]

    def str_signature(self):
        return iterable_to_csv_string(self.tuple_form_signature())

    def tuple_form_signature(self):
        return ("recipe", self.graph.name, self.typing_func.name)




class RecipeCorpus:
    recipe_graph_pattern = re.compile(r"recipe_graph\((\w+)\)\.")
    arc_pattern = re.compile(
        r"in\(arcs\((\w+)\),arc\((\w)\((\d+)\),(\w)\((\d+)\)\)\)\.")
    type_of_pattern = re.compile(
        r"type_of\((\w+),(\w)\((\d+)\),\"([^\"]+)\"\)\.")
    recipe_pattern = re.compile(
        r"(?:given_)?recipe\((\w+),(\w+)\)\.")
#    given_recipe_pattern = re.compile(
#        r"given_"+recipe_pattern.pattern)

    """Represents an entire recipe including graph and typing_func."""
    def __init__(self):
        self.recipes: Dict[str,Recipe] = {}
        self.graphs: Dict[str,RecipeGraph] = {}
        self.typing_functions: Dict[str,TypingFunction] = {}

    def add_recipe(self, graph_name, typing_name):
        if (graph_name, typing_name) in self.recipes:
            recipe = self.recipes[(graph_name, typing_name)]
        else:
            graph = self.add_graph(graph_name)
            typing_function = self.add_typing_function(typing_name)
            recipe = Recipe(
                graph_name, typing_name, graph=graph, typing_func=typing_function)
            self.recipes[(graph_name, typing_name)] = recipe
#        print(f"added recipe: {recipe}")
#        print(f"list(self.recipes.items()) = {list(self.recipes.items())}")
#        print(f"list(self.graphs.items()) = {list(self.graphs.items())}")
        return recipe
        
    def add_graph(self, graph_name):
        if graph_name in self.graphs:
            graph = self.graphs[graph_name]
        else:
            graph = RecipeGraph(graph_name)
            self.graphs[graph_name] = graph
        return graph
        
    def add_typing_function(self, typing_name):
        if typing_name in self.typing_functions:
            typing_function = self.typing_functions[typing_name]
        else:
            typing_function = TypingFunction(typing_name)
            self.typing_functions[typing_name] = typing_function
        return typing_function
        
    def add_arc(self, graph_name, from_type, from_id, to_type, to_id):
        # either add graph or retrieve it
        graph = self.add_graph(graph_name)
        arc = graph.add_arc(from_type, from_id, to_type, to_id)
        return arc
        
    def add_type_of(self, typing_func_name, node_type, node_id, type_name):
        typing_func = self.add_typing_function(typing_func_name)
        type_of = typing_func.add_type_of(
            node_type, node_id, type_name)
        return type_of
    
                
    def read_in_asp_line(self, line):
#        print(f"parsing:\n{line}")
        # Match the recipe and typing_func names
        # Match and process arcs
        if match := self.arc_pattern.match(line):
#            print("matches arc pattern")
            graph_name, from_type, from_id, to_type, to_id = match.groups()
            # format ids to integers
            from_id, to_id = int(from_id), int(to_id)
            # Add the arc
            self.add_arc(graph_name, from_type, from_id, to_type, to_id)
        # Match the recipe graph name
        elif match := self.recipe_graph_pattern.match(line):
#            print("matches recipe graph pattern")
            graph_name = match.group(1)
            self.add_graph(graph_name)
        # match a recipe
        elif match := self.recipe_pattern.match(line):
#            print("matches recipe pattern")
            recipe_name, typing_name = match.groups()
            self.add_recipe(recipe_name, typing_name)
        # Match and process types
        elif match := self.type_of_pattern.match(line):
            print("matches type of pattern")
            typing_func_name, node_type, node_id, type_name = match.groups()
            node_id = int(node_id)
            self.add_type_of(typing_func_name, node_type, node_id, type_name)

    def __repr__(self):
        n_g = len(self.graphs)
        n_t = len(self.typing_functions)
        n_r = len(self.recipes)
        return f'RecipeCorpus({n_g} graphs, {n_t} typing_functions, {n_r} recipes)'

    def read_in_asp_file(self, ifpath):            
        with open(ifpath, 'r') as ifile:
            for line in ifile.readlines():
                line = line.strip()
                self.read_in_asp_line(line)

    def read_in_asp_files(self, ifpaths):
        #        
        for ifpath in ifpaths:
            print(f"reading {ifpath}")
            self.read_in_asp_file(ifpath)

    @classmethod
    def create_corpus(cls, ifpaths):
        corpus = RecipeCorpus()
        corpus.read_in_asp_files(ifpaths)
        return corpus        
        
def iterable_to_csv_string(iterable):
    return ','.join(
        f'"{element}"' if type(element) is str else str(element) \
            for element in iterable)



def parse_asp_recipe_old(asp_text: str) -> Recipe:
    print(f"Parsing recipe:\n{asp_text}\n\n")
    # Regex patterns for parsing
    recipe_graph_pattern = re.compile(r"recipe_graph\((\w+)\)\.")
    arc_pattern = re.compile(r"in\(arcs\((\w+)\),arc\((\w)\((\d+)\),(\w)\((\d+)\)\)\)\.")
    type_of_pattern = re.compile(r"type_of\((\w+),(\w)\((\d+)\),\"([^\"]+)\"\)\.")
    recipe_pattern = re.compile(r"recipe\((\w+),(\w+)\)\.")
    given_recipe_pattern = re.compile(r"given_"+recipe_pattern.pattern)

    # Initialize variables
    recipe_name = None
    typing_name = None
    recipe = None

    # Go through each line
    for line in asp_text.splitlines():
        line = line.strip()
#        print(f"processing: {line}")
        # Match the recipe and typing_func names
        if match := given_recipe_pattern.match(line):
            recipe_name, typing_name = match.groups()
#            print(f"given_recipe_pattern match: {recipe_name}, {typing_name}")
            recipe = Recipe(recipe_name, typing_name)
            continue

        # Match the recipe graph name
        if match := recipe_graph_pattern.match(line):
#            print("recipe_graph_pattern match")
            graph_name = match.group(1)
            if recipe is None:
                recipe = Recipe(graph_name, typing_name)  # If recipe wasn't created by previous rule

        # Match and process arcs
        elif match := arc_pattern.match(line):
            graph_name, from_type, from_id, to_type, to_id = match.groups()
            from_id, to_id = int(from_id), int(to_id)
#            from_node = Node(from_type, from_id)
#            to_node = Node(to_type, t_id)
            # Ensure the nodes are created in the graph before adding the arc
            from_node = recipe.graph.add_node(from_type, from_id)
            to_node = recipe.graph.add_node(to_type, to_id)
            # Add the arc
            recipe.graph._add_arc(from_node, to_node)

        # Match and process types
        elif match := type_of_pattern.match(line):
            typing_func_name, node_type, node_id, type_name = match.groups()
            node_id = int(node_id)
            node = Node(node_type, node_id)
            # Update the typing function
            recipe.typing_func._add_type_of(node, type_name)
#            # Update the node's name in the recipe graph
#            if node_id in recipe.graph.nodes:
#                recipe.graph.nodes[node_id].name = type_name

    return recipe


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser(prog='read_and_print_recipes', usage='%(prog)s [options]')
    parser.add_argument('ifpaths', nargs='+', help='Filenames of ASP files')
    args = parser.parse_args()
    kwargs = vars(args)
    print(f"kwargs = {kwargs}")
    corpus = RecipeCorpus.create_corpus(**kwargs)
    print(corpus)
    print()
    
    
        
    for i, db_type in enumerate(Recipe.db_types()):
        print(f"# {db_type}")
        for recipe_name, recipe in corpus.recipes.items():
            output = recipe.to_db()
            element = output[i]
            if type(element) is str:
                print(element)
            else:
                for subelement in element:
                    print(subelement)
    print()
#                    
#    print(list(corpus.recipes.items()))
#    print(list(corpus.graphs.items()))
#    print(list(corpus.typing_functions.items()))
#    print()
    
#    typing_func = corpus.typing_functions['tf_bbc_vegan_sponge_cake']
#    print(f"typing_func = {typing_func}")
#    signature, type_of_lines = typing_func.to_db()
#    for line in type_of_lines:
#        print(line)

#    # Example ASP input
#    asp_text = """
#    % recipe
#    given_recipe(rg_buttered_toast,tf_buttered_toast).
#    % graph
#    recipe_graph(rg_buttered_toast).
#    in(arcs(rg_buttered_toast),arc(c(0),a(0))).
#    in(arcs(rg_buttered_toast),arc(c(1),a(0))).
#    in(arcs(rg_buttered_toast),arc(a(0),c(2))).
#    % typing function
#    recipe(rg_buttered_toast,tf_buttered_toast).
#    type_of(tf_buttered_toast,c(0),"butter").
#    type_of(tf_buttered_toast,c(1),"plain toast").
#    type_of(tf_buttered_toast,c(2),"buttered toast").
#    type_of(tf_buttered_toast,a(0),"spread on toast").
#    """

#    # Parse the ASP text and print the recipe object
#    recipe = parse_asp_recipe(asp_text)
#    print(recipe)
#    
#    print("database output")
#    example_arc = recipe.graph.arcs[0].str_signature(recipe.graph.name)
#    print(f'example_arc = "{example_arc}"')
#    example_graph, example_arcs = recipe.graph.to_db()
#    print(f'example_graph = "{example_graph}"')
#    print(f'example_arcs = {example_arcs}')
#    example_typing, example_types = recipe.typing_func.to_db()
#    print(f'example_typing = "{example_typing}"')
#    print(f'example_types = {example_types}')
#    
#    print("All in one:")
#    recipe_decl, graph_decl, arcs_decl, typing_decl, types_decl = recipe.to_db()
#    print(recipe_decl)
#    print(graph_decl)
#    for arc_decl in arcs_decl:
#        print(arc_decl)
#    print(typing_decl)
#    for type_decl in types_decl:
#        print(type_decl)
#        
#    
#    print("And again from tuple forms")
#    tuple_form_graph = recipe.graph.tuple_form_signature()
#    print(iterable_to_csv_string(tuple_form_graph))
#    for tuple_form_arc in recipe.graph.tuple_form_arcs():
#        print(iterable_to_csv_string(tuple_form_arc))
#    tuple_form_typing = recipe.typing_func.tuple_form_signature()
#    print(iterable_to_csv_string(tuple_form_typing))
#    for tuple_form_type in recipe.typing_func.tuple_form_types():
#        print(iterable_to_csv_string(tuple_form_type))

