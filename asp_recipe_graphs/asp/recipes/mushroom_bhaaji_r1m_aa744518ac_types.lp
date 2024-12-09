% Recipe declaration
recipe(rg_mushroom_bhaaji_r1m_aa744518ac, tf_mushroom_bhaaji_r1m_aa744518ac).

% Typing function
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, c(0), "oil").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, c(1), "mustard seeds").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, c(2), "cumin seeds").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, c(3), "raw onion").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, c(4), "fried onion").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, c(5), "mushrooms").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, c(6), "mushrooms in spiced onion").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, c(7), "crushed garlic").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, c(8), "plain yogurt").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, c(9), "cayenne pepper").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, c(10), "ground coriander").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, c(11), "salt").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, c(12), "bhaji preparation").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, c(13), "unfinished mushroom bhaji").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, c(14), "cilantro").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, c(15), "mushroom bhaaji").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, a(0), "fry").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, a(1), "add").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, a(2), "mix").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, a(3), "cook").
type_of(tf_mushroom_bhaaji_r1m_aa744518ac, a(4), "add").


child("mushrooms in spiced onion", "preparation").
child("unfinished mushroom bhaji", "preparation").
child("mushroom bhaaji", "dish").
