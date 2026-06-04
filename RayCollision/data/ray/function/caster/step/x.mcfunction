# cX = dx * (eX / dx) = eX
scoreboard players operation @s ray.cX = @s ray.eX
# cY = dy * (eX / dx)
# cZ = dz * (eX / dx)
scoreboard players operation @s ray.cY = @s ray.dy
scoreboard players operation @s ray.cZ = @s ray.dz
scoreboard players operation @s ray.cY *= @s ray.eX
scoreboard players operation @s ray.cZ *= @s ray.eX
scoreboard players operation @s ray.cY /= @s ray.dx
scoreboard players operation @s ray.cZ /= @s ray.dx

scoreboard players operation @s ray.bx += @s ray.stepX
scoreboard players operation @s ray.abs_eX += 1000 const
scoreboard players operation @s ray.eX = @s ray.abs_eX
scoreboard players operation @s ray.eX *= @s ray.stepX

scoreboard players set @s ray.moved_direction 1