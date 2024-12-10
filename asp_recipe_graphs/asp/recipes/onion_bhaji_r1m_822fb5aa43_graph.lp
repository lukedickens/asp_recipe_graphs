% Recipe graph declaration
recipe_graph(rg_onion_bhaji_r1m_822fb5aa43).

% Arcs (relationships between consumables and actions)
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(c(0), a(0))). % Onions -> slice
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(a(0), c(1))). % cut -> Sliced onion
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(c(1), a(1))). % Onion strands -> mix
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(c(2), a(1))). % Cumin powder -> mix
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(c(3), a(1))). % Turmeric -> mix
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(c(4), a(1))). % Chili powder -> mix
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(c(5), a(1))). % Salt -> mix
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(a(1), c(6))). % mix -> Spiced onion strands
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(c(6), a(2))). % Spiced onion strands -> add vinegar
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(c(7), a(2))). % Vinegar -> add vinegar
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(a(2), c(8))). % add vinegar -> Vinegared onion mix
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(c(8), a(3))). % Vinegared onion mix -> stir in flour
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(c(9), a(3))). % Flour -> stir in flour
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(a(3), c(10))). % stir in flour -> Onion ball mix
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(c(10), a(4))). % Onion ball mix -> form balls
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(a(4), c(11))). % form balls -> Formed onion balls
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(c(12), a(5))). % Vegetable oil -> heat
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(a(5), c(13))). % heat -> Heated oil
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(c(11), a(6))). % Formed onion balls -> fry
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(c(13), a(6))). % Heated oil -> fry
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(a(6), c(14))). % fry -> Fried onion bhajis
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(c(14), a(7))). % Fried onion bhajis -> drain
in(arcs(rg_onion_bhaji_r1m_822fb5aa43), arc(a(7), c(15))). % drain -> Onion bhajis

