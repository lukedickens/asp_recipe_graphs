valid_input_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)),"boiling salted water",1).
valid_input_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)),"uncooked fusilli",2).
valid_action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)),"boil for 10 min").
valid_output_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(0)),"undrained cooked fusilli",1).

valid_input_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)),"cold pomodoro sauce",1).
valid_input_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)),"fried onion",2).
valid_action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)),"mix and heat").
valid_output_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(1)),"hot pomodoro sauce",1).

valid_input_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)),"undrained cooked fusilli",1).
valid_action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)),"drain").
valid_output_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)),"drained cooked fusilli",1).
valid_output_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(2)),"pasta water",2).

valid_input_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(3)),"drained cooked fusilli",1).
valid_action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(3)),"pour into bowl").
valid_output_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(3)),"fusilli in bowl",1).

valid_input_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)),"fusilli in bowl",1).
valid_input_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)),"hot pomodoro sauce",2).
valid_action_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)),"mix in bowl").
valid_output_element((rg_fusilli_pomodoro,tf_fusilli_pomodoro,a(4)),"fusilli pomodoro",1).

