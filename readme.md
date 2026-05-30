<h1 align="center"> RayCast </h1>

## 개요
ㄹㅇ 이보다 완벽한 레이캐스트는 있을 수가 없다 진짜

## 원리
기존 Bresenham의 한계를 극복한 3D Supercover DDA 알고리즘을 차용했다.\
다만, Amanatides & Woo 방식은 그 과정에서 다수의 float 연산(그것도 나눗셈)을 행하기 때문에 매우 부담이 되는 방식이다. float 연산은 대신 정수 연산을 최대한 활용하는 쪽으로 알고리즘을 재구성했다.

```
# -- basic functions --

function sgn(x):
    if x == 0: return x
    return x/x

function floor(x):
    return x - (x % 1)

function abs(x):
    if x < 0: return -x
    return x

# -- main --
현재위치(눈을 기준으로) o = (ox, oy, oz)
시선방향 단위벡터 d = (dx, dy, dz)

stepX, stepY, stepZ = sgn(dx), sgn(dy), sgn(dz)

nextX = floor(ox)
nextX = floor(ox)
nextX = floor(ox)
if stepX > 0: nextX += 1
if stepY > 0: nextY += 1
if stepZ > 0: nextZ += 1

eX, eY, eZ = nextX - ox, nextY - oy, nextZ - oz

visited = [] # 조사 대상이 된 블록의 좌표
collapsed = 0
while collapsed == 0

    cmpXY = abs(eX * dy) - abs(eY * dx)
    cmpYZ = abs(eY * dz) - abs(eZ * dz)
    cmpZX = abs(eZ * dx) - abs(eX * dz)

    if dx != 0 & cmpXY < 0 & cmpZX > 0:
        t = abs(eX / dx)
        eX, bX += stepX
    if dy != 0 & cmpYZ < 0 & cmpXY > 0:
        t = abs(eY / dy)
        eY, bY += stepY
    if dz != 0 & cmpZX < 0 & cmpYZ > 0:
        t = abs(eZ / dz)
        eZ, bZ += stepZ
    visited.append((bx, by, bz))

    if (bx, by, bz) 좌표에 공기가 아닌 블록이 존재한다:
        collapsed = 1
        c = (dx * t, dy * t, dz * t) # 충돌 좌표

endwhile
```