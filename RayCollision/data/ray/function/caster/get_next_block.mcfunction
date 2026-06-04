# cmpXY = (eX * dY) - (eY * dX)
scoreboard players operation @s ray.eXdY = @s ray.abs_eX
scoreboard players operation @s ray.eXdY *= @s ray.abs_dy
scoreboard players operation @s ray.eYdX = @s ray.abs_eY
scoreboard players operation @s ray.eYdX *= @s ray.abs_dx
scoreboard players operation @s ray.cmpXY = @s ray.eXdY
scoreboard players operation @s ray.cmpXY -= @s ray.eYdX
# cmpYZ = (eY * dZ) - (eZ * dY)
scoreboard players operation @s ray.eYdZ = @s ray.abs_eY
scoreboard players operation @s ray.eYdZ *= @s ray.abs_dz
scoreboard players operation @s ray.eZdY = @s ray.abs_eZ
scoreboard players operation @s ray.eZdY *= @s ray.abs_dy
scoreboard players operation @s ray.cmpYZ = @s ray.eYdZ
scoreboard players operation @s ray.cmpYZ -= @s ray.eZdY
# cmpZX = (eZ * dX) - (eX * dZ)
scoreboard players operation @s ray.eZdX = @s ray.abs_eZ
scoreboard players operation @s ray.eZdX *= @s ray.abs_dx
scoreboard players operation @s ray.eXdZ = @s ray.abs_eX
scoreboard players operation @s ray.eXdZ *= @s ray.abs_dz
scoreboard players operation @s ray.cmpZX = @s ray.eZdX
scoreboard players operation @s ray.cmpZX -= @s ray.eXdZ

# ray.moved_direction: 1 for x, 2 for y, 3 for z, 0 for NULL
scoreboard players set @s ray.moved_direction 0
# compare which boundary is the closest one
execute unless score @s ray.stepX matches 0 if score @s ray.cmpXY matches ..-1 if score @s ray.cmpZX matches 0.. run function ray:caster/step/x
execute unless score @s ray.stepY matches 0 if score @s ray.cmpYZ matches ..-1 if score @s ray.cmpXY matches 0.. run function ray:caster/step/y
execute unless score @s ray.stepZ matches 0 if score @s ray.cmpZX matches ..-1 if score @s ray.cmpYZ matches 0.. run function ray:caster/step/z

# append positions
data modify storage ray data.visited append value {b: {x: 0, y: 0, z: 0}, c: {x: 0, y: 0, z: 0}, tangent: ""}
execute store result storage ray data.visited[-1].b.x int 1 run scoreboard players get @s ray.bx
execute store result storage ray data.visited[-1].b.y int 1 run scoreboard players get @s ray.by
execute store result storage ray data.visited[-1].b.z int 1 run scoreboard players get @s ray.bz
execute store result storage ray data.visited[-1].c.x float 0.001 run scoreboard players get @s ray.cX
execute store result storage ray data.visited[-1].c.y float 0.001 run scoreboard players get @s ray.cY
execute store result storage ray data.visited[-1].c.z float 0.001 run scoreboard players get @s ray.cZ
execute if score @s ray.moved_direction matches 1 run data modify storage ray data.visited[-1].tangent set value "x"
execute if score @s ray.moved_direction matches 2 run data modify storage ray data.visited[-1].tangent set value "y"
execute if score @s ray.moved_direction matches 3 run data modify storage ray data.visited[-1].tangent set value "z"

function ray:caster/check_block with storage ray data.visited[-1].b
# function ray:caster/display/block with storage ray data.visited[-1]