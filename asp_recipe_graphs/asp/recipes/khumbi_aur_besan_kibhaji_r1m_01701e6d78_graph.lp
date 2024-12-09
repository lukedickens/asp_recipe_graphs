% Recipe graph declaration
recipe_graph(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78).

% Arcs (relationships between consumables and actions)
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(c(0), a(0))). % Mushrooms -> Wash and quarter
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(a(0), c(1))). % Wash and quarter -> Quartered mushrooms
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(c(2), a(1))). % Cooking oil -> Heat and fry garlic
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(c(3), a(1))). % Crushed garlic -> Heat and fry garlic
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(a(1), c(4))). % Heat and fry garlic -> Fried garlic mixture
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(c(4), a(2))). % Fried garlic mixture -> Add mushrooms
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(c(1), a(2))). % Quartered mushrooms -> Add mushrooms
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(a(2), c(5))). % Add mushrooms -> Garlic mushroom mixture
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(c(5), a(3))). % Garlic mushroom mixture -> Add spices
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(c(6), a(3))). % Salt -> Add spices
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(c(7), a(3))). % Chili powder -> Add spices
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(c(8), a(3))). % Coriander -> Add spices
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(a(3), c(9))). % Add spices -> Spiced mushroom mixture
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(c(9), a(4))). % Spiced mushroom mixture -> Add lemon juice
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(c(10), a(4))). % Lemon juice -> Add lemon juice
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(a(4), c(11))). % Add lemon juice -> Lemon spiced mushroom mixture
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(c(11), a(5))). % Lemon spiced mushroom mixture -> Add flour
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(c(12), a(5))). % Besan flour -> Add flour
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(a(5), c(13))). % Add flour -> Flour-coated mushroom mixture
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(c(13), a(6))). % Flour-coated mushroom mixture -> Add water
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(c(14), a(6))). % Water -> Add water
in(arcs(rg_khumbi_aur_besan_kibhaji_r1m_01701e6d78), arc(a(6), c(15))). % Add water -> Mushroom bhaji with sauce

