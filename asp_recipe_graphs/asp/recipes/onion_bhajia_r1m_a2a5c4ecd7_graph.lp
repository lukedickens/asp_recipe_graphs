% Recipe graph declaration
recipe_graph(rg_onion_bhajia_r1m_a2a5c4ecd7).

% Arcs (relationships between consumables and actions)
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(c(0), a(0))). % Flour -> sift
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(c(1), a(0))). % Salt -> sift
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(c(2), a(0))). % Baking powder -> sift
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(a(0), c(3))). % sift -> Sifted dry mix
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(c(3), a(1))). % Sifted dry mix -> mix
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(c(4), a(1))). % Chopped onion -> mix
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(c(5), a(1))). % Chopped chilies -> mix
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(a(1), c(6))). % mix -> Coated onion and chilies
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(c(7), a(2))). % Egg -> beat
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(c(8), a(2))). % Milk -> beat
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(a(2), c(9))). % beat -> Egg and milk mixture
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(c(9), a(3))). % Egg and milk mixture -> mix into batter
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(c(6), a(3))). % Coated onion and chilies -> mix into batter
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(a(3), c(10))). % mix into batter -> Onion bhajia batter
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(c(11), a(4))). % Oil -> heat
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(a(4), c(12))). % heat -> Hot oil
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(c(10), a(5))). % Onion bhajia batter -> fry
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(c(12), a(5))). % Hot oil -> fry
in(arcs(rg_onion_bhajia_r1m_a2a5c4ecd7), arc(a(5), c(13))). % fry -> Fried onion bhajias

