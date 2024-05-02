%%WARNING: Code in this file is not currently fully tested

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition 6 of equivalent recipes:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% any pair of recipes are either equivalent or not, but read
% ( "-equivalent(RG1,TF1,RG2,TF2)" as "not necessarily equivalent"):
equivalent(RG1,TF1,RG2,TF2) | -equivalent(RG1,TF1,RG2,TF2) :- 
    recipe(RG1,TF1), 
    recipe(RG2,TF2).
% equivalence defines an equivalence class:
equivalent(RG2,TF2,RG1,TF1) :- equivalent(RG1,TF1,RG2,TF2).
-equivalent(RG2,TF2,RG1,TF1) :- -equivalent(RG1,TF1,RG2,TF2).
equivalent(RG,TF,RG,TF) :- recipe(RG,TF).
equivalent(RG1,TF1,RG3,TF3) :- 
    equivalent(RG1,TF1,RG2,TF2), 
    equivalent(RG2,TF2,RG3,TF3).

:- equivalent(RG1,TF1,RG2,TF2), -isomorphic(RG1,RG2).
:- equivalent(RG1,TF1,RG2,TF2), bijection(RG1,RG2,c(N1),c(N2)),
   type_of(TF1,c(N1),T1), type_of(TF2,c(N2),T2), T1 != T2.
:- equivalent(RG1,TF1,RG2,TF2), bijection(RG1,RG2,a(N1),a(N2)),
   type_of(TF1,a(N1),T1), type_of(TF2,a(N2),T2), T1 != T2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of definition of equivalent recipes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

