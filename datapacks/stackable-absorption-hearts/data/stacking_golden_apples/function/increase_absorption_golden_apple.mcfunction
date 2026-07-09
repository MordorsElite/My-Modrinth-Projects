# Revoke the advancement triggering this function so the player can trigger it again
advancement revoke @a only stacking_golden_apples:absorption_boost_golden_apple

# Ensure the player triggering this function is listed with -1 on the "datapack_stacking_absorption" scoreboard
execute unless score @s datapack_stacking_absorption matches -10000..10000 run scoreboard players set @s datapack_stacking_absorption -1

# Adjust for damage taken since the last time the player ate a Golden Apple
execute as @s run function stacking_golden_apples:calculate_current_absorption_level_ignore_partial

# The score associated with the player on gets increased by 1 (2 hearts)
scoreboard players add @s datapack_stacking_absorption 1

# Reset the duration scoreboard score to 120 seconds
scoreboard players set @s datapack_stacking_absorption_duration 2399

# Apply the stacked effect
execute as @s run function stacking_golden_apples:apply_stacked_effect

# Start loop for gradually reducing level of stacking effect
function stacking_golden_apples:decrease_duration_loop