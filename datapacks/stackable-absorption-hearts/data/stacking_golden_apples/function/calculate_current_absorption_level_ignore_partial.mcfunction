# Calculate current absorption level based on player health
scoreboard players operation @s datapack_stacking_absorption_health_calc = @s datapack_stacking_absorption_health
scoreboard players operation @s datapack_stacking_absorption_health_calc /= Score004 datapack_stacking_absorption_variables
scoreboard players operation @s datapack_stacking_absorption_health_calc -= Score006 datapack_stacking_absorption_variables

# Overwrite the score (stack) in datapack_stacking_absorption with adjusted damage score
scoreboard players operation @s datapack_stacking_absorption = @s datapack_stacking_absorption_health_calc
execute if score @s datapack_stacking_absorption matches ..-1 run scoreboard players set @s datapack_stacking_absorption -1