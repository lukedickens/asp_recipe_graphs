% set maximum input and output set sizes (should be moved elsewhere for flexibility)
#const max_in_set_size=10.
#const max_out_set_size=2.

%% A more straightforward way to do the above ^^. Namely creating input and output elements
input_element((RG,TF,a(N)),CType) :-
	recipe(RG,TF), in(acts(RG),a(N)),
    in(arcs(RG),arc(c(Nin),a(N))),
    type_of(TF,c(Nin),CType),
    type_of(TF,a(N),AType).
output_element((RG,TF,a(N)),CType) :-
    recipe(RG,TF), in(acts(RG),a(N)),
    in(arcs(RG),arc(a(N),c(Nout))),
    type_of(TF,c(Nout),CType),
    type_of(TF,a(N),AType).

action_element((RG,TF,a(N)),AType) :-
	type_of(TF,a(N),AType),
	recipe(RG,TF).
	
% ensure there can be numbered position in tuple for input elements
0{ input_element_position((RG,TF,a(N)),CType,M) : input_element((RG,TF,a(N)),CType) }1 :-
	recipe(RG,TF), M=1..max_in_set_size, in(arcs(RG),arc(c(Nin),a(N))).
% ensure there can be numbered position in tuple for output elements
0{ output_element_position((RG,TF,a(N)),CType,M) : output_element((RG,TF,a(N)),CType) }1 :-
	recipe(RG,TF), M=1..max_out_set_size, in(arcs(RG),arc(a(N),c(Nout))).

%% Purely acceptability tuple reasoning so no need for triple (RG,TF,a(N)) replace with Key 
% ensure no input element has two positions
:- input_element_position(Key,CType,N1), input_element_position(Key,CType,N2), N1 != N2.
% ensure input element positions are lexicographically ordered
:- input_element_position(Key,CType1,N1), input_element_position(Key,CType2,N2), CType1 < CType2, N1 > N2.
% no gaps between numbers (contiguous)
used_input_m(Key,M) :- input_element_position(Key,CType,M).
:- used_input_m(Key,M1), not used_input_m(Key,M2), M2 = 1..max_in_set_size, M2 < M1.
% there must be an input element for every positioned one
there_is_input_element_position(Key,CType) :- input_element_position(Key,CType,M).
:- input_element(Key,CType), not there_is_input_element_position(Key,CType).

% ensure no output element has two positions
:- output_element_position(Key,CType,N1), output_element_position(Key,CType,N2), N1 != N2.
% ensure output element positions are lexicographically ordered
:- output_element_position(Key,CType1,N1), output_element_position(Key,CType2,N2), CType1 < CType2, N1 > N2.
% no gaps between numbers (contiguous)
used_output_m(Key,M) :- output_element_position(Key,CType,M).
:- used_output_m(Key,M1), not used_output_m(Key,M2), M2 = 1..max_out_set_size, M2 < M1.
% there must be an output element for every positioned one
there_is_output_element_position(Key,CType) :- output_element_position(Key,CType,M).
:- output_element(Key,CType), not there_is_output_element_position(Key,CType).

% a recipe is either a given recipe xor a candidate recipe
candidate_recipe(RG,TF) :- recipe(RG,TF), not given_recipe(RG,TF).

%% State whether or not the tuple is given or candidate
given_acceptability_tuple((RG,TF,a(N))) :-
	given_recipe(RG,TF),
    action_element((RG,TF,a(N)),AType).

candidate_acceptability_tuple((RG,TF,a(N))) :-
	candidate_recipe(RG,TF),
    action_element((RG,TF,a(N)),AType).

