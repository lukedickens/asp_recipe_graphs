% Recipe graph declaration
recipe_graph(rg_mushroom_bhaaji_r1m_aa744518ac).

% Arcs (relationships between consumables and actions)
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(c(0), a(0))). % Oil -> Fry
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(c(1), a(0))). % Mustard seeds -> Fry
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(c(2), a(0))). % Cumin seeds -> Fry
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(c(3), a(0))). % Raw onions -> Fry
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(a(0), c(4))). % Fry -> Fried onions
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(c(4), a(1))). % Fried onions -> Add
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(c(5), a(1))). % Mushrooms -> Add
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(a(1), c(6))). % Add -> Mushrooms in spiced onions
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(c(6), a(2))). % Mushrooms in spiced onions -> Mix
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(c(7), a(2))). % Crushed garlic -> Mix
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(c(8), a(2))). % Plain yogurt -> Mix
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(c(9), a(2))). % Cayenne pepper -> Mix
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(c(10), a(2))). % Ground coriander -> Mix
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(c(11), a(2))). % Salt -> Mix
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(a(2), c(12))). % Mix -> Bhaji mixture
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(c(12), a(3))). % Bhaji mixture -> Cook
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(a(3), c(13))). % Cook -> Cooked bhaji
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(c(13), a(4))). % Cooked bhaji -> Add
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(c(14), a(4))). % Cilantro -> Add
in(arcs(rg_mushroom_bhaaji_r1m_aa744518ac), arc(a(4), c(15))). % Add -> Mushroom bhaaji

