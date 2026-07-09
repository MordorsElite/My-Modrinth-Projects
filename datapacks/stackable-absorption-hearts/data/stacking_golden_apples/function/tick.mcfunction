# Triggers when a player joins the server and reapplies there latest absorption effect
execute as @a[scores={datapack_stacking_absorption_leave=1..}] run function stacking_golden_apples:reapply_stacked_effect

# Trigger Gradual Decrease Check
function stacking_golden_apples:decrease_duration_loop