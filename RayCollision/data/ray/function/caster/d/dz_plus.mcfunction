scoreboard players set @s ray.stepZ 1

# oz를 1000의 자리에서 내림 후 +1
scoreboard players operation @s ray.nextZ = @s ray.oz
scoreboard players operation @s ray.modZ = @s ray.nextZ
scoreboard players operation @s ray.modZ %= 1000 const
scoreboard players operation @s ray.nextZ -= @s ray.modZ
scoreboard players add @s ray.nextZ 1000

scoreboard players operation @s ray.eZ = @s ray.nextZ
scoreboard players operation @s ray.eZ -= @s ray.oz