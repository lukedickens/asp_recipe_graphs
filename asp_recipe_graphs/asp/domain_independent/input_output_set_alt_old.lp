#const max_in_set_size=6.
#const max_out_set_size=2.

questionable_recipe(RG,TF) :- recipe(RG,TF), not given_recipe(RG,TF).

1{ input_element(RG,TF,a(N),AType,CType) : in(arcs(RG),arc(c(Nin),a(N))), type_of(TF,c(Nin),CType), type_of(TF,a(N),AType) }max_in_set_size :-
	recipe(RG,TF), in(acts(RG),a(N)).

1{ output_element(RG,TF,a(N),AType,CType) : in(arcs(RG),arc(a(N),c(Nout))), type_of(TF,c(Nout),CType), type_of(TF,a(N),AType) }max_out_set_size :-
	recipe(RG,TF), in(acts(RG),a(N)).

:- in(arcs(RG),arc(c(Nin),a(N))), type_of(TF,c(Nin),CType), type_of(TF,a(N),AType), not input_element(RG,TF,a(N),AType,CType).
:- in(arcs(RG),arc(a(N),c(Nout))), type_of(TF,c(Nout),CType), type_of(TF,a(N),AType), not output_element(RG,TF,a(N),AType,CType).

% Construct Tuple for input elements
0{ comestible_position_in_input_tuple(RG,TF,a(N),CType,M) : input_element(RG,TF,a(N),AType,CType) }1 :-
	M=1..max_in_set_size, in(arcs(RG),arc(c(Nin),a(N))).

:- comestible_position_in_input_tuple(RG,TF,a(N),CType,N1), comestible_position_in_input_tuple(RG,TF,a(N),CType,N2), N1 != N2.
:- comestible_position_in_input_tuple(RG,TF,a(N),CType1,N1), comestible_position_in_input_tuple(RG,TF,a(N),CType2,N2), CType1 < CType2, N1 > N2.

there_is_input_comestible(RG,TF,a(N),CType) :- comestible_position_in_input_tuple(RG,TF,a(N),CType,M).
:- input_element(RG,TF,a(N),AType,CType), not there_is_input_comestible(RG,TF,a(N),CType).

used_input_m(RG,TF,a(N),M) :- comestible_position_in_input_tuple(RG,TF,a(N),CType,M).
:- used_input_m(RG,TF,a(N),M1), not used_input_m(RG,TF,a(N),M2), M2 = 1..max_in_set_size, M2 < M1.

% Construct Tuple for output elements
0{ comestible_position_in_output_tuple(RG,TF,a(N),CType,M) : output_element(RG,TF,a(N),AType,CType) }1 :-
	M=1..max_out_set_size, in(arcs(RG),arc(a(N),c(Nout))).

:- comestible_position_in_output_tuple(RG,TF,a(N),CType,N1), comestible_position_in_output_tuple(RG,TF,a(N),CType,N2), N1 != N2.
:- comestible_position_in_output_tuple(RG,TF,a(N),CType1,N1), comestible_position_in_output_tuple(RG,TF,a(N),CType2,N2), CType1 < CType2, N1 > N2.

there_is_output_comestible(RG,TF,a(N),CType) :- comestible_position_in_output_tuple(RG,TF,a(N),CType,M).
:- output_element(RG,TF,a(N),AType,CType), not there_is_output_comestible(RG,TF,a(N),CType).

used_output_m(RG,TF,a(N),M) :- comestible_position_in_output_tuple(RG,TF,a(N),CType,M).
:- used_output_m(RG,TF,a(N),M1), not used_output_m(RG,TF,a(N),M2), M2 = 1..max_out_set_size, M2 < M1.

% Definitions for good and questionable comestibles
good_comestible_position_in_input_tuple(RG,TF,a(N),CType,M) :-
	given_recipe(RG,TF),
	comestible_position_in_input_tuple(RG,TF,a(N),CType,M).

good_comestible_position_in_output_tuple(RG,TF,a(N),CType,M) :-
	given_recipe(RG,TF),
	comestible_position_in_output_tuple(RG,TF,a(N),CType,M).

questionable_comestible_position_in_input_tuple(RG,TF,a(N),CType,M) :-
	questionable_recipe(RG,TF),
	comestible_position_in_input_tuple(RG,TF,a(N),CType,M).

questionable_comestible_position_in_output_tuple(RG,TF,a(N),CType,M) :-
	questionable_recipe(RG,TF),
	comestible_position_in_output_tuple(RG,TF,a(N),CType,M).

%#show input_element/5.
%#show output_element/5.
#show good_comestible_position_in_input_tuple/5.
#show good_comestible_position_in_output_tuple/5.
#show questionable_comestible_position_in_input_tuple/5.
#show questionable_comestible_position_in_output_tuple/5.
