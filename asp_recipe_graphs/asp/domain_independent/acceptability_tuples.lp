#const max_in_set_size=6.
#const max_out_set_size=2.

:- recipe(RG,TF), in(arcs(RG),arc(c(Nin),a(N))), type_of(TF,c(Nin),CType), type_of(TF,a(N),AType), not input_element((RG,TF,a(N)),CType).
:- recipe(RG,TF), in(arcs(RG),arc(a(N),c(Nout))), type_of(TF,c(Nout),CType), type_of(TF,a(N),AType), not output_element((RG,TF,a(N)),CType).
:- comestible_position_in_input_tuple((RG,TF,a(N)),CType,N1), comestible_position_in_input_tuple((RG,TF,a(N)),CType,N2), N1 != N2.
:- comestible_position_in_input_tuple((RG,TF,a(N)),CType1,N1), comestible_position_in_input_tuple((RG,TF,a(N)),CType2,N2), CType1 < CType2, N1 > N2.
:- input_element((RG,TF,a(N)),CType), not there_is_input_comestible((RG,TF,a(N)),CType).
:- used_input_m((RG,TF,a(N)),M1), not used_input_m((RG,TF,a(N)),M2), M2 = 1..max_in_set_size, M2 < M1.
:- comestible_position_in_output_tuple((RG,TF,a(N)),CType,N1), comestible_position_in_output_tuple((RG,TF,a(N)),CType,N2), N1 != N2.
:- comestible_position_in_output_tuple((RG,TF,a(N)),CType1,N1), comestible_position_in_output_tuple((RG,TF,a(N)),CType2,N2), CType1 < CType2, N1 > N2.
:- output_element((RG,TF,a(N)),CType), not there_is_output_comestible((RG,TF,a(N)),CType).
:- used_output_m((RG,TF,a(N)),M1), not used_output_m((RG,TF,a(N)),M2), M2 = 1..max_out_set_size, M2 < M1.

candidate_recipe(RG,TF) :- recipe(RG,TF), not given_recipe(RG,TF).

1{ input_element((RG,TF,a(N)),CType) : in(arcs(RG),arc(c(Nin),a(N))), type_of(TF,c(Nin),CType), type_of(TF,a(N),AType) }max_in_set_size :-
	recipe(RG,TF), in(acts(RG),a(N)).

1{ output_element((RG,TF,a(N)),CType) : in(arcs(RG),arc(a(N),c(Nout))), type_of(TF,c(Nout),CType), type_of(TF,a(N),AType) }max_out_set_size :-
	recipe(RG,TF), in(acts(RG),a(N)).

% Construct Tuple for input elements
0{ comestible_position_in_input_tuple((RG,TF,a(N)),CType,M) : input_element((RG,TF,a(N)),CType) }1 :-
	recipe(RG,TF), M=1..max_in_set_size, in(arcs(RG),arc(c(Nin),a(N))).

there_is_input_comestible((RG,TF,a(N)),CType) :- comestible_position_in_input_tuple((RG,TF,a(N)),CType,M).

used_input_m((RG,TF,a(N)),M) :- comestible_position_in_input_tuple((RG,TF,a(N)),CType,M).

% Construct Tuple for output elements
0{ comestible_position_in_output_tuple((RG,TF,a(N)),CType,M) : output_element((RG,TF,a(N)),CType) }1 :-
	recipe(RG,TF), M=1..max_out_set_size, in(arcs(RG),arc(a(N),c(Nout))).

there_is_output_comestible((RG,TF,a(N)),CType) :- comestible_position_in_output_tuple((RG,TF,a(N)),CType,M).

used_output_m((RG,TF,a(N)),M) :- comestible_position_in_output_tuple((RG,TF,a(N)),CType,M).

% Definitions for good and questionable comestibles
valid_input_element((RG,TF,a(N)),CType,M) :-
	type_of(TF,a(N),AType),
	given_recipe(RG,TF),
	comestible_position_in_input_tuple((RG,TF,a(N)),CType,M).

valid_output_element((RG,TF,a(N)),CType,M) :-
	type_of(TF,a(N),AType),
	given_recipe(RG,TF),
	comestible_position_in_output_tuple((RG,TF,a(N)),CType,M).

valid_action_element((RG,TF,a(N)),AType) :-
	type_of(TF,a(N),AType),
	given_recipe(RG,TF).

candidate_input_element((RG,TF,a(N)),CType,M) :-
	type_of(TF,a(N),AType),
	candidate_recipe(RG,TF),
	comestible_position_in_input_tuple((RG,TF,a(N)),CType,M).

candidate_output_element((RG,TF,a(N)),CType,M) :-
	type_of(TF,a(N),AType),
	candidate_recipe(RG,TF),
	comestible_position_in_output_tuple((RG,TF,a(N)),CType,M).

candidate_action_element((RG,TF,a(N)),AType) :-
	type_of(TF,a(N),AType),
	candidate_recipe(RG,TF).


