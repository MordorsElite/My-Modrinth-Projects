# This function is triggered by the loop in decrease_duration_loop when the duration = 0 

# Adjust stack level based on received damage
execute as @s run function stacking_golden_apples:calculate_current_absorption_level

# Reduce stack by one
scoreboard players remove @s datapack_stacking_absorption 1

# Reset decrement timer if there is an active score remaining
execute as @s if score @s datapack_stacking_absorption matches 0.. run scoreboard players set @s datapack_stacking_absorption_duration 2399

# Apply remaining score (function will do nothing if the stack has run out)
execute as @s run function stacking_golden_apples:apply_stacked_effect