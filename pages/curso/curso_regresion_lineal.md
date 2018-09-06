---
title: "Aplicación: Regresión Lineal"
keywords: ecuacion, regresion, lineal, sistema
last_updated: September 5, 2018
tags: [getting_started]
summary: "Conceptos sobre la regresión lineal"
sidebar: curso_sidebar
permalink: curso_regresion_lineal.html
folder: curso
---

## Introducción Teórica
En Álgebra II se ve que la solución por Cuadrados Mínimos del problema
$$Ax=b$$ es $$\trans{A} A \hat{x} = \trans{A} b$$. Donde si la matriz A
es de rango completo, se despeja: $$\hat{x} = \inv{\trans{A} A} \trans{A} b$$.

Analicemos el siguiente problema: La producción de vinos en una estancia (en barriles) fue
la siguiente:

|t|x|
|--|--|
|2013|53|
|2014|57|
|2015|52|
|2016|60|

Utilizando el modelo: $$x(t) = mt + b$$ estimar la producción en 2018.

Al armar la matriz $$A$$, y hacer $$\trans{​A}A$$ se obtiene:

```
>> A'*A
ans =
16232846 8058
8058      4
```

Hay un pequeño problemita con esto, y es que hay valores muy grandes (algo de 16 millones) y
uno muy pequeño (de valor 4). Al suceder esto, es posible que se obtenga un error importante por errores
de redondeo.


### Cosas que se pueden tocar y cosas que no
Al tener un problema de cuadrados mínimos, hay que ser muy cuidadoso en no meter la
mano en los datos. No se pueden sumar ecuaciones, triangular, etc. porque si bien
numéricamente puede un sistema ser equivalente, a la hora de ajustar estamos resolviendo un
problema distinto.

Sin embargo, uno puede mover los ejes cómodamente sabiendo que no altera el ajuste (ya
que el vector de error no cambia) y también incluso podría escalar el eje de abscisas (variable
independiente) por la misma razón (no así el eje "y").

Por lo tanto, antes de ajustar, podemos restar la media de los valores de $$t$$ y $$x$$, o tal vez
restar 2013 a los valores de $$t$$, a fin de poder obtener números más sensatos al hacer $$\trans{​A}A$$​.

Si bien uno en la vida real hace ``A\b`` y no se preocupa por los valores de ​$$\trans{A}A$$​ es mucho
mejor si se pueden regularizar los datos restando las medias al menos. (Recordar deshacer los cambios
al final).


**Tarea:**​ Comparar los resultados de ajustar con los diversos métodos dados aquí ($$\trans{A}A$$ y ``A\b``,
cada uno con y sin regularizar).

## Ajustando exponenciales y logaritmos
*Ain't Nobody Got Time for That!*

Hay veces que podemos escapar a la no linealidad haciendo un pequeño cambio de
variables. Por ejemplo, lo que en un plot común se ve como una exponencial, en un gráfico
semilogarítmico en el eje y se ve como una recta.

Entonces en lugar de ajustar una exponencial se puede aplicar dicho cambio de variables
y ajustar la recta. Para ajustar una curva logarítmica,
basta con tomar un gráfico semilogarítmico en x para ver una recta.

Es croto, no es lo que originalmente se conoce como "cuadrados mínimos", pero funciona.
(Sobre todo, permite lidiar con errores multiplicativos, en lugar de aditivos).

**Tarea:​** Ajustar la curva de un TBJ: $$I_C \simeq I_S e^{V_{BE}/V_T}$$ aplicando logaritmo miembro a miembro.

{% include links.html %}
