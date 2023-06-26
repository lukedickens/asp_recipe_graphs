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

where query is typically of the form `<ASPDIR>/queries/<QUERYNAME>.lp`. You can write your own queries or use those in the folder `<ASPDIR>/queries`. The `1` means "return just one stable model, which is sufficient for the majority of queries, but you may require `0` (all stable models) for more advanced calls.


### Type Hierarchies

If you are using the universal type hierarchy you can simply add `universal_types` to your list of `<ASPMODULES>`. Then simply use the command:

`clingo 1 <ASPDIR>/domain_independent/{<ASPMODULES>}.lp <RECIPES> <QUERY>`

However this can be slow. To easily create your own type hierarchy or hierarchies for recipes in `<RECIPES>` then use:

`clingo 1 <ASPDIR>/domain_independent/{type_hierarchies,recipe_graphs,graph_properties,universal_types}.lp  <RECIPES> <ASPDIR>/queries/used_types.lp`

This outputs a stable model with terms of the form `used_child(A,B)`. Copy these to a new file at some location (hereafter called `<TYPEHIERARCHY>`) then edit to replace `used_child` with `child` and `) ` with `). ` universally. `<TYPEHIERARCHY>` can then be used in place of `<ASPDIR>/domain_independent/universal_types.lp` as a minimal type-hierarchy.

### Acceptability Tuples

To output the acceptability tuples you can derive from a `given_recipe`, use:

`clingo 1 <ASPDIR>/domain_independent/{type_hierarchies,recipe_graphs,graph_properties,acceptability}.lp  <TYPEHIERARCHY> <RECIPES> <ASPDIR>/queries/acceptability_tuples.lp`
