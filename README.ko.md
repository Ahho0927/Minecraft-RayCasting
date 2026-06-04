<h1 align="center"> RayCasting </h1>
<p align="center">레이캐스팅 충돌 위치 검출을 위한 실험적 데이터팩</p>

<!-- <p align="center">
  <a href="README.enUS.md">English</a> ·
  <a href="README.ko.md">한국어</a> ·
  <a href="README.ja.md">日本語</a>
</p> -->

## 개요
<video src="assets/RayCasting_test.mp4" controls="true" width="600"></video>

플레이어가 바라보는 방향으로 레이캐스팅을 실행하며, 블록과 부딪힌 정확한 좌표와 충돌면(의 법선축)을 검출한다.

## 사용방법

툴을 손에 들어서 실행할 수 있다.
```mcfunction
function ray:get_tool
```

## 원리
기존 Bresenham의 한계를 극복한 3D Supercover DDA 알고리즘 중 하나인 정수연산기반으로 개조된 Amanatides & Woo의 방식을 사용하였다.

<details>
<summary>더보기</summary>

![](assets/compare.jpg)

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
while collapsed == 0:

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
</details>

## Thanks to
[Wonny._.0724](https://github.com/leehyowon14)