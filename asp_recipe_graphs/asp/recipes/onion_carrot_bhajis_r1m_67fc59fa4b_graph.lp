% Recipe graph declaration
recipe_graph(rg_onion_carrot_bhajis_r1m_67fc59fa4b).

% Arcs (relationships between consumables and actions)
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(0), a(0))). % Vegetable oil -> heat
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(a(0), c(1))). % heat -> Heated oil
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(2), a(1))). % Flour -> mix
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(3), a(1))). % Chickpea flour -> mix
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(4), a(1))). % Baking soda -> mix
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(5), a(1))). % Grated ginger -> mix
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(6), a(1))). % Minced garlic -> mix
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(7), a(1))). % Ground cinnamon -> mix
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(8), a(1))). % Cayenne -> mix
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(9), a(1))). % Ground cumin -> mix
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(10), a(1))). % Yogurt -> mix
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(a(1), c(11))). % mix -> Batter
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(12), a(2))). % Onion -> combine
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(13), a(2))). % Carrots -> combine
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(11), a(2))). % Batter -> combine
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(a(2), c(14))). % combine -> Coated vegetables
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(1), a(3))). % Heated oil -> fry
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(14), a(3))). % Coated vegetables -> fry
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(a(3), c(15))). % fry -> Cooked bhajis
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(15), a(4))). % Cooked bhajis -> drain
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(a(4), c(16))). % drain -> Drained bhajis
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(16), a(5))). % Drained bhajis -> add
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(c(17), a(5))). % Salt -> add
in(arcs(rg_onion_carrot_bhajis_r1m_67fc59fa4b), arc(a(5), c(18))). % add -> Onion and carrot bhajis
