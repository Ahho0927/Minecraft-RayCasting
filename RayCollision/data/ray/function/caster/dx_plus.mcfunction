scoreboard players set @s ray.stepX 1

# ox를 1000의 자리에서 내림 후 +1
scoreboard players operation @s ray.nextX = @s ray.ox
scoreboard players operation @s ray.modX = @s ray.nextX
scoreboard players operation @s ray.modX %= 1000 const
scoreboard players operation @s ray.nextX -= @s ray.modX
scoreboard players add @s ray.nextX 1000

scoreboard players operation @s ray.eX = @s ray.nextX
scoreboard players operation @s ray.eX -= @s ray.ox