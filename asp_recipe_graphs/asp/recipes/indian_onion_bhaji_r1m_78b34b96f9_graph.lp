% Recipe graph declaration
recipe_graph(rg_indian_onion_bhaji_r1m_78b34b96f9).

% Arcs (relationships between consumables and actions)
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(0), a(0))). % Vegetable oil -> heat
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(a(0), c(1))). % heat -> Heated oil
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(2), a(1))). % Chickpea flour -> mix
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(3), a(1))). % Baking powder -> mix
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(4), a(1))). % Rice flour -> mix
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(5), a(1))). % Turmeric -> mix
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(6), a(1))). % Black onion seeds -> mix
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(7), a(1))). % Chili powder -> mix
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(8), a(1))). % Ground cumin -> mix
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(9), a(1))). % Ground coriander -> mix
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(10), a(1))). % Salt -> mix
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(11), a(1))). % Water -> mix
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(a(1), c(12))). % mix -> Batter
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(12), a(2))). % Batter -> coat
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(13), a(2))). % Sliced onion -> coat
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(a(2), c(14))). % coat -> Coated onion
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(14), a(3))). % Coated onion -> fry
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(1), a(3))). % Heated oil -> fry
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(a(3), c(15))). % fry -> Fried onion bhajis
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(15), a(4))). % Fried onion bhajis -> drain
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(a(4), c(16))). % drain -> Drained onion bhajis
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(16), a(5))). % Drained onion bhajis -> serve
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(c(17), a(5))). % Coriander chutney or cucumber raita -> serve
in(arcs(rg_indian_onion_bhaji_r1m_78b34b96f9), arc(a(5), c(18))). % serve -> Onion bhajis with chutney or raita

