% Recipe graph declaration
recipe_graph(rg_mushroom_bhaji_r1m_a5b1ad6c1f).

% Arcs (relationships between consumables and actions)
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(c(0), a(0))). % Oil -> fry onion
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(c(1),a(0))). % raw onion -> fry onion
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(a(0),c(2))). % fry onion -> fried onion
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(c(2), a(1))). % Fried onion -> Add spices
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(c(3), a(1))). % Garlic -> Add spices
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(c(4), a(1))). % Turmeric -> Add spices
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(c(5), a(1))). % Chili powder -> Add spices
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(c(6), a(1))). % Cumin -> Add spices
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(c(7), a(1))). % Coriander -> Add spices
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(c(8), a(1))). % Salt -> Add spices
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(a(1), c(9))). % Add spices -> Spiced mixture
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(c(9), a(2))). % Spiced mixture -> Mix with tomato paste
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(c(10), a(2))). % Tomato paste -> Mix with spiced mixture
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(a(2), c(11))). % Mix -> Combined mixture
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(c(11), a(3))). % Combined mixture -> Add mushrooms
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(c(12), a(3))). % Mushrooms -> Add mushrooms
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(a(3), c(13))). % Add mushrooms -> Bhaji preparation
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(c(13), a(4))). % Bhaji preparation -> Simmer
in(arcs(rg_mushroom_bhaji_r1m_a5b1ad6c1f), arc(a(4), c(14))). % Simmer -> Mushroom bhaji

