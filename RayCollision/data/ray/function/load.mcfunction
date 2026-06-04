scoreboard objectives add ray.ox dummy
scoreboard objectives add ray.oy dummy
scoreboard objectives add ray.oz dummy

scoreboard objectives add ray.dx dummy
scoreboard objectives add ray.dy dummy
scoreboard objectives add ray.dz dummy

scoreboard objectives add ray.abs_dx dummy
scoreboard objectives add ray.abs_dy dummy
scoreboard objectives add ray.abs_dz dummy

scoreboard objectives add ray.bx dummy
scoreboard objectives add ray.by dummy
scoreboard objectives add ray.bz dummy

scoreboard objectives add ray.stepX dummy
scoreboard objectives add ray.stepY dummy
scoreboard objectives add ray.stepZ dummy

scoreboard objectives add ray.nextX dummy
scoreboard objectives add ray.nextY dummy
scoreboard objectives add ray.nextZ dummy

scoreboard objectives add ray.modX dummy
scoreboard objectives add ray.modY dummy
scoreboard objectives add ray.modZ dummy

scoreboard objectives add ray.eX dummy
scoreboard objectives add ray.eY dummy
scoreboard objectives add ray.eZ dummy

scoreboard objectives add ray.abs_eX dummy
scoreboard objectives add ray.abs_eY dummy
scoreboard objectives add ray.abs_eZ dummy

scoreboard objectives add ray.eXdY dummy
scoreboard objectives add ray.eXdZ dummy
scoreboard objectives add ray.eYdX dummy
scoreboard objectives add ray.eYdZ dummy
scoreboard objectives add ray.eZdX dummy
scoreboard objectives add ray.eZdY dummy

scoreboard objectives add ray.cmpXY dummy
scoreboard objectives add ray.cmpYZ dummy
scoreboard objectives add ray.cmpZX dummy

scoreboard objectives add ray.collapsed dummy

scoreboard objectives add ray.cX dummy
scoreboard objectives add ray.cY dummy
scoreboard objectives add ray.cZ dummy

scoreboard objectives add const dummy
scoreboard players set 1000 const 1000
scoreboard players set -1 const -1

scoreboard objectives add ray.moved_direction dummy

data merge storage ray {data: {visited: []}}