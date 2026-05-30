<h1 align="center"> RayCast </h1>

## 개요
ㄹㅇ 이보다 완벽한 레이캐스트는 있을 수가 없다 진짜

## 알고리즘
기존 Bresenham의 한계를 극복한 3D Supercover DDA 알고리즘을 차용했다.\
다만, Amanatides & Woo 방식은 그 과정에서 다수의 float 연산(그것도 나눗셈)을 행하기 때문에 매우 부담이 되는 방식이다. float 연산은 대신 정수 연산을 최대한 활용하는 쪽으로 알고리즘을 재구성했다.
