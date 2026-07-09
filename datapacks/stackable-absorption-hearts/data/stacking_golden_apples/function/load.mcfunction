# This function is run when the datapack is first loaded by the server

# THE MAXIMUM STACK VALUE CAN BE CHANGED AT THE END OF THE FILE "apply_stacked_effect.mcfunction"

# Removing any remains from the datapack being loaded before
scoreboard objectives remove datapack_stacking_absorption
scoreboard objectives remove datapack_stacking_absorption_duration
scoreboard objectives remove datapack_stacking_absorption_variables
scoreboard objectives remove datapack_stacking_absorption_health
scoreboard objectives remove datapack_stacking_absorption_health_calc
scoreboard objectives remove datapack_stacking_absorption_health_calc2
scoreboard objectives remove datapack_stacking_absorption_leave
schedule clear stacking_golden_apples:decrease_duration_loop
advancement revoke @a only stacking_golden_apples:absorption_boost_golden_apple
advancement revoke @a only stacking_golden_apples:absorption_boost_golden_apple_enchanted

# Initialize scoreboard to track absorption stack
scoreboard objectives add datapack_stacking_absorption dummy "Stacking Absorption"
execute as @a run scoreboard players set @s datapack_stacking_absorption -1

# Initialize scoreboard to track remaining absorption duration
scoreboard objectives add datapack_stacking_absorption_duration dummy "Absorption Duration"
execute as @a run scoreboard players set @s datapack_stacking_absorption_duration -1

# Initialize scoreboard containing values used in the functions
scoreboard objectives add datapack_stacking_absorption_variables dummy "Absorption Constants"
scoreboard players set NoneActive datapack_stacking_absorption_variables 1
scoreboard players set Score004 datapack_stacking_absorption_variables 4
scoreboard players set Score006 datapack_stacking_absorption_variables 6
scoreboard players set Score020 datapack_stacking_absorption_variables 20

# Initialize scoreboard to help track damage absorbed by the Absorption hearts
scoreboard objectives add datapack_stacking_absorption_health health "Absorption Health"
scoreboard objectives add datapack_stacking_absorption_health_calc dummy "Absorption Health Calc"
scoreboard objectives add datapack_stacking_absorption_health_calc2 dummy "Absorption Health Calc2"
# Damage players not yet listed on the health scoreboard by 0.01 to start tracking them automatically
execute as @a unless score @s datapack_stacking_absorption_health matches -99999..99999 run damage @s 0.01

# Add pre-existing stack back at full duration in singleplayer (useful for datapack reloads)
schedule function stacking_golden_apples:reload_scheduled_reapply 20

# Add pre-existing stack back at full duration for players joining a server
scoreboard objectives add datapack_stacking_absorption_leave minecraft.custom:minecraft.leave_game