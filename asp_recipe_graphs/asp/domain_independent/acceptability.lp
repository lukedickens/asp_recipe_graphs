%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ASP Implementation of Section 4 of 
% "A Graphical Formalism for Commonsense Reasoning with Recipes",
% by Antonis Bikakis , Aissatou Diallo , Luke Dickens, Anthony Hunter, Rob Miller

% Version 0.2

% last updated: 2/6/2023

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Section 4 of paper, Acceptability of recipes
%  ALTERNATIVE DEFINITION OF ACCEPTABILITY   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Alternative definition 4 of an acceptable recipe:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% code to generate a set of input types for each action node in a recipe:

#const max_in_set_size=20.
possible_inset_size(0..max_in_set_size).

partial_inset_with_size(RG,TF,a(N),s_0,0) :-
    recipe(RG,TF),
    in(acts(RG),a(N)).
partial_inset_with_size(RG,TF,a(N),s_(Type,s_0),1) :-
    recipe(RG,TF),
    in(arcs(RG),arc(c(Nin),a(N))),
    type_of(TF,c(Nin),Type).
partial_inset_with_size(RG,TF,a(N),s_(Type1,s_(Type2,Inset)),X+1) :-
    partial_inset_with_size(RG,TF,a(N),s_(Type2,Inset),X),
    possible_inset_size(N+1),
    in(arcs(RG),arc(c(Nin1),a(N))),
    in(arcs(RG),arc(c(Nin2),a(N))),
    type_of(TF,c(Nin1),Type1),
    type_of(TF,c(Nin2),Type2),
    Type1 < Type2.
    
partial_inset(RG,TF,a(N),Inset) :-
    partial_inset_with_size(RG,TF,a(N),Inset,X).
    
in_partial_inset(RG,TF,a(N),Type,s_(Type,Rest)) :- 
    partial_inset(RG,TF,a(N),s_(Type,Rest)).
in_partial_inset(RG,TF,a(N),Type,s_(Type1,Rest)) :- 
    in(arcs(RG),arc(c(Nin),a(N))),
    type_of(TF,c(Nin),Type),
    partial_inset(RG,TF,a(N),s_(Type1,Rest)),
    in_partial_inset(RG,TF,a(N),Type,Rest).
-in_partial_inset(RG,TF,a(N),Type,Inset) :- 
    in(arcs(RG),arc(c(Nin),a(N))),
    type_of(TF,c(Nin),Type),
    partial_inset(RG,TF,a(N),Inset),
    not in_partial_inset(RG,TF,a(N),Type,Inset).
 
-input_set(RG,TF,a(N),Inset) :-
    in(arcs(RG),arc(c(Nin),a(N))),
    type_of(TF,c(Nin),Type),
    -in_partial_inset(RG,TF,a(N),Type,Inset).
input_set(RG,TF,a(N),Inset) :-
    partial_inset(RG,TF,a(N),Inset),
    not -input_set(RG,TF,a(N),Inset).
    
% end of code to generate a set of input types for each action node in a recipe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% code to generate a set of output types for each action node in a recipe:
  
#const max_out_set_size=20.
possible_outset_size(0..max_out_set_size).

partial_outset_with_size(RG,TF,a(N),s_0,0) :-
    recipe(RG,TF),
    in(acts(RG),a(N)).
partial_outset_with_size(RG,TF,a(N),s_(Type,s_0),1) :-
    recipe(RG,TF),
    in(arcs(RG),arc(a(N),c(Nout))),
    type_of(TF,c(Nout),Type).
partial_outset_with_size(RG,TF,a(N),s_(Type1,s_(Type2,Outset)),X+1) :-
    partial_outset_with_size(RG,TF,a(N),s_(Type2,Outset),X),
    possible_outset_size(N+1),
    in(arcs(RG),arc(a(N),c(Nout1))),
    in(arcs(RG),arc(a(N),c(Nout2))),
    type_of(TF,c(Nout1),Type1),
    type_of(TF,c(Nout2),Type2),
    Type1 < Type2.
    
partial_outset(RG,TF,a(N),Outset) :-
    partial_outset_with_size(RG,TF,a(N),Outset,X).
    
in_partial_outset(RG,TF,a(N),Type,s_(Type,Rest)) :- 
    partial_outset(RG,TF,a(N),s_(Type,Rest)).
in_partial_outset(RG,TF,a(N),Type,s_(Type1,Rest)) :- 
    in(arcs(RG),arc(a(N),c(Nout))),
    type_of(TF,c(Nout),Type),
    partial_outset(RG,TF,a(N),s_(Type1,Rest)),
    in_partial_outset(RG,TF,a(N),Type,Rest).
-in_partial_outset(RG,TF,a(N),Type,Outset) :- 
    in(arcs(RG),arc(a(N),c(Nout))),
    type_of(TF,c(Nout),Type),
    partial_outset(RG,TF,a(N),Outset),
    not in_partial_outset(RG,TF,a(N),Type,Outset).
 
-output_set(RG,TF,a(N),Outset) :-
    in(arcs(RG),arc(a(N),c(Nout))),
    type_of(TF,c(Nout),Type),
    -in_partial_outset(RG,TF,a(N),Type,Outset).
output_set(RG,TF,a(N),Outset) :-
    partial_outset(RG,TF,a(N),Outset),
    not -output_set(RG,TF,a(N),Outset).
  
% end of code to generate a set of output types for each action node in a recipe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

acceptable_action_node(RG,TF,a(N)) :-
    in(acts(RG),a(N)),
    input_set(RG,TF,a(N),Inset),
    output_set(RG,TF,a(N),Outset),
    type_of(TF,a(N),Action),
    acceptability_tuple(Inset,Action,Outset).
    
-acceptable_recipe(RG,TF) :-
    recipe(RG,TF),
    in(acts(RG),a(N)),
    not acceptable_action_node(RG,TF,a(N)).
acceptable_recipe(RG,TF) :- 
    recipe(RG,TF), 
    not -acceptable_recipe(RG,TF).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of alternative Definition 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% All action nodes in a given recipe give rise to an acceptability tuple:

acceptability_tuple(Inset,Action,Outset) :-
    given_recipe(RG,TF),
    in(acts(RG),a(N)),
    input_set(RG,TF,a(N),Inset),
    output_set(RG,TF,a(N),Outset),
    type_of(TF,a(N),Action). 
