%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ASP Part Implementation of Section 5 of 
% "A Graphical Formalism for Commonsense Reasoning with Recipes",
% by Antonis Bikakis , Aissatou Diallo , Luke Dickens, Anthony Hunter, Rob Miller

% to run, also requires
%     graph_properties.lp, recipe_graphs.lp    (i.e. code for Section 3)
% does not appear to require
%     type_hierarchies.lp   (i.e. code for Section 2)
%     acceptability.lp     (i.e. code for Section 4)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition of isomorphic recipe graphs:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% any pair of recipe graphs are either isomorphic or not, but
% (read "-isomorphic(RG1,RG2)" as "not necessarily isomorphic"):
isomorphic(RG1,RG2) | -isomorphic(RG1,RG2) :- 
    recipe_graph(RG1), 
    recipe_graph(RG2).
% isomorphism defines an equivalence class:
isomorphic(RG2,RG1) :- isomorphic(RG1,RG2).
-isomorphic(RG2,RG1) :- -isomorphic(RG1,RG2).
isomorphic(RG,RG) :- recipe_graph(RG).
isomorphic(RG1,RG3) :- isomorphic(RG1,RG2), isomorphic(RG2,RG3).

% for isomorphic recipe graphs create a bijection one way round only:
1 {bijection(RG1,RG2,c(N1),c(N2)) : in(c_nodes(RG2),c(N2))} 1 :-
    RG1 < RG2,
    isomorphic(RG1,RG2),
    in(c_nodes(RG1),c(N1)).
1 {bijection(RG1,RG2,a(N1),a(N2)) : in(a_nodes(RG2),a(N2))} 1 :-
    RG1 < RG2,
    isomorphic(RG1,RG2),
    in(a_nodes(RG1),a(N1)).
:- bijection(RG1,RG2,c(N1),c(N2)), bijection(RG1,RG2,c(N1),c(N3)), N2 != N3.
:- bijection(RG1,RG2,c(N1),c(N3)), bijection(RG1,RG2,c(N2),c(N3)), N1 != N2.
:- bijection(RG1,RG2,a(N1),a(N2)), bijection(RG1,RG2,a(N1),a(N3)), N2 != N3.
:- bijection(RG1,RG2,a(N1),a(N3)), bijection(RG1,RG2,a(N2),a(N3)), N1 != N2.

% state that the arcs must be equivalent in both recipe graphs:
:- bijection(RG1,RG2,c(N1),c(N2)), bijection(RG1,RG2,a(N3),a(N4)), 
   in(arcs(RG1),arc(c(N1),a(N3))), not in(arcs(RG2),arc(c(N2),a(N4))).
:- bijection(RG1,RG2,c(N1),c(N2)), bijection(RG1,RG2,a(N3),a(N4)), 
   not in(arcs(RG1),arc(c(N1),a(N3))), in(arcs(RG2),arc(c(N2),a(N4))).
:- bijection(RG1,RG2,a(N1),a(N2)), bijection(RG1,RG2,c(N3),c(N4)), 
   in(arcs(RG1),arc(a(N1),c(N3))), not in(arcs(RG2),arc(a(N2),c(N4))).
:- bijection(RG1,RG2,a(N1),a(N2)), bijection(RG1,RG2,c(N3),c(N4)), 
   not in(arcs(RG1),arc(a(N1),c(N3))), in(arcs(RG2),arc(a(N2),c(N4))).
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of definition of isomorphic recipe graphs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

