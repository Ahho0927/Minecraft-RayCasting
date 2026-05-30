scoreboard players set @s ray.stepY 1

# oy를 1000의 자리에서 내림 후 +1
scoreboard players operation @s ray.nextY = @s ray.oy
scoreboard players operation @s ray.modY = @s ray.nextY
scoreboard players operation @s ray.modY %= 1000 const
scoreboard players operation @s ray.nextY -= @s ray.modY
scoreboard players add @s ray.nextY 1000

scoreboard players operation @s ray.eY = @s ray.nextY
scoreboard players operation @s ray.eY -= @s ray.oy