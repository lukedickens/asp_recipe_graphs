% Recipe graph declaration
recipe_graph(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a).

% Arcs (relationships between consumables and actions)
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(c(0), a(0))). % Cumin seed -> toast
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(c(1), a(0))). % Mustard seed -> toast
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(a(0), c(2))). % toast -> Toasted seeds
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(c(2), a(1))). % Toasted seeds -> add and cook
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(c(3), a(1))). % Onion -> add and cook
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(c(4), a(1))). % Serrano chilies -> add and cook
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(a(1), c(5))). % add and cook -> Cooked onions and chilies
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(c(5), a(2))). % Cooked onions and chilies -> mix
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(c(6), a(2))). % Potatoes -> mix
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(c(7), a(2))). % Ground cumin -> mix
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(c(8), a(2))). % Ground coriander -> mix
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(c(9), a(2))). % Turmeric -> mix
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(c(10), a(2))). % Salt -> mix
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(c(11), a(2))). % Cayenne pepper -> mix
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(a(2), c(12))). % mix -> Spiced potato mixture
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(c(12), a(3))). % Spiced potato mixture -> cook
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(c(13), a(3))). % Water -> cook
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(a(3), c(14))). % cook -> Cooked potatoes
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(c(14), a(4))). % Cooked potatoes -> add
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(c(15), a(4))). % Cilantro -> add
in(arcs(rg_indian_potatoes_mustard_seeds_r1m_6f1343402a), arc(a(4), c(16))). % add -> Indian potatoes with mustard seeds

