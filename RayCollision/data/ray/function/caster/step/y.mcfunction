# cY = dy * (eY / dy) = eY
scoreboard players operation @s ray.cY = @s ray.eY
# cX = dx * (eY / dy)
# cZ = dz * (eY / dy)
scoreboard players operation @s ray.cX = @s ray.dx
scoreboard players operation @s ray.cZ = @s ray.dz
scoreboard players operation @s ray.cX *= @s ray.eY
scoreboard players operation @s ray.cZ *= @s ray.eY
scoreboard players operation @s ray.cX /= @s ray.dy
scoreboard players operation @s ray.cZ /= @s ray.dy

scoreboard players operation @s ray.by += @s ray.stepY
scoreboard players operation @s ray.abs_eY += 1000 const
scoreboard players operation @s ray.eY = @s ray.abs_eY
scoreboard players operation @s ray.eY *= @s ray.stepY

scoreboard players set @s ray.moved_direction 2