% Recipe graph declaration
recipe_graph(rg_green_bhaji_r1m_4760988563).

% Arcs (relationships between consumables and actions)
in(arcs(rg_green_bhaji_r1m_4760988563), arc(c(0), a(0))). % Ginger -> grind
in(arcs(rg_green_bhaji_r1m_4760988563), arc(c(1), a(0))). % Garlic -> grind
in(arcs(rg_green_bhaji_r1m_4760988563), arc(c(2), a(0))). % Green chilies -> grind
in(arcs(rg_green_bhaji_r1m_4760988563), arc(c(3), a(0))). % Coriander -> grind
in(arcs(rg_green_bhaji_r1m_4760988563), arc(a(0), c(4))). % grind -> Masala paste
in(arcs(rg_green_bhaji_r1m_4760988563), arc(c(5), a(1))). % Ghee/oil -> heat
in(arcs(rg_green_bhaji_r1m_4760988563), arc(c(6), a(1))). % Sliced onions -> heat
in(arcs(rg_green_bhaji_r1m_4760988563), arc(a(1), c(7))). % heat -> Browned onions
in(arcs(rg_green_bhaji_r1m_4760988563), arc(c(4), a(2))). % Masala paste -> fry
in(arcs(rg_green_bhaji_r1m_4760988563), arc(c(7), a(2))). % Browned onions -> fry
in(arcs(rg_green_bhaji_r1m_4760988563), arc(a(2), c(8))). % fry -> Fried masala mix
in(arcs(rg_green_bhaji_r1m_4760988563), arc(c(8), a(3))). % Fried masala mix -> add and cook
in(arcs(rg_green_bhaji_r1m_4760988563), arc(c(9), a(3))). % Turmeric -> add and cook
in(arcs(rg_green_bhaji_r1m_4760988563), arc(c(10), a(3))). % Salt -> add and cook
in(arcs(rg_green_bhaji_r1m_4760988563), arc(c(11), a(3))). % Peas -> add and cook
in(arcs(rg_green_bhaji_r1m_4760988563), arc(c(12), a(3))). % Chopped spinach -> add and cook
in(arcs(rg_green_bhaji_r1m_4760988563), arc(c(13), a(3))). % Chopped tomatoes -> add and cook
in(arcs(rg_green_bhaji_r1m_4760988563), arc(c(14), a(3))). % Water -> add and cook
in(arcs(rg_green_bhaji_r1m_4760988563), arc(a(3), c(15))). % add and cook -> Cooked green bhaji
in(arcs(rg_green_bhaji_r1m_4760988563), arc(c(15), a(4))). % Cooked green bhaji -> mix
in(arcs(rg_green_bhaji_r1m_4760988563), arc(c(16), a(4))). % Garam masala -> mix
in(arcs(rg_green_bhaji_r1m_4760988563), arc(a(4), c(17))). % mix -> Green bhaji

