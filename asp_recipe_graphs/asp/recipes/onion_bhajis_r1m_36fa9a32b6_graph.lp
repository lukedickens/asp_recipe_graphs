% Recipe graph declaration
recipe_graph(rg_onion_bhajis_r1m_36fa9a32b6).

% Arcs (relationships between consumables and actions)
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(c(0), a(0))). % Vegetable oil -> Heat oil
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(a(0), c(1))). % Heat oil -> Heated oil
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(c(2), a(1))). % Sliced onion -> Mix batter
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(c(3), a(1))). % Chopped green chili -> Mix batter
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(c(4), a(1))). % Ground coriander -> Mix batter
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(c(5), a(1))). % Cumin seed -> Mix batter
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(c(6), a(1))). % Chickpea flour -> Mix batter
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(c(7), a(1))). % Salt -> Mix batter
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(c(8), a(1))). % Water -> Mix batter
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(a(1), c(9))). % Mix batter -> Bhaji batter
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(c(9), a(2))). % Bhaji batter -> Check oil temperature
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(c(1), a(2))). % Heated oil -> Check oil temperature
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(a(2), c(10))). % Check oil temperature -> Oil ready for frying
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(c(10), a(3))). % Oil ready for frying -> Fry bhajis
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(c(9), a(3))). % Bhaji batter -> Fry bhajis
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(a(3), c(11))). % Fry bhajis -> Fried bhajis
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(c(11), a(4))). % Fried bhajis -> Cool
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(a(4), c(12))). % Cool -> Crunchy onion bhajis
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(c(12), a(5))). % Crunchy onion bhajis -> Serve
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(c(13), a(5))). % Yogurt and mint raita -> Serve
in(arcs(rg_onion_bhajis_r1m_36fa9a32b6), arc(a(5), c(14))). % Serve -> Onion bhajis with raita

