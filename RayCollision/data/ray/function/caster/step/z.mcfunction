# cZ = dz * (eZ / dz) = eZ
scoreboard players operation @s ray.cZ = @s ray.eZ
# cX = dx * (eZ / dz)
# cY = dy * (eZ / dz)
scoreboard players operation @s ray.cX = @s ray.dx
scoreboard players operation @s ray.cY = @s ray.dy
scoreboard players operation @s ray.cX *= @s ray.eZ
scoreboard players operation @s ray.cY *= @s ray.eZ
scoreboard players operation @s ray.cX /= @s ray.dz
scoreboard players operation @s ray.cY /= @s ray.dz

scoreboard players operation @s ray.bz += @s ray.stepZ
scoreboard players operation @s ray.abs_eZ += 1000 const
scoreboard players operation @s ray.eZ = @s ray.abs_eZ
scoreboard players operation @s ray.eZ *= @s ray.stepZ

scoreboard players set @s ray.moved_direction 3