scoreboard players set @s ray.stepY -1

# oy를 1000의 자리에서 내림
scoreboard players operation @s ray.nextY = @s ray.oy
scoreboard players operation @s ray.modY = @s ray.nextY
scoreboard players operation @s ray.modY %= 1000 const
scoreboard players operation @s ray.nextY -= @s ray.modY

scoreboard players operation @s ray.eY = @s ray.nextY
scoreboard players operation @s ray.eY -= @s ray.oy