# ASP recipe graphs

The code in this repository is for reasoning about ingredient substitution and various properties of cooking recipes that have been represented in graphical form. Specifically, it is an implementation of the formalism described in [BDD+24] "A Graphical Formalism for Commonsense Reasoning with Recipes", by Antonis Bikakis , Aissatou Diallo , Luke Dickens, Anthony Hunter and Rob Miller. 

The code is written in the Potassco (Clingo) dialect of Answer Set Programming (ASP). It is assumed that the user has a working knowledge of ASP, and has a version of Python enablled Clingo installed (see https://potassco.org/). For reasons of efficiency and clarity, the code has been split into several .lp files contained within various subdirectories of this repository. Depending on the computational task at hand, an appropriate subset (variable length list) of these files can be added as an argument to a single command-line call to Clingo.

NOTE: The remainder of this README file assumes the user has a command line compatible with Posix style commands and arguments. In particular we assume it is able to interpret calls of the form

```shell
call path/{file1,file2,...}.lp
```
as

```shell
call path/file1.lp path/file1.lp ...
```

## Quick-start: Paper Examples

Later in this README we describe a general use of the library. First, we list a series of executions that correspond to examples in Section 10 of [BDD+24]. Each command should be executed from within the root directory of the Git repository, hereafter referred to as `'.'`.

### Testing recipe graph for spaghetti-pomodoro

To test whether the graph for spaghetti-pomodoro (in file `'./asp_recipe_graphs/asp/recipes/spaghetti_pomodoro_graph.lp'`) satisfies the requirements of  a recipe graph, run:

```shell
clingo -e cautious ./asp_recipe_graphs/asp/domain_independent/{graph_properties,recipe_graphs}.lp ./asp_recipe_graphs/asp/recipes/spaghetti_pomodoro_graph.lp ./asp_recipe_graphs/asp/show/show_recipe_graph.lp
```

This should give the following as part of the output:

```shell
Solving...
Answer: 1
recipe(rg_spaghetti_pomodoro,tf_spaghetti_pomodoro)
Consequences: [1;1]
SATISFIABLE
```
This demonstrates that `'recipe(rg_spaghetti_pomodoro,tf_spaghetti_pomodoro)'` is a logical consequence of the program, since the `'-e cautious'` flag directs Clingo to output only literals present in all answer sets.

### Testing recipe spaghetti-pomodoro

To test whether the graph and type function for spaghetti-pomodoro (in files `'./asp_recipe_graphs/asp/recipes/spaghetti_pomodoro_graph.lp'` and  `'./asp_recipe_graphs/asp/recipes/spaghetti_pomodoro_types.lp'`) satisfies the requirements of  a recipe, run:

```
clingo -e cautious ./asp_recipe_graphs/asp/domain_independent/{graph_properties,recipe_graphs,type_hierarchies,recipes}.lp asp_recipe_graphs/asp/domains/universal_types.lp ./asp_recipe_graphs/asp/recipes/spaghetti_pomodoro_{graph,types}.lp ./asp_recipe_graphs/asp/show/show_recipe.lp
```

This should give the following as part of the output:

```shell
Solving...
Answer: 1
recipe(rg_spaghetti_pomodoro,tf_spaghetti_pomodoro)
Consequences: [1;1]
SATISFIABLE
```

### Testing type substitution

To find type substitutions for spaghetti-pomodoro. Which is defined across files `'./asp_recipe_graphs/asp/recipes/spaghetti_pomodoro_{graph,types,given}.lp'` and the additional tuples corresponding to fusilli-pomodoro which are in file `'./asp_recipe_graphs/asp/recipes/fusilli_pomodoro_tuples.lp'` you can run:

```shell
clingo 0 --quiet=1 asp_recipe_graphs/asp/domain_independent/{type_hierarchies,graph_properties,recipe_graphs,recipes,acceptability_tuples,validity,type_substitution}.lp asp_recipe_graphs/asp/domains/pomodoro_types.lp asp_recipe_graphs/asp/recipes/spaghetti_pomodoro_{graph,types,given}.lp asp_recipe_graphs/asp/recipes/fusilli_pomodoro_tuples.lp asp_recipe_graphs/asp/domains/spaghetti_pomodoro_type_substitution.lp asp_recipe_graphs/asp/show/show_type_substitution.lp
```

This should give the following as part of the output (which has been formatted by piping to `sed 's/) /)\n/g'` for improved readability):

```shell
Solving...
Answer: 2
primary_substitution((rg_spaghetti_pomodoro,tf_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub),c(1),"uncooked fusilli")
type_substitution(rg_spaghetti_pomodoro,tf_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub)
valid_recipe(rg_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub)
secondary_substitution((rg_spaghetti_pomodoro,tf_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub),c(2),"undrained cooked fusilli")
secondary_substitution((rg_spaghetti_pomodoro,tf_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub),c(7),"drained cooked fusilli")
secondary_substitution((rg_spaghetti_pomodoro,tf_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub),c(8),"fusilli in bowl")
secondary_substitution((rg_spaghetti_pomodoro,tf_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub),c(9),"fusilli pomodoro")
Optimization: -10
OPTIMUM FOUND
```

This shows the type substitution with the minimal cost with respect to the size of the secondary substitution set, assuming a 0-1 distance for types. (See [BDD+24] for alternative cost measures). The minimal cost substitution is implemented using Clingo's `#maximise` operator, maximising the overlap between the two type functions, in this case `tf_spaghetti_pomodoro` and `tf_spaghetti_pomodoro_sub`. The `'0'` flag directs Clingo to compute all answer sets, whereas the `'--quiet=1'` flag directs Clingo to display only the answer set representing the optimum solution.

# General Usage

## Running ASP

For the following examples,
* `<ASPDIR>` refers to the directory in which the asp files are stored. If your working directory is the root of the repository, this is likely to be `./asp_recipe_graphs/asp`. 
* `<RECIPES>` is (are) the file(s) containing your recipe in ASP format. ASP recipes are stored in directory `<ASPDIR>/recipes/` in two parts: the graph part with suffix `_graph.lp` and the type function with suffix  `_types.lp`. Many commands can take more than one recipe as input, and so you can use wildcards (`*`) or other methods to pass multiple recipes in.
* `<TYPEHIERARCHY>` is a file that contains your ASP type hierarchy. There is a universal type hierarchy in ASP module `<ASPDIR>/domains/universal_types.lp`. However, this can be slow (very slow) to compute for some commands, so you are encouraged to use a minimal type hierarchy for more complex calls, as described below. 
* `<ASPMODULES>` is a comma separated list of the domain independent modules you wish to use. Posix command lines will expand `<ASPDIR>/domain_independent/{<ASPMODULES>}.lp` to give all `.lp` terminating filepaths for modules whose name is in `<ASPMODULES>` that sit in the appropriate directory. The success or otherwise of your command will depend on whether you have a sufficient list of ASP-modules. If you include modules you don't need, this may slow down the computation.


In what follows, two main standard forms of command are used:

```shell
clingo -e cautious <ASPDIR>/domain_independent/{<ASPMODULES>}.lp <TYPEHIERARCHY> <RECIPES> <SHOWMODULE>
```
is used where we want to find and display logical consequences of the input program modules, i.e. literals that are present in all answer sets (true in all models) of the program. The '`-e cautious`' flag indicates this mode of use of Clingo. Such calls are appropriate, for example, where we want to check whether a recipe (or other data structure) fully defined within the program satisfies one of the definitions in [BDD+24].

Alternatively, when we want to use program modules in a 'generative' way, for example to generate variants of a recipe containing various ingredient substitutions, then each answer set may represent an alternative solution. In this case the appropriate form of call is:

```shell
clingo 0 <ASPDIR>/domain_independent/{<ASPMODULES>}.lp <TYPEHIERARCHY> <RECIPES> <SHOWMODULE>
```
where the `0` directs Clingo to compute all answer sets. The additional flag `'--quiet=1'` may be included where we want Clingo to display only the answer set containing an optimal solution (see e.g. the type substitution example above).


In all cases `<SHOWMODULE>` is typically of the form `<ASPDIR>/show/<SHOWNAME>.lp`. You can thus write your own `#show` directives or use those already in the folder `<ASPDIR>/show`.

### Recipe Graphs

The standard command to check whether all the graphs in `<RECIPES>` are recipe graphs is:

```shell
clingo -e cautious <ASPDIR>/domain_independent/{graph_properties,recipe_graphs}.lp <RECIPES> <ASPDIR>/show/show_recipe_graph.lp
```

If any graphs are not recipe graphs then this will be `UNSATISFIABLE`, otherwise it will list all recipe_graphs in `<RECIPES>`.

**Example: Check if  BBC vegan sponge cake graph is a recipe graph** We can do this with the following call:

```
clingo -e cautious asp_recipe_graphs/asp/domain_independent/{graph_properties,recipe_graphs}.lp asp_recipe_graphs/asp/recipes/bbc_vegan_sponge_cake_graph.lp asp_recipe_graphs/asp/show/show_recipe_graph.lp
```

This should be `SATISFIABLE` and output `recipe_graph(rg_bbc_vegan_sponge_cake)` .

**Example: Imperfect recipe graph definitions.** Imagine instead that I have a recipe graph poorly defined in file `scratch/not_a_recipe.lp`, then the following should be  `UNSATISFIABLE`:

```
clingo -e cautious asp_recipe_graphs/asp/domain_independent/{graph_properties,recipe_graphs}.lp scratch/not_a_recipe_graph.lp asp_recipe_graphs/asp/show/show_recipe_graph.lp
```

To understand why this is not a recipe-graph I can run the `why_not_recipe_graph` call with:

```shell
clingo -e cautious asp_recipe_graphs/asp/domain_independent/graph_properties.lp scratch/not_a_recipe_graph.lp asp_recipe_graphs/asp/show/why_not_recipe_graph.lp
```

This will output predicates associated with offending properties, see `asp_recipe_graphs/asp/show/why_not_recipe_graph.lp` for a description. 

**Note:** that the `why_not_recipe_graph` call, excludes the `recipe_graph` module, otherwise ASP will return `UNSATISFIABLE`.

**Note:** Files in the `scratch` directory are, by default, not commited to `git` (via a line in `.gitignore`). Therefore you can use this as a safe space to create files and explore functionality without accidentally adding the files to your version history.

### Recipes

The standard command to check whether the recipes in `<RECIPES>` are properly defined recipes is:

```
clingo -e cautious <ASPDIR>/domain_independent/{graph_properties,recipe_graphs,recipes}.lp <TYPEHIERARCHY> <RECIPES> <ASPDIR>/show/show_recipe.lp
```


If any graphs are not recipe graphs then this will be `UNSATISFIABLE`, otherwise it will list all recipe_graphs in `<RECIPES>`.

**Example: Is BBC Vegan Sponge Cake a recipe?** - check if BBC the 'vegan sponge cake' graph and type function constitute a recipe with the call:

```
clingo -e cautious asp_recipe_graphs/asp/domain_independent/{graph_properties,recipe_graphs,type_hierarchies,recipes}.lp asp_recipe_graphs/asp/domains/universal_types.lp asp_recipe_graphs/asp/recipes/bbc_vegan_sponge_cake_{graph,types}.lp asp_recipe_graphs/asp/show/show_recipe.lp
```

This should be `SATISFIABLE` and output `recipe(rg_bbc_vegan_sponge_cake,tf_bbc_vegan_sponge_cake)` .

**Example: Imperfect recipe definitions.** Imagine instead that we have a recipe (graph and types) poorly defined in file `scratch/not_a_recipe.lp` then the following will be `UNSATISFIABLE`:

```shell
clingo -e cautious asp_recipe_graphs/asp/domain_independent/{graph_properties,recipe_graphs,type_hierarchies,recipes}.lp asp_recipe_graphs/asp/domains/universal_types.lp scratch/not_a_recipe.lp asp_recipe_graphs/asp/show/show_recipe.lp
```

To understand why this is not a recipe we can run the `why_not_recipe_graph` to determine if the recipe-graph is well formed. If the graph is fine, then we can run `why_not_recipe` to reveal problems with the typing function:

```shell
clingo -e cautious asp_recipe_graphs/asp/domain_independent/{graph_properties,recipe_graphs,type_hierarchies}.lp asp_recipe_graphs/asp/domains/universal_types.lp scratch/not_a_recipe.lp asp_recipe_graphs/asp/show/why_not_recipe.lp
```

This will output predicates associated with offending properties, see `asp_recipe_graphs/asp/show/why_not_recipe.lp` for a description.

**Note:** that the `why_not_recipe` call, excludes the `recipe` module, since otherwise ASP will return `UNSATISFIABLE`.

### Given recipes

For later calls, such as type substitution, we disinguish between given recipes (those that are treated as background knowledge) and candidate recipes. Every recipe in the folder `asp_recipe_graphs/asp/recipes/` is formed of two files, one ending in `..._graph.lp` which specifies the recipe graph and one ending in  `..._types.lp` which specifies the type function. A third file is also included, ending in  `..._given.lp`, which can otionally be incorporated in a call to declare that the recipe is accepted background knowledge. The three files must be called together to declare a given recipe. To see the distinction between given and candidate recipes, consider the following examples.


**Example: Baba ganoush as a given recipe** - we declare the Baba Ganoush recipe to be a given recipe and call this with:

```shell
clingo -e cautious asp_recipe_graphs/asp/domain_independent/{graph_properties,recipe_graphs,type_hierarchies,recipes}.lp asp_recipe_graphs/asp/domains/universal_types.lp asp_recipe_graphs/asp/recipes/baba_ganoush_{graph,types,given}.lp asp_recipe_graphs/asp/show/show_{given_,}recipe.lp
```

Note the use of the three files `asp_recipe_graphs/asp/recipes/baba_ganoush_{graph,types,given}.lp` and show module `asp_recipe_graphs/asp/show/show_given_recipe.lp`.

When run this should give the following as part of the output:

```shell
Answer: 1
given_recipe(rg_baba_ganoush,tf_baba_ganoush) recipe(rg_baba_ganoush,tf_baba_ganoush)
Consequences: [2;2]
SATISFIABLE
```

So `(rg_baba_ganoush,tf_baba_ganoush)` is both a recipe and a given recipe.

**Example: Baba ganoush as a recipe, but not a given recipe** - we declare the Baba Ganoush recipe to be a given recipe and call this with:

```shell
clingo -e cautious asp_recipe_graphs/asp/domain_independent/{graph_properties,recipe_graphs,type_hierarchies,recipes}.lp asp_recipe_graphs/asp/domains/universal_types.lp asp_recipe_graphs/asp/recipes/baba_ganoush_{graph,types}.lp asp_recipe_graphs/asp/show/show_{given_,}recipe.lp
```

Note the use of just two recipe files `asp_recipe_graphs/asp/recipes/baba_ganoush_{graph,types}.lp` and show module `asp_recipe_graphs/asp/show/show_given_recipe.lp`.

When run this should give the following as part of the output:

```shell
Answer: 1
recipe(rg_baba_ganoush,tf_baba_ganoush)
Consequences: [1;1]
SATISFIABLE
```


### Type Hierarchies

If you are using the universal type hierarchy you can simply add `universal_types` to your list of `<ASPMODULES>`. Then simply use the command:

`clingo -e cautious <ASPDIR>/domain_independent/{<ASPMODULES>}.lp <RECIPES> <SHOWMODULE>`

However this can be slow. To easily create your own type hierarchy or hierarchies for recipes in `<RECIPES>` then use:

```
clingo -e cautious <ASPDIR>/domain_independent/{type_hierarchies,recipe_graphs,graph_properties}.lp asp_recipe_graphs/asp/domains/universal_types.lp  <RECIPES> <ASPDIR>/show/used_child.lp
```

This outputs a stable model with terms of the form `used_child(A,B)`. Copy these to a new file at some location (hereafter called `<TYPEHIERARCHY>`) then edit to replace `used_child` with `child` and `) ` with `). ` universally. `<TYPEHIERARCHY>` can then be used in place of `<ASPDIR>/domains/universal_types.lp` as a minimal type-hierarchy.

**Note:** The above command uses the universal type hierarchy and pulls out the types that are used from there. If the type does not appear in the universal hierarchy then it won't appear in the derived hierarchy which will cause issues later on. Therefore, we suggest you ensure that your recipes are all `SATISFIABLE` with the universal types hierarchy first before performing this hierarchy compression.

For even greater speed use `used_ancestor` rather than `used_child`.

**Example: Compressed hierarchy for buttered toast** With the repository root as present working directory run the following command:

```shell
clingo -e cautious asp_recipe_graphs/asp/domain_independent/{type_hierarchies,recipe_graphs,graph_properties}.lp asp_recipe_graphs/asp/domains/universal_types.lp asp_recipe_graphs/asp/recipes/buttered_toast_{graph,types}.lp asp_recipe_graphs/asp/show/used_child.lp
```

This should output (something like) the following:

```shell
used_child("butter","spreads") used_child("spreads","comestible") used_child("plain toast","toast") used_child("toast","bread") used_child("bread","comestible") used_child("buttered toast","toast") used_child("spread on toast","spread") used_child("spread","put") used_child("put","action")
```

Edit this, as described, to give the following:

```shell
child("butter","spreads"). child("spreads","comestible"). child("plain toast","toast"). child("toast","bread"). child("bread","comestible"). child("buttered toast","toast"). child("spread on toast","spread"). child("spread","put"). child("put","action").
```

Then save in an appropriate `.lp` file, e.g. `scratch/buttered_toast_type_hierarchy.lp`.

### Acceptability Tuples

To output the acceptability tuples you can derive from a `recipe`, use:

```
clingo -e cautious <ASPDIR>/domain_independent/{type_hierarchies,recipe_graphs,recipes,graph_properties,acceptability}.lp  <TYPEHIERARCHY> <RECIPES> <ASPDIR>/show/acceptability_tuples.lp
```

**Example: Acceptability tuples derived from fusilli pomodoro** With the repository root as present working directory, run the following command:

```shell
clingo -e cautious asp_recipe_graphs/asp/domain_independent/{type_hierarchies,graph_properties,recipe_graphs,recipes,acceptability_tuples}.lp asp_recipe_graphs/asp/domains/universal_types.lp asp_recipe_graphs/asp/recipes/fusilli_pomodoro_{graph,types}.lp asp_recipe_graphs/asp/show/derived_acceptability_tuples.lp
```

This will output all acceptability tuples from the chosen recipe. The following is part of the output (again piped through `sed 's/) /)\n/g'` for readability):

```shell
Answer: 1
candidate_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)))
candidate_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)))
candidate_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)))
candidate_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(3)))
candidate_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)))
action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)),"boil for 10 min")
action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)),"mix and heat")
action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)),"drain")
action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(3)),"pour into bowl")
action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)),"mix in bowl")
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)),"undrained cooked fusilli",1)
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)),"hot pomodoro sauce",1)
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)),"drained cooked fusilli",1)
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(3)),"fusilli in bowl",1)
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)),"fusilli pomodoro",1)
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)),"pasta water",2)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)),"boiling salted water",1)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)),"cold pomodoro sauce",1)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)),"undrained cooked fusilli",1)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(3)),"drained cooked fusilli",1)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)),"fusilli in bowl",1)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)),"uncooked fusilli",2)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)),"fried onion",2)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)),"hot pomodoro sauce",2)
Consequences: [10;24]
SATISFIABLE
```

**Note:** The recipe is passed without declaring it to be a `given_recipe`. As a result, the acceptability tuples output are `candidate_acceptability_tuples`. See below for the results of a `given_recipe`.

**Note:** The above command runs the call using the universal type hierarchy. This can take a long time for larger recipes in particular, so you may prefer to use a type hierarchy that includes fewer elements. See below for using a specialised hierarchy.

**Example: Acceptability tuples derived from given recipe fusilli pomodoro** With the repository root as present working directory, run the following command:

```shell
clingo -e cautious asp_recipe_graphs/asp/domain_independent/{type_hierarchies,graph_properties,recipe_graphs,recipes,acceptability_tuples}.lp asp_recipe_graphs/asp/domains/universal_types.lp asp_recipe_graphs/asp/recipes/fusilli_pomodoro_{graph,types,given}.lp asp_recipe_graphs/asp/show/derived_acceptability_tuples.lp
```

This will output all acceptability tuples from the chosen recipe. The following is part of the output (again piped through `sed 's/) /)\n/g'` for readability):

```shell
Answer: 1
given_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)))
given_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)))
given_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)))
given_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(3)))
given_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)))
action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)),"boil for 10 min")
action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)),"mix and heat")
action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)),"drain")
action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(3)),"pour into bowl")
action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)),"mix in bowl")
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)),"undrained cooked fusilli",1)
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)),"hot pomodoro sauce",1)
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)),"drained cooked fusilli",1)
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(3)),"fusilli in bowl",1)
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)),"fusilli pomodoro",1)
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)),"pasta water",2)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)),"boiling salted water",1)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)),"cold pomodoro sauce",1)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)),"undrained cooked fusilli",1)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(3)),"drained cooked fusilli",1)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)),"fusilli in bowl",1)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)),"uncooked fusilli",2)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)),"fried onion",2)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)),"hot pomodoro sauce",2)
Consequences: [10;24]
SATISFIABLE
```

The only difference from the previous output is that the acceptability tuples are all now `given_acceptability_tuples` rather than `candidate_acceptability_tuples`.


**Example: Acceptability tuples derived from fusilli pomodoro recipe using specialised hierarchy** With the repository root as present working directory, and a compressed type hierarchy stored in `asp_recipe_graphs/asp/domains/pomodoro_types.lp`, run the following command:

```shell
clingo -e cautious asp_recipe_graphs/asp/domain_independent/{type_hierarchies,graph_properties,recipe_graphs,recipes,acceptability_tuples}.lp  asp_recipe_graphs/asp/domains/pomodoro_types.lp asp_recipe_graphs/asp/recipes/fusilli_pomodoro_{graph,types,given}.lp asp_recipe_graphs/asp/show/derived_acceptability_tuples.lp
```

The output should be the same as for the previous command.


### Validating candidate tuples

This requires a candidate recipe, namely a recipe (graph and type function) that is not a given recipe. You can experiment using the recipe files in the `<ASPDIR>/recipes` directory with filenames of the form `<RECIPENAME>_graph.lp` and `<RECIPENAME>_types.lp`, but not of the form `<RECIPENAME>_given.lp`. You will also need to provide a set of given acceptability tuples. Some examples of these can be found in the `<ASPDIR>/recipes` directory with filenames of the form `<RECIPENAME>_tuples.lp`. Again this can be a computationally expensive call, so you are advised to create a compressed hierarchy with only the types of interest within it and place this in `<DOMAIN_TYPE_HIERARCHY>`. The general call to determine which nodes in your candidate recipe are valid is:

```shell
clingo -e cautious <ASPDIR>/domain_independent/{type_hierarchies,graph_properties,recipe_graphs,recipes,acceptability_tuples,validity}.lp  <DOMAIN_TYPE_HIERARCHY> <ASPDIR>/recipes/<RECIPENAME>_tuples.lp <ASPDIR>/candidate_recipes/<RECIPENAME>_{graph,types}.lp <ASPDIR>/show/is_valid_candidate.lp
```

**Example: Valid candidate tuples derived from fusilli pomodoro candidate recipe using specialised hierarchy** With the repository root as present working directory, a candidate recipe in `asp_recipe_graphs/asp/candidate_recipes/fusilli_pomodoro_{graph,types}.lp` and a compressed type hierarchy stored in `asp_recipe_graphs/asp/domains/pomodoro_types.lp`, run the following command:

```shell
clingo -e cautious asp_recipe_graphs/asp/domain_independent/{type_hierarchies,graph_properties,recipe_graphs,recipes,acceptability_tuples,validity}.lp asp_recipe_graphs/asp/domains/pomodoro_types.lp asp_recipe_graphs/asp/recipes/fusilli_pomodoro_{graph,types,tuples}.lp asp_recipe_graphs/asp/show/show_validated_candidate_tuples.lp
```

The above command piped through our `sed` command includes the following output:

```shell
Answer: 1
candidate_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)))
candidate_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)))
candidate_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)))
candidate_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(3)))
candidate_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)))
action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)),"mix in bowl")
valid_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)))
action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(3)),"pour into bowl")
valid_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(3)))
action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)),"drain")
valid_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)))
action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)),"mix and heat")
valid_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)))
action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)),"boil for 10 min")
valid_acceptability_tuple((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)))
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)),"undrained cooked fusilli",1)
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)),"hot pomodoro sauce",1)
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)),"drained cooked fusilli",1)
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)),"pasta water",2)
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(3)),"fusilli in bowl",1)
output_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)),"fusilli pomodoro",1)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)),"boiling salted water",1)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)),"uncooked fusilli",2)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)),"cold pomodoro sauce",1)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)),"fried onion",2)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)),"undrained cooked fusilli",1)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(3)),"drained cooked fusilli",1)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)),"fusilli in bowl",1)
input_element_position((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)),"hot pomodoro sauce",2)
SATISFIABLE
```

Each of the acceptability tuples discovered in the recipe is a `candidate_acceptability_tuple` as it appear in a `candidate_recipe` (a `recipe` that is not a `given_recipe`). Each acceptability tuple is also a `valid_acceptability_tuple` as it matches a `valid_acceptability_tuple` from the background knowledge (here provided in the file `asp_recipe_graphs/asp/recipes/fusilli_pomodoro_tuples.lp`).

**Example: Show that candidate recipe fusilli pomodoro is valid** This uses the same background knowledge as the previous call, but now we are showing what candidate recipes we have. This uses the call:

```shell
clingo -e cautious asp_recipe_graphs/asp/domain_independent/{type_hierarchies,graph_properties,recipe_graphs,recipes,acceptability_tuples,validity}.lp  asp_recipe_graphs/asp/recipes/fusilli_pomodoro_tuples.lp asp_recipe_graphs/asp/domains/pomodoro_types.lp asp_recipe_graphs/asp/recipes/fusilli_pomodoro_{graph,types}.lp asp_recipe_graphs/asp/show/show_validated_recipe.lp
```

Formatted output includes the following:

```shell
Answer: 1
candidate_recipe(rg_fusilli_pomodoro,tf_fusilli_pomodoro)
valid_recipe(rg_fusilli_pomodoro,tf_fusilli_pomodoro)
Consequences: [2;2]
SATISFIABLE
```

This shows that our recipe is a `candidate_recipe` as it is a `recipe` but not a `given_recipe`. However, since all the candidate acceptability tuples derived from the recipe are found to be valid acceptability tuples, the recipe itself is a `valid_recipe`.



### Type Substitution

We can now demonstrate type substitution. This requires a given recipe (graph and type function) as well as some additional given/valid acceptability tuples from elsewhere. Finally, we need to specify some partial type function or primary substitution set which can be then fully resolved by the substitution process. The general call for this is:

```shell
clingo <ASPDIR>/domain_independent/{type_hierarchies,graph_properties,recipe_graphs,recipes,acceptability_tuples,validity,type_substitution}.lp <TYPE_HIERARCHY>  <ASPDIR>/recipes/<GIVEN_RECIPE_NAME>_{graph,types,given}.lp <MORE_VALID_TUPLES> <SPECIFIED_TYPE_SUBSTITUTION> <ASPDIR>/show/show_type_substitution.lp -n 0
```


**Example: Type substitution for spaghetti pomodoro with primary substitution set switching uncooked spaghetti with uncooked fusilli** In this example, we are using our spaghetti pomodoro as a given recipe. We know this to have the same recipe graph (up to isomorphism) as fusilli pomodoro. We also provide the fusilli pomodoro acceptability tuples as background knowledge (in the file `asp_recipe_graphs/asp/recipes/fusilli_pomodoro_tuples.lp`). Type substitution is then declared with a grounded `type_substitution` and one or more grounded `primary_substitution`s (in the command below these are provided in the file `asp_recipe_graphs/asp/domains/spaghetti_pomodoro_type_substitution.lp`). To run the example use:

```shell
clingo 0 --quiet=1 asp_recipe_graphs/asp/domain_independent/{type_hierarchies,graph_properties,recipe_graphs,recipes,acceptability_tuples,validity,type_substitution}.lp asp_recipe_graphs/asp/recipes/spaghetti_pomodoro_{graph,types,given}.lp asp_recipe_graphs/asp/recipes/fusilli_pomodoro_tuples.lp asp_recipe_graphs/asp/domains/pomodoro_types.lp asp_recipe_graphs/asp/domains/spaghetti_pomodoro_type_substitution.lp asp_recipe_graphs/asp/show/show_type_substitution.lp
```

Appropriately formatted output includes the following:
```shell
Answer: 1
primary_substitution((rg_spaghetti_pomodoro,tf_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub),c(1),"uncooked fusilli")
type_substitution(rg_spaghetti_pomodoro,tf_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub)
valid_recipe(rg_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub)
secondary_substitution((rg_spaghetti_pomodoro,tf_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub),c(2),"undrained cooked fusilli")
secondary_substitution((rg_spaghetti_pomodoro,tf_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub),c(7),"drained cooked fusilli")
secondary_substitution((rg_spaghetti_pomodoro,tf_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub),c(8),"fusilli in bowl")
secondary_substitution((rg_spaghetti_pomodoro,tf_spaghetti_pomodoro,tf_spaghetti_pomodoro_sub),c(9),"fusilli pomodoro")
Optimization: -10
OPTIMUM FOUND
```

This recapitulates the `type_substitution` and `primary_substitutions`, declares the resulting recipe to be a `valid_recipe` (required for the substitution to be successful), and lists the `secondary_substitution`s. These are the other types assignments that will have to change from the given recipe.

(See also the 'testing type substitution' example in the 'Quick Start' section at the beginning of this README file.)


## Running Python

Many of the calls you can run directly through clingo (ASP), you can also run through Python. This python API provides some additional functionality make the calls simpler and less subject to user error (e.g. failing to include the appropriate modules). At time of writing, this code is in development and may not execute as intended.

### Drawing graphs

The python api provides capabilities for drawing graphs of type hierarchies, recipe graphs and recipes. The following examples demonstrate this functionality. For more information run:

```
python draw_graph.py -h
```

**Draw type hierarchy:** To draw a graph of the pomodoro type hierarchy, types in spaghetti pomodoro and fusilli pomodoro run:

```
python draw_graph.py -t types -r spaghetti_pomodoro,fusilli_pomodoro
```

This will store the result in:

```
results/types/spaghetti_pomodoro_fusilli_pomodoro_comestible.pdf
```

**Draw recipe graph:** To draw a graph of spaghetti pomodoro's recipe graph:

```
python draw_graph.py -t recipe_graph -r spaghetti_pomodoro
```

This will store the result in:

```
results/recipe_graphs/spaghetti_pomodoro.pdf
```

**Draw recipe:** To draw the spaghetti pomodoro recipe as a graph (e.g. with types indicated) run:

```
python draw_graph.py -t recipe -r spaghetti_pomodoro
```

This will store the result in:

```
results/recipe/spaghetti_pomodoro.pdf
```

### Simple calls

Functionality in development includes running arbitrary ASP calls through the python api, you can try the `simple_asp_call.py` script. This has the following basic structure:

```shell
python simple_asp_call.py -r <RECIPE> -q <SHOWMODULE>
```

where `<SHOWMODULE>` is the name of the <SHOWMODULE> you wish to run and `<RECIPE>` is the short-name of the recipe you wish to run the call on. The Python API aims to manage the required ASP modules and determine the file-paths of the necessary modules, recipes and show.  The output from this script will include some information about which ASP modules are loaded and will conclude by printing the list of stable models.

What follows are a few examples that replicate the functionality described for clingo above. 

**Example: Check if  BBC vegan sponge cake graph is a recipe graph** 

```shell
python simple_asp_call.py -r bbc_vegan_sponge_cake -q show_recipe_graph
```

**Example: Is BBC Vegan Sponge Cake a recipe?** 

```shell
python simple_asp_call.py -r bbc_vegan_sponge_cake -q show_recipe
```

**Example: Compressed hierarchy for buttered toast** 

```shell
python simple_asp_call.py -r buttered_toast -q used_child
```

**Example: Acceptability tuples inferred from hummus recipe**

```shell
python simple_asp_call.py -r hummus -q acceptability_tuples
```

### Which show modules and which recipes

You can get a list of available show modules and available recipes by passing the `-h` flag to the `simple_asp_call.py` script. I.e.

```shell
python simple_asp_call.py -h
```

You can add additional recipes and show modules too. Recipes are picked up from the appropriate folder but at the time of writing the show modules must be present in the `asp_recipe_graphs/asp/show` folder but also included in the `SHOW_DATA` global variable defined in `asp_recipe_graphs.api.show` python module.

