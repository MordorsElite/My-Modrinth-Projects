# Calculate current absorption level based on player health
scoreboard players operation @s datapack_stacking_absorption_health_calc = @s datapack_stacking_absorption_health
scoreboard players operation @s datapack_stacking_absorption_health_calc /= Score004 datapack_stacking_absorption_variables
scoreboard players operation @s datapack_stacking_absorption_health_calc -= Score006 datapack_stacking_absorption_variables

# Adjust up by one in case of partial stacks, so as to never reduce by more than 2 hearts at a time
scoreboard players operation @s datapack_stacking_absorption_health_calc2 = @s datapack_stacking_absorption_health
scoreboard players operation @s datapack_stacking_absorption_health_calc2 -= Score020 datapack_stacking_absorption_variables
execute if score @s datapack_stacking_absorption_health_calc2 matches ..0 run scoreboard players set @s datapack_stacking_absorption_health_calc2 0
scoreboard players operation @s datapack_stacking_absorption_health_calc2 %= Score004 datapack_stacking_absorption_variables
execute if score @s datapack_stacking_absorption_health_calc2 matches 1..3 run scoreboard players add @s datapack_stacking_absorption_health_calc 1

# Overwrite the score (stack) in datapack_stacking_absorption with adjusted damage score
scoreboard players operation @s datapack_stacking_absorption = @s datapack_stacking_absorption_health_calc
execute if score @s datapack_stacking_absorption matches ..-1 run scoreboard players set @s datapack_stacking_absorption -1