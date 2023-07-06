# ASP recipe graphs

Code for reasoning about substitution and other properties of recipe graphs in ASP with supporting Python wrappers.

## Reference
This code is based on the definitions within:
"A Graphical Formalism for Commonsense Reasoning with Recipes",
by Antonis Bikakis , Aissatou Diallo , Luke Dickens, Anthony Hunter, Rob Miller


## Running ASP

For the following examples,
* `<ASPDIR>` refers to the directory in which the asp files are stored. If your working directory is the root of the repository, this is likely to be `./asp_recipe_graphs/asp`. 
* `<RECIPES>` is (are) the file(s) containing your recipe in ASP format. At the time of writing ASP recipes are stored in directory `<ASPDIR>/recipes/` in two parts: the graph part with suffix `_graph.lp` and the type function with suffix  `_types.lp`. Many commands can take more than one recipe as input, and so you can use wildcards (`*`) or other methods to pass multiple recipes in.
* `<TYPEHIERARCHY>` is a file that contains your ASP type hierarchy. There is a universal type hierarchy in ASP module `<ASPDIR>/domain_independent/universal_types.lp`. However, this can be slow (very slow) to compute, so you are encouraged to use a minimal type hierarchy for the recipe in question. Instructions to follow. 
* `<ASPMODULES>` is a comma separated list of the domain independent modules you wish to use. Posix command lines will expand `<ASPDIR>/domain_independent/{<ASPMODULES>}.lp` to give all `.lp` terminating filepaths for modules whose name is in `<ASPMODULES>` that sit in the appropriate directory. The success or otherwise of your command will depend on whether you have a sufficient list of ASP-modules. If you include modules you don't need, it can slow the computation down.


The standard command is as follows:

`clingo 1 <ASPDIR>/domain_independent/{<ASPMODULES>}.lp <TYPEHIERARCHY> <RECIPES> <QUERY>`

where query is typically of the form `<ASPDIR>/queries/<QUERYNAME>.lp`. You can write your own queries or use those in the folder `<ASPDIR>/queries`. The `1` means "return just one stable model", which is sufficient for the majority of queries, but you may require `0` (all stable models) for more advanced calls.

### Recipe Graphs

The standard command to query whether the graphs in `<RECIPES>` are recipe graphs is:

```clingo 1 <ASPDIR>/domain_independent/{graph_properties,recipe_graphs}.lp <RECIPES> <ASPDIR>/queries/is_recipe_graph.lp```

If any graphs are not recipe graphs then this will be `UNSATISFIABLE`, otherwise it will list all recipe_graphs in `<RECIPES>`.

**Example: Check if  BBC vegan sponge cake graph is a recipe graph** We can do this with the following query:

```clingo 1 asp_recipe_graphs/asp/domain_independent/{graph_properties,recipe_graphs}.lp asp_recipe_graphs/asp/recipes/bbc_vegan_sponge_cake_graph.lp asp_recipe_graphs/asp/queries/is_recipe_graph.lp```

This should be `SATISFIABLE` and output `recipe_graph(rg_bbc_vegan_sponge_cake)` .

**Example: Imperfect recipe graph definitions.** Imagine instead that I have a recipe graph poorly defined in file `scratch/not_a_recipe.lp`, then the following should be  `UNSATISFIABLE`:

```clingo 0 asp_recipe_graphs/asp/domain_independent/{graph_properties,recipe_graphs}.lp scratch/not_a_recipe_graph.lp asp_recipe_graphs/asp/queries/is_recipe_graph.lp```

To understand why this is not a recipe-graph I can run the `why_not_recipe_graph` query with:

```clingo 0 asp_recipe_graphs/asp/domain_independent/graph_properties.lp scratch/not_a_recipe_graph.lp asp_recipe_graphs/asp/queries/why_not_recipe_graph.lp```

This will output predicates associated with offending properties, see `asp_recipe_graphs/asp/queries/why_not_recipe_graph.lp` for a description. 

**Note:** that the `why_not_recipe_graph` query, excludes the `recipe_graph` module, otherwise ASP will return `UNSATISFIABLE`.

### Recipes

The standard command to query whether the given recipes in `<RECIPES>` are properly defined recipes:

```clingo 1 <ASPDIR>/domain_independent/{graph_properties,recipe_graphs,recipe}.lp <TYPEHIERARCHY> <RECIPES> <ASPDIR>/queries/is_recipe.lp```

If any graphs are not recipe graphs then this will be `UNSATISFIABLE`, otherwise it will list all recipe_graphs in `<RECIPES>`.

**Example: Is BBC Vegan Sponge Cake a recipe?** - check if BBC vegan sponge cake graph and type function constitute a recipe with:

