% Recipe graph declaration
recipe_graph(rg_sattvic_herbs_bhaji_r1m_5bdff4673f).

% Arcs (relationships between consumables and actions)
in(arcs(rg_sattvic_herbs_bhaji_r1m_5bdff4673f), arc(c(0), a(0))). % Ghee -> heat
in(arcs(rg_sattvic_herbs_bhaji_r1m_5bdff4673f), arc(a(0), c(1))). % heat -> Heated ghee
in(arcs(rg_sattvic_herbs_bhaji_r1m_5bdff4673f), arc(c(1), a(1))). % Heated ghee -> fry
in(arcs(rg_sattvic_herbs_bhaji_r1m_5bdff4673f), arc(c(2), a(1))). % Mustard seeds -> fry
in(arcs(rg_sattvic_herbs_bhaji_r1m_5bdff4673f), arc(c(3), a(1))). % Nigella seeds -> fry
in(arcs(rg_sattvic_herbs_bhaji_r1m_5bdff4673f), arc(c(4), a(1))). % Turmeric -> fry
in(arcs(rg_sattvic_herbs_bhaji_r1m_5bdff4673f), arc(c(5), a(1))). % Ginger root -> fry
in(arcs(rg_sattvic_herbs_bhaji_r1m_5bdff4673f), arc(c(6), a(1))). % Dried red chili -> fry
in(arcs(rg_sattvic_herbs_bhaji_r1m_5bdff4673f), arc(c(7), a(1))). % Asafetida -> fry
in(arcs(rg_sattvic_herbs_bhaji_r1m_5bdff4673f), arc(a(1), c(8))). % fry -> Seasoned spices
in(arcs(rg_sattvic_herbs_bhaji_r1m_5bdff4673f), arc(c(8), a(2))). % Seasoned spices -> add and cook
in(arcs(rg_sattvic_herbs_bhaji_r1m_5bdff4673f), arc(c(9), a(2))). % Spinach -> add and cook
in(arcs(rg_sattvic_herbs_bhaji_r1m_5bdff4673f), arc(a(2), c(10))). % add and cook -> Cooked spinach
in(arcs(rg_sattvic_herbs_bhaji_r1m_5bdff4673f), arc(c(10), a(3))). % Cooked spinach -> add
in(arcs(rg_sattvic_herbs_bhaji_r1m_5bdff4673f), arc(c(11), a(3))). % Salt -> add
in(arcs(rg_sattvic_herbs_bhaji_r1m_5bdff4673f), arc(a(3), c(12))). % add -> Sattvic herbs bhaji

