# Triggered once duration is up. Decreases level by one, then resets the duration score counter to 120 seconds
execute as @a if score @s datapack_stacking_absorption_duration matches 0 if score @s datapack_stacking_absorption matches 0.. run execute as @s run function stacking_golden_apples:decrease_stacked_effect

# Decrease duration score by one tick if the duration is above -1
execute as @a if score @s datapack_stacking_absorption_duration matches 0.. run scoreboard players remove @s datapack_stacking_absorption_duration 1

# Continue loop as long as any player has an active absorption affect that is being tracked
#scoreboard players set NoneActive datapack_stacking_absorption_constants 1
#execute as @a if score @s datapack_stacking_absorption_duration > ScoreMinusOne datapack_stacking_absorption_constants run scoreboard players set NoneActive datapack_stacking_absorption_constants 0
#execute if score NoneActive datapack_stacking_absorption_constants matches 0 run schedule clear stacking_golden_apples:decrease_duration_loop
#execute if score NoneActive datapack_stacking_absorption_constants matches 0 run schedule function stacking_golden_apples:decrease_duration_loop 1t replace