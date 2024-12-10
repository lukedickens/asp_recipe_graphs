% Recipe graph declaration
recipe_graph(rg_spinach_onion_bhaji_r1m_cf99c56bfc).

% Arcs (relationships between consumables and actions)
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(0), a(0))). % Spinach -> thaw
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(a(0), c(1))). % thaw -> Thawed spinach
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(1), a(1))). % Thawed spinach -> chop
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(a(1), c(2))). % chop -> Chopped spinach
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(3), a(2))). % Oil -> heat
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(a(2), c(4))). % heat -> Heated oil
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(4), a(3))). % Heated oil -> cook seeds
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(5), a(3))). % Cumin seeds -> cook seeds
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(6), a(3))). % Fenugreek seeds -> cook seeds
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(7), a(3))). % Black mustard seeds -> cook seeds
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(a(3), c(8))). % cook seeds -> Popped seeds
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(8), a(4))). % Popped seeds -> sauté
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(9), a(4))). % Sliced onion -> sauté
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(10), a(4))). % Garlic -> sauté
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(11), a(4))). % Chili -> sauté
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(12), a(4))). % Grated ginger -> sauté
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(a(4), c(13))). % sauté -> Golden onion mixture
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(13), a(5))). % Golden onion mixture -> cook vegetables
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(2), a(5))). % Chopped spinach -> cook vegetables
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(14), a(5))). % Chopped tomato -> cook vegetables
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(15), a(5))). % Salt -> cook vegetables
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(a(5), c(16))). % cook vegetables -> Cooked bhaji
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(16), a(6))). % Cooked bhaji -> add lemon
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(c(17), a(6))). % Lemon juice -> add lemon
in(arcs(rg_spinach_onion_bhaji_r1m_cf99c56bfc), arc(a(6), c(18))). % add lemon -> Finished bhaji

