---
title: Sistemas Lineales
keywords: ecuacion, lineal, sistema
last_updated: September 4, 2018
tags: [getting_started]
summary: "Resolución de sistemas lineales"
sidebar: curso_sidebar
permalink: curso_sistemas_lineales.html
folder: curso
---

## Introducción Teórica
La forma por excelencia de representar un sistema lineal, es utilizando la 
notación matricial, llevándolo a la forma $$Ax = b$$, donde
$$x \in \CC[n \times 1]$$ es el vector de incógnitas a despejar,
$$A \in \CC[m \times n]$$ es la matriz de coeficientes del
sistema y $$b \in \CC[m \times 1]$$ es un término independiente.

Si la matriz $$A$$ es inversible, el sistema presenta una única solución
dada por $$x = A^{-1} b$$. Esto pasa si solo si $$\det(A) \neq 0$$.

En caso que la matriz $$A$$ sea no inversible, el sistema puede presentar
una, ninguna, o infinitas soluciones.

### Compatibilidad de un sistema
Un sistema es compatible si solo si $$\rg(A) = \rg([A|b]$$, donde $$[A|b]$$
es una matriz por bloques formada por $$A$$ y $$b$$ como columnas.

### Soluciones de un sistema compatible
Dado el sistema $$A x = b$$ se llama sistema homogéneo asociado al sistema dado
por $$A x_h = 0$$. Este último siempre es compatible (por lo dicho anteriormente)
y es sencillo de resolver.
Todos los vectores que cumplen $$A x_h = 0$$ forman el subespacio nulo de $$A$$
o $$Nul(A)$$. En dicho espacio se pueden hallar un conjunto de $$k=n-\rg(A)$$
vectores linealmente independientes, llamemoslos $$\{v_1, \cdots, v_k \}$$.

Se cumple que **todos** los vectores $$x_h$$ que cumplen $$A x_h = 0$$ son
de la forma: $$x_h = \alpha_1 v_1 + \cdots + \alpha_k v_k$$ con
$$\alpha_1,\cdots,\alpha_k \in \CC$$.

Conocida una solución particular del sistema no homogéneo, es decir, un
vector $$x_p$$ tal que $$A x_p = b$$, **todas** las soluciones del sistema
pueden obtenerse de la forma $$x = x_p + \alpha_1 v_1 + \cdots + \alpha_k v_k$$,
es decir, $$x = x_p + \nul(A)$$.

## Resolución de Sistemas con Octave
Para el caso de sistemas compatibles con solución única, la inversa
de una matriz puede calcularse utlizando el comando ``inv(A)``. Previamente
podemos calcular su determinante con ``det(A)``.

Podemos observar si un sistema es compatible armando la matriz extentida.
Para ello, podemos armar una matriz en bloques de la misma forma que 
armamos matrices:

```
M = [A, b]
```

Y basta comparar los rangos dados por ``rank(M)`` y ``rank(A)``.


### Solución particular
Para hallar una solución particular en el caso no homogéneo es necesario
triangular. Para ello, podemos utilizar el comando ``\`` de la siguiente
forma:

```
xp = A\b
```

Dicho comando también funciona cuando la matriz $$A$$ es inversible, y
por lo general, es mucho más numéricamente estable que hallar ``inv(A)``
y calcular ``inv(A)*b``.

### Nulo
El nulo de una matriz se obtiene con el comando ``null(A)``. Este devuelve
una base del espacio nulo de $$A$$, que era lo que faltaba para obtener
la solución completa.

## Ejercicios
**Ej 1)** Analizar si el sistema $$Ax=b$$ es compatible. Si es así, halle
su solución.

```
A = [
    13.0   -3.2  11.9  -14.1 
   -12.1    4.0  -6.2   -4.8 
     6.9   12.2   6.4  -11.4 
     0.5  -20.5  12.7  -12.1 ];

b = [ 41.3
      -7.7
      67.7
     -23.5 ];
	 
```

**Ej 2a)** Halle todas las soluciones de la ecuacion $$B x = 0$$

```
B = [
   -2.6    -5.7    2.6    -8.3    18.9
   -4.1    15.9    5.1    20.5   -19.7
    8.2     0      7.8    -8.4    -0.1
   19.95  -29.55  10.55  -55.85   48.25
];
```

**Ej 2b)** Analice si el sistema $$ B x = c $$ es compatible. De ser así,
halle una solución.

```
c = [-21.69    32.35   -26.52  -123.255] ;
```

**Ej 2c)** Combinando los ejericios **2a** y **2b**

{% include links.html %}
