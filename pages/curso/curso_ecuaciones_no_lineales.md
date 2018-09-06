---
title: Ecuaciones No Lineales
keywords: ecuacion, no-lineal, sistema
last_updated: September 6, 2018
tags: [getting_started]
summary: "Resolución de ecuaciones y sistemas de ecuaciones no lineales"
sidebar: curso_sidebar
permalink: curso_ecuaciones_no_lineales.html
folder: curso
---

## Introducción Teórica
A diferencia de las ecuaciones lineales, las ecuaciones no lineales son mucho más
impredecibles, pudiendo tener 1, 4, 5 o cualquier cantidad de soluciones, y no poseemos ningún
método general para resolverlas.
Es por esto, que las ecuaciones no lineales se suelen resolver por aproximación, buscando
raíces cercanas a un valor, pero nunca estaremos seguros de la cantidad real de soluciones (salvo
casos particulares).


## Resolviendo una ecuación no lineal
Empecemos por una ecuación sencilla: $$e^{-x^2}=0.4$$. 

Antes que nada, vamos a llevarla a la forma homogénea $$F(x) = 0$$.
Es decir, vamos a igualar la ecuación a 0 haciendo:
$$e^{-x^2}-0.4=0$$. Luego para resolver la ecuación original es equivalente que hallar las raíces de la
función $$F(x)=e^{-x^2}-0.4$$


En octave podemos definir una función de forma simple mediante la siguiente sintaxis:

```
F = @(x) exp(-x.^2)-0.4
```

Podemos ver que ahora tenemos una función llamada ``F``, que podemos utilizar como cualquier
otra. Por ejemplo, podemos calcular ​``F(0)``​, ``​F(3)``​, ``​F(-2.4)``​, etc.

Para resolver la ecuación vamos a utilizar el comando ​``fsolve()​``, de la forma:
``fsolve(F, 3)``

Es decir, pasamos la función ``F`` y damos un punto "cercano" a la raíz que buscamos. Si ponemos
un punto distinto podemos descubrir distintas raíces (o no). Octave devuelve un valor aproximado
para la raíz, en este caso ``​0.95723``​. Podemos corroborar que al introducir este valor en la
ecuación original el resultado es prácticamente ​``0.4​``.

## Sistemas de ecuaciones no lineales
En el caso de sistemas de ecuaciones, el procedimiento es similar, solo que vamos a
considerar un vector de soluciones $$x$$. Y la función $$F(x)$$ va a ser un campo vectorial (una función
que toma vectores y devuelve vectores).

Por ejemplo, consideremos el sistema:

$$\left\{ \begin{align*}
  x_1^2 + x_1 x_2 + x_2^2 &= 9\\
  x_1+x_2 &= 1
\end{align*} \right.$$

Vamos a definir la función ``F`` como:
```
F = @(x) [(x(1).^2 + x(2).*x(1) + x(2).^2 -9), (x(1) + x(2) -1)]
```

Y resolvemos el sistema haciendo: ``fsolve(F, [1,3])``

Donde ``​[1,3]``​ es el punto de arranque, es decir ``x_1=1``, ``x_2=2``.

**Tarea:**​ Se puede interpretar el problema como la intersección entre una recta y una elipse, por lo
tanto, tendría que haber otra solución. Encontrarla eligiendo otro punto de arranque.




{% include links.html %}
