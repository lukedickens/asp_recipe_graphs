% Recipe graph declaration
recipe_graph(rg_mushroom_bhaji_r1m_c7ff07643c).

% Arcs (relationships between consumables and actions)
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(c(0), a(0))). % Oil -> Fry onions
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(c(1), a(0))). % Onion -> Fry onions
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(a(0), c(2))). % Fry onions -> Fried onions
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(c(2), a(1))). % Fried onions -> Add spices
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(c(3), a(1))). % Garlic -> Add spices
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(c(4), a(1))). % Turmeric -> Add spices
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(c(5), a(1))). % Chili powder -> Add spices
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(c(6), a(1))). % Coriander -> Add spices
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(c(7), a(1))). % Cumin -> Add spices
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(c(8), a(1))). % Water -> Add spices
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(a(1), c(9))). % Add spices -> Spiced mixture
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(c(9), a(2))). % Spiced mixture -> Mix with tomato puree
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(c(10), a(2))). % Tomato puree -> Mix with spiced mixture
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(a(2), c(11))). % Mix -> Combined mixture
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(c(11), a(3))). % Combined mixture -> Add mushrooms
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(c(12), a(3))). % Mushrooms -> Add mushrooms
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(a(3), c(13))). % Add mushrooms -> Bhaji preparation
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(c(13), a(4))). % Bhaji preparation -> Simmer
in(arcs(rg_mushroom_bhaji_r1m_c7ff07643c), arc(a(4), c(14))). % Simmer -> Mushroom Bhaji

