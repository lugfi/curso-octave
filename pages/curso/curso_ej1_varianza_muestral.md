---
title: "Ejercicio: Cálculo de la Varianza Muestral"
keywords: ejercicios, varianza, for
last_updated: September 6, 2018
tags: [getting_started]
summary: "Bucles: Cálculo de la media y varianza muestral"
sidebar: curso_sidebar
permalink: curso_ej1_varianza_muestral.html
folder: curso
---

## Introducción
Al trabajar con una serie de valores aleatorios, una forma de caracterizarlos
es a travez de su media, que sería como el promedio de los valores posibles
y de su varianza, que indica cuán dispersos están los valores al rededor
de la media.

Octave posee las funciones ``mean()`` y ``var()`` para estimar estos parámetros,
pero por fines didácticos vamos a hacer nuestra propia implementación.

## Cálculo de la media
Dada una secuencia de valores $$X_i$$, con $$1 \ge i \ge N$$, se define
la media muestral (que denotamos $$\bar{X}$$) como:

$$ \bar{X} = \frac{1}{N} \sum_{i=1}^{N} X_i $$

Si bien la sumatoria es matemáticamente bonita, en Octave tendemos a escribir
todo de forma vectorial cuando sea posible. Por ejemplo:


Si $$x \in \RR[1 \times n]$$, puede calcular la media haciendo el producto
interno con un vector de unos $$\mathbf{1} \in \RR[n \times 1]$$, es decir,
$$\mathbf{1} = \mtx{1 \\ 1 \\ \vdots \\ 1}$$, de la forma:

$$ \bar{X} = \frac{1}{N}\trans{\mathbf{1}} X  $$


Por ejemplo, vamos a calcular la media del siguiente conjunto de datos:

```
x = [3.1390; 1.6583; 3.5786; 3.1487; 3.2660; 2.5129; 3.1204; 3.9089; 1.5870; 1.4363; 2.6457; 4.2904];
```

Para sumar todos los elementos de ese vector, vamos a multiplicarlo por un vector
lleno de unos de la dimensión correcta. Para ello nos valemos del comando ``ones()``:

```
unos = ones(1,12);
suma = unos*x
```

Vemos que al crear un vector de unos de dimensión $$1\times 12$$ y multiplicarlo
por nuestro vector ``x`` de dimensión $$12 \times 1$$, el resltado de la operación
matricial es la suma de todos los elementos de ``x``.

¿Como se que mi vector tiene 12 elementos? porque los conté. En lugar de hacer
la cuenta a mano, puedo pedirle a Octave que me de el largo del vector:

```
N = length(x)
```

Y una vez que tengo el largo, puedo obtener el promedio realizando la división.
Quedaría:

```
N = length(x);
unos = ones(1, N);
suma = unos*x;

promedio = suma / N;
```


**Ej 1** Utilizando el comando ``rand(1000,1)`` cree un vector con 1000 numeros
aleatorios entre 0 y 1, y calcule su media utilizando el código anterior.

## Vectores fila o columna
En este caso, el vector ``x`` es un vector columna. Pero ¿qué pasa si usamos un vector
fila? Por ejemplo: ``xfila = [1.3, -0.43, 1.11];``

Vemos que el programa falla porque al hacer el producto matricial las dimensiones
no coinciden, ya que lo hicimos pensando en un vector columna.

Es posible convertir cualquier matriz o vector (sea fila o columna) en un vector
columna utilizando la siguiente notacion:

```
xcolumna = xfila(:)
```

Esto permite que nuestro código se independice del tipo de vectores que usemos
(lo cual es bueno).

## Cálculo de la varianza muestral
De forma similar a la anterior, dada una secuencia de valores
$$X_i$$, con $$1 \ge i \ge N$$, se define la varianza muestral
(que denotamos $$\text{S}(X)$$) como:

$$ \text{S}(X) = \frac{1}{N-1} \sum_{i=1}^{N} \left(X_i-\bar{X}\right)^2 $$

(Note que se requiere haber calculado previamente la media muestral.)

Lo cual se puede escribir en forma vectoriaza como:
Sea $$x \in \RR[1 \times n]$$, se puede calcular la varianza haciendo el producto
interno de $$(X-\bar{X})$$ consigo mismo.

$$ \text{S}(X) = \frac{1}{N-1} \trans{\left(X-\bar{X}\right)} \left(X-\bar{X}\right) $$

**Ej 2** Calcule la varianza muestral del vector ``x`` anteriormente utilizado.


## Haciendo las cosas en serio
Para sumar todos los elementos del vector ``x`` existe la función ``sum(x)``. Multiplicar
por un vector de unos no está mal, pero es más confuso.

Si bien acá calculamos la media y la varianza, Octave tiene funciones para todas estas
cosas comunes, que nos evitan errores, tiempo y esfuerzo.

{% include links.html %}