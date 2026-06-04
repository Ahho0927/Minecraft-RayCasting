# warn-off-file

# get origin position & origin block position
summon minecraft:marker ^ ^ ^ {Tags:["ray.O"]}
execute store result score @s ray.ox run data get entity @n[tag=ray.O] Pos[0] 1000
execute store result score @s ray.oy run data get entity @n[tag=ray.O] Pos[1] 1000
execute store result score @s ray.oz run data get entity @n[tag=ray.O] Pos[2] 1000
execute store result score @s ray.bx run data get entity @n[tag=ray.O] Pos[0] 1
execute store result score @s ray.by run data get entity @n[tag=ray.O] Pos[1] 1
execute store result score @s ray.bz run data get entity @n[tag=ray.O] Pos[2] 1
kill @e[tag=ray.O]

# get direction vector
summon minecraft:marker ^ ^ ^1 {Tags:["ray.D"]}
execute store result score @s ray.dx run data get entity @n[tag=ray.D] Pos[0] 1000
execute store result score @s ray.dy run data get entity @n[tag=ray.D] Pos[1] 1000
execute store result score @s ray.dz run data get entity @n[tag=ray.D] Pos[2] 1000
kill @e[tag=ray.D]
scoreboard players operation @s ray.dx -= @s ray.ox
scoreboard players operation @s ray.dy -= @s ray.oy
scoreboard players operation @s ray.dz -= @s ray.oz

# get eX(distance to next boundary plane) & step
execute if score @s ray.dx matches 1.. run function ray:caster/d/dx_plus
execute if score @s ray.dx matches ..-1 run function ray:caster/d/dx_minus
execute if score @s ray.dx matches 0 run function ray:caster/d/dx_zero
execute if score @s ray.dy matches 1.. run function ray:caster/d/dy_plus
execute if score @s ray.dy matches ..-1 run function ray:caster/d/dy_minus
execute if score @s ray.dy matches 0 run function ray:caster/d/dy_zero
execute if score @s ray.dz matches 1.. run function ray:caster/d/dz_plus
execute if score @s ray.dz matches ..-1 run function ray:caster/d/dz_minus
execute if score @s ray.dz matches 0 run function ray:caster/d/dz_zero

# get absolute values
scoreboard players operation @s ray.abs_eX = @s ray.eX
execute if score @s ray.abs_eX matches ..-1 run scoreboard players operation @s ray.abs_eX *= -1 const
scoreboard players operation @s ray.abs_eY = @s ray.eY
execute if score @s ray.abs_eY matches ..-1 run scoreboard players operation @s ray.abs_eY *= -1 const
scoreboard players operation @s ray.abs_eZ = @s ray.eZ
execute if score @s ray.abs_eZ matches ..-1 run scoreboard players operation @s ray.abs_eZ *= -1 const
scoreboard players operation @s ray.abs_dx = @s ray.dx
execute if score @s ray.abs_dx matches ..-1 run scoreboard players operation @s ray.abs_dx *= -1 const
scoreboard players operation @s ray.abs_dy = @s ray.dy
execute if score @s ray.abs_dy matches ..-1 run scoreboard players operation @s ray.abs_dy *= -1 const
scoreboard players operation @s ray.abs_dz = @s ray.dz
execute if score @s ray.abs_dz matches ..-1 run scoreboard players operation @s ray.abs_dz *= -1 const

# # debug
# tellraw @s ["\n\n\n\n\n\n\n\n\n\n\n\n\n\n", \
#     "o: (", {"score": {"name": "@s", "objective": "ray.ox"}}, \
#     ", ", {"score": {"name": "@s", "objective": "ray.oy"}}, \
#     ", ", {"score": {"name": "@s", "objective": "ray.oz"}}, ") ", \
#     "d: (", {"score": {"name": "@s", "objective": "ray.dx"}}, \
#     ", ", {"score": {"name": "@s", "objective": "ray.dy"}}, \
#     ", ", {"score": {"name": "@s", "objective": "ray.dz"}}, ") ", \
#     "step: (", {"score": {"name": "@s", "objective": "ray.stepX"}}, \
#     ", ", {"score": {"name": "@s", "objective": "ray.stepY"}}, \
#     ", ", {"score": {"name": "@s", "objective": "ray.stepZ"}}, ") ", \
# ]

# initialize loop
scoreboard players set @s ray.cmpXY 0
scoreboard players set @s ray.cmpYZ 0
scoreboard players set @s ray.cmpZX 0
data merge storage ray {data: {visited: []}}

scoreboard players set @s ray.collapsed 0
execute if score @s ray.collapsed matches 0 run function ray:caster/get_next_block
execute if score @s ray.collapsed matches 0 run function ray:caster/get_next_block
execute if score @s ray.collapsed matches 0 run function ray:caster/get_next_block
execute if score @s ray.collapsed matches 0 run function ray:caster/get_next_block
execute if score @s ray.collapsed matches 0 run function ray:caster/get_next_block
execute if score @s ray.collapsed matches 0 run function ray:caster/get_next_block
execute if score @s ray.collapsed matches 0 run function ray:caster/get_next_block
execute if score @s ray.collapsed matches 0 run function ray:caster/get_next_block
execute if score @s ray.collapsed matches 0 run function ray:caster/get_next_block
execute if score @s ray.collapsed matches 0 run function ray:caster/get_next_block
execute if score @s ray.collapsed matches 0 run function ray:caster/get_next_block
execute if score @s ray.collapsed matches 0 run function ray:caster/get_next_block
execute if score @s ray.collapsed matches 0 run function ray:caster/get_next_block
execute if score @s ray.collapsed matches 0 run function ray:caster/get_next_block

# # debug
# tellraw @s ["\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", \
#     "visited: ", {"storage": "ray", "nbt": "data.visited[0].tangent"}, "\n", \
#     "visited: ", {"storage": "ray", "nbt": "data.visited[1].tangent"}, "\n", \
#     "visited: ", {"storage": "ray", "nbt": "data.visited[2].tangent"}, "\n", \
#     "visited: ", {"storage": "ray", "nbt": "data.visited[3].tangent"}, "\n", \
#     "visited: ", {"storage": "ray", "nbt": "data.visited[4].tangent"}, "\n", \
#     "visited: ", {"storage": "ray", "nbt": "data.visited[5].tangent"}, "\n", \
#     "visited: ", {"storage": "ray", "nbt": "data.visited[6].tangent"}, "\n", \
#     "visited: ", {"storage": "ray", "nbt": "data.visited[7].tangent"}, "\n", \
#     "visited: ", {"storage": "ray", "nbt": "data.visited[8].tangent"}, "\n", \
#     "visited: ", {"storage": "ray", "nbt": "data.visited[9].tangent"}, "\n", \
# ]


# execute if score @s ray.collapsed matches 1 run function ray:caster/display/block with storage ray data.visited[-1].b
# execute if score @s ray.collapsed matches 1 run function ray:caster/display/point with storage ray data.visited[-1].c
execute if score @s ray.collapsed matches 1 run function ray:caster/display/tangent with storage ray data.visited[-1]