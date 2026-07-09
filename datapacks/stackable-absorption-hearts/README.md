# Stacking Absorption Hearts

A Minecraft datapack that allows the yellow hearts to stack when eating multiple (Enchanted) Golden Apples, instead of merely resetting their effect duration.

There are three versions of this datapack:

- Gradual Decrease: The stack of hearts currently active slowly decreases by 2 hearts ever 120 seconds. Personally I recommend this version!
- Instant Decay: The stack of hearts is removed all at once as soon as the 120s of duration are up
- No Stacking: The stack of hearts decreases by 2 hearts every 2 minutes. However eating multiple golden apples will NOT increase the absorption level

The code in this repo shows the "Gradual Decrease" version.

The first two versions allow you to change the maximum number of hearts you can reach. By default I have set this value to `99`. This can be changed for the gradual-decrease version in the file `data/stacking_golden_apples/function/apply_stacked_effect.mcfunction` and for the instant-decay version in the file `data/stacking_golden_apples/function/load.mcfunction`.

The gradual-decrease version also allows you to "over-charge" the hearts, meaning by eating more apples when already on the max level, you can add additional invisible stacks that need to decay first, before the actual hearts will decrease. This can also be set in the file `data/stacking_golden_apples/function/apply_stacked_effect.mcfunction`