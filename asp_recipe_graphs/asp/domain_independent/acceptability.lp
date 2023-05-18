%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ASP Implementation of Section 4 of 
% "A Graphical Formalism for Commonsense Reasoning with Recipes",
% by Antonis Bikakis , Aissatou Diallo , Luke Dickens, Anthony Hunter, Rob Miller

% to run, also requires
%     type_hierarchies.lp   (i.e. code for Section 2)
%     graph_properties.lp, recipe_graphs.lp    (i.e. code for Section 3)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Section 4 of paper, Acceptability of recipes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition 4 of an acceptable recipe:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-acceptable_recipe(RG,TF) :- in(arcs(RG),arc(c(N1),a(N2))), 
                             in(arcs(RG),arc(a(N2),c(N3))),
                             type_of(TF,c(N1),T1), 
                             type_of(TF,a(N2),T2), 
                             type_of(TF,c(N3),T3),
                             not acceptability_tuple(T1,T2,T3).
acceptable_recipe(RG,TF) :- recipe(RG,TF), not -acceptable_recipe(RG,TF).

%%%%%%%%%%%%%%%%%%%%%
% End of Definition 4
%%%%%%%%%%%%%%%%%%%%%
