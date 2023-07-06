%%%%%%%%%%%%%%%%%%%%%%%%%%%
% typing function
%%%%%%%%%%%%%%%%%%%%%%%%%%%

given_recipe(rg_bbc_vegan_sponge_cake,tf_bbc_vegan_sponge_cake).
given_type_of(tf_bbc_vegan_sponge_cake,c(0),"oat milk").
given_type_of(tf_bbc_vegan_sponge_cake,c(1),"cider vinegar").
given_type_of(tf_bbc_vegan_sponge_cake,c(2),"mixture of cider vinegar and oat milk").
given_type_of(tf_bbc_vegan_sponge_cake,c(3),"vanilla seeds").
given_type_of(tf_bbc_vegan_sponge_cake,c(4),"dairy-free spread").
given_type_of(tf_bbc_vegan_sponge_cake,c(5),"self-raising flour").
given_type_of(tf_bbc_vegan_sponge_cake,c(6),"golden caster sugar").
given_type_of(tf_bbc_vegan_sponge_cake,c(7),"bicarbonate of soda").
given_type_of(tf_bbc_vegan_sponge_cake,c(8),"mixture of bicarbonate of soda, dairy-free spread, golden caster sugar, self-raising flour, and vanilla seeds").
given_type_of(tf_bbc_vegan_sponge_cake,c(9),"vegan sponge cake mix").
given_type_of(tf_bbc_vegan_sponge_cake,c(10),"unfinished vegan sponge cake").
given_type_of(tf_bbc_vegan_sponge_cake,c(11),"strawberry jam").
given_type_of(tf_bbc_vegan_sponge_cake,c(12),"icing sugar").
given_type_of(tf_bbc_vegan_sponge_cake,c(13),"vegan sponge cake").

given_type_of(tf_bbc_vegan_sponge_cake,a(0),"cream together").
given_type_of(tf_bbc_vegan_sponge_cake,a(1),"combine").
given_type_of(tf_bbc_vegan_sponge_cake,a(2),"beat together until smooth").
given_type_of(tf_bbc_vegan_sponge_cake,a(3),"bake").
given_type_of(tf_bbc_vegan_sponge_cake,a(4),"fill and dust").


child("mixture of cider vinegar and oat milk","mixture").
child("mixture of bicarbonate of soda, dairy-free spread, golden caster sugar, self-raising flour, and vanilla seeds","mixture").