```clingo 1 asp_recipe_graphs/asp/domain_independent/{graph_properties,recipe_graphs,universal_types,type_hierarchies,recipe}.lp asp_recipe_graphs/asp/recipes/bbc_vegan_sponge_cake_{graph,types}.lp asp_recipe_graphs/asp/queries/is_recipe.lp ```

This should be `SATISFIABLE` and output `recipe(rg_bbc_vegan_sponge_cake,tf_bbc_vegan_sponge_cake)` .

**Example: Imperfect recipe definitions.** Imagine instead that I have a recipe (graph and types) poorly defined in file `scratch/not_a_recipe.lp` then the following should be `UNSATISFIABLE`:

```clingo 0 asp_recipe_graphs/asp/domain_independent/{graph_properties,recipe_graphs,universal_types,type_hierarchies,recipe}.lp scratch/not_a_recipe.lp asp_recipe_graphs/asp/queries/is_recipe.lp```

To understand why this is not a recipe I can run the `why_not_recipe_graph` to determine if the recipe-graph is okay. If the graph is fine, then run `why_not_recipe` to query the typing function with:

```clingo 0 asp_recipe_graphs/asp/domain_independent/{graph_properties,recipe_graphs,universal_types,type_hierarchies}.lp scratch/not_a_recipe.lp asp_recipe_graphs/asp/queries/why_not_recipe.lp```

This will output predicates associated with offending properties, see `asp_recipe_graphs/asp/queries/why_not_recipe.lp` for a description.

**Note:** that the `why_not_recipe` query, excludes the `recipe` module, otherwise ASP will return `UNSATISFIABLE`.


### Type Hierarchies

If you are using the universal type hierarchy you can simply add `universal_types` to your list of `<ASPMODULES>`. Then simply use the command:

`clingo 1 <ASPDIR>/domain_independent/{<ASPMODULES>}.lp <RECIPES> <QUERY>`

However this can be slow. To easily create your own type hierarchy or hierarchies for recipes in `<RECIPES>` then use:

`clingo 1 <ASPDIR>/domain_independent/{type_hierarchies,recipe_graphs,graph_properties,universal_types}.lp  <RECIPES> <ASPDIR>/queries/used_child.lp`

This outputs a stable model with terms of the form `used_child(A,B)`. Copy these to a new file at some location (hereafter called `<TYPEHIERARCHY>`) then edit to replace `used_child` with `child` and `) ` with `). ` universally. `<TYPEHIERARCHY>` can then be used in place of `<ASPDIR>/domain_independent/universal_types.lp` as a minimal type-hierarchy.

For even greater speed use `used_ancestor` rather than `used_child`.

**Example: Compressed hierarchy for buttered toast** With the repository root as present working directory run the following command:

```clingo 1 asp_recipe_graphs/asp/domain_independent/{type_hierarchies,recipe_graphs,graph_properties,universal_types}.lp asp_recipe_graphs/asp/recipes/buttered_toast_{graph,types}.lp asp_recipe_graphs/asp/queries/used_child.lp```

This should output (something like) the following:

```used_child("butter","spreads") used_child("spreads","comestible") used_child("plain toast","toast") used_child("toast","bread") used_child("bread","comestible") used_child("buttered toast","toast") used_child("spread on toast","spread") used_child("spread","put") used_child("put","action")```



### Acceptability Tuples

To output the acceptability tuples you can derive from a `given_recipe`, use:

`clingo 1 <ASPDIR>/domain_independent/{type_hierarchies,recipe_graphs,graph_properties,acceptability}.lp  <TYPEHIERARCHY> <RECIPES> <ASPDIR>/queries/acceptability_tuples.lp`

**Example: Acceptability tuples inferred from hummus recipe** With the repository root as present working directory, run the following command:

```clingo 1 asp_recipe_graphs/asp/domain_independent/{universal_types,type_hierarchies,graph_properties,recipe_graphs,acceptability}.lp asp_recipe_graphs/asp/recipes/hummus_{graph,types}.lp asp_recipe_graphs/asp/queries/acceptability_tuples.lp```

This will output all acceptability tuples from the hummus recipe.

**Example: Acceptability tuples inferred from hummus recipe using compressed hierarchy** With the repository root as present working directory, and a compressed type hierarchy stored in `scratch/hummus_type_hierarchy_compressed.lp`, run the following command:

```RECIPE=hummus ; clingo 1 asp_recipe_graphs/asp/domain_independent/{type_hierarchies,graph_properties,recipe_graphs,acceptability}.lp  scratch/${RECIPE}_type_hierarchy_compressed.lp asp_recipe_graphs/asp/recipes/${RECIPE}_{graph,types}.lp asp_recipe_graphs/asp/queries/acceptability_tuples.lp```
