%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ASP Part Implementation of Section 5 of 
% "A Graphical Formalism for Commonsense Reasoning with Recipes",
% by Antonis Bikakis , Aissatou Diallo , Luke Dickens, Anthony Hunter, Rob Miller

% to run, also requires
%     type_hierarchies.lp   (i.e. code for Section 2)
%     graph_properties.lp, recipe_graphs.lp    (i.e. code for Section 3)
% does not appear to require
%     acceptability.lp     (i.e. code for Section 4)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Original definition 7 of in-out aligned recipes:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%-in_out_aligned(RG1,TF1,RG2,TF2) :- 
%   recipe(RG1,TF1),
%   recipe(RG2,TF2),
%   in(in(RG1),c(N)),
%   not in(in(RG2),c(N)).
%-in_out_aligned(RG1,TF1,RG2,TF2) :- 
%   recipe(RG1,TF1),
%   recipe(RG2,TF2),
%   in(in(RG2),c(N)), 
%   not in(in(RG1),c(N)).
%-in_out_aligned(RG1,TF1,RG2,TF2) :- 
%   recipe(RG1,TF1),
%   recipe(RG2,TF2),
%   in(out(RG1),c(N)), 
%   not in(out(RG2),c(N)).
%-in_out_aligned(RG1,TF1,RG2,TF2) :- 
%   recipe(RG1,TF1),
%   recipe(RG2,TF2),
%   in(out(RG2),c(N)), 
%   not in(out(RG1),c(N)).
%-in_out_aligned(RG1,TF1,RG2,TF2) :- 
%   recipe(RG1,TF1),
%   recipe(RG2,TF2),
%   in(in(RG1),c(N)), 
%   in(in(RG2),c(N)),
%   type_of(TF1,c(N),T1),
%   type_of(TF2,c(N),T2),
%   T1 != T2.
%-in_out_aligned(RG1,TF1,RG2,TF2) :- 
%   recipe(RG1,TF1),
%   recipe(RG2,TF2),
%   in(out(RG1),c(N)), 
%   in(out(RG2),c(N)),
%   type_of(TF1,c(N),T1),
%   type_of(TF2,c(N),T2),
%   T1 != T2.
%in_out_aligned(RG1,TF1,RG2,TF2) :-
%   recipe(RG1,TF1),
%   recipe(RG2,TF2),
%   not -in_out_aligned(RG1,TF1,RG2,TF2).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of original definition of in-out aligned recipes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Alternative definition 7 of in-out aligned recipes:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% this definition just checks that the types of the in and out 
% nodes are the same (doesn't care about the node indexes)

in(in_types(RG,TF),T) :-
    recipe(RG,TF),
    in(in(RG),c(N)),
    type_of(TF,c(N),T).
in(out_types(RG,TF),T) :-
    recipe(RG,TF),
    in(out(RG),c(N)),
    type_of(TF,c(N),T).
-in_out_aligned(RG1,TF1,RG2,TF2) :-
    recipe(RG1,TF1),
    recipe(RG2,TF2),
    in(in_types(RG1,TF1),T),
    not in(in_types(RG2,TF2),T).
-in_out_aligned(RG1,TF1,RG2,TF2) :-
    recipe(RG1,TF1),
    recipe(RG2,TF2),
    not in(in_types(RG1,TF1),T),
    in(in_types(RG2,TF2),T).
-in_out_aligned(RG1,TF1,RG2,TF2) :-
    recipe(RG1,TF1),
    recipe(RG2,TF2),
    in(out_types(RG1,TF1),T),
    not in(out_types(RG2,TF2),T).
-in_out_aligned(RG1,TF1,RG2,TF2) :-
    recipe(RG1,TF1),
    recipe(RG2,TF2),
    not in(out_types(RG1,TF1),T),
    in(out_types(RG2,TF2),T).
in_out_aligned(RG1,TF1,RG2,TF2) :-
   recipe(RG1,TF1),
   recipe(RG2,TF2),
   not -in_out_aligned(RG1,TF1,RG2,TF2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of alternative definition of in-out alligned recipes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

