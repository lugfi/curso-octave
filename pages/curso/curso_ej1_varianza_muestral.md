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


**Ej 1** Usando un bucle ``for``, calcule la media de los elementos del vector
``x = [3.1390   1.6583   3.5786   3.1487   3.2660   2.5129   3.1204   3.9089 1.5870   1.4363   2.6457   4.2904]';``

**Ej 2** Implemente la función ``mi_media(x)``, que devuelva la media muestral
del vector ``x``. *Ayuda: puede contar la cantidad de elementos con* ``length(x)``
*o* ``numel(x)``.

### Vectorización
Si $$x \in \RR[n \times 1]$$, puede calcular la media haciendo el producto
interno con un vector de unos $$\mathbf{1} \in \RR[n \times 1]$$, es decir,
$$\mathbf{1} = \mtx{1 & 1 & \cdots & 1}$$, de la forma:

$$ \bar{X} = \frac{1}{N} \trans{X} \mathbf{1} $$

**Ej 3** Implemente la función ``mi_media_vectorizada(x)`` que calcule
la media del vector ``x``, pero en lugar de usando un for, utilizando el
procedimiento anterior. Verifique que funcionan igual.

**Ej 4** Compare el tiempo de ejecución de ambas implementaciones,
mediante el siguiente código:

```
clear all
clc

rand(42); # Para obtener los mismos numeros aleatorios siempre

xtest = randn(100000,1);

disp("Implementacion con for")
tic; mi_media(xtest); toc

disp("Implementacion vectorizada")
tic; mi_media_vectorizada(xtest); toc
```

## Cálculo de la varianza muestral
De forma similar a la anterior, dada una secuencia de valores
$$X_i$$, con $$1 \ge i \ge N$$, se define la varianza muestral
(que denotamos $$\text{S}(X)$$) como:

$$ \text{S}(X) = \frac{1}{N-1} \sum_{i=1}^{N} \left(X_i-\bar{X}\right)^2 $$

(Note que se requiere haber calculado previamente la media muestral.)

**Ej 1** Usando un bucle ``for``, calcule la varianza de los elementos del vector
``x`` dado en el ejercicio anterior. Utilice la función ``mi_media(x)``
para obtener la media muestral **fuera del bucle for** (esto es, llame a la función
y almacene el valor de la media en una variable).

**Ej 2** Implemente la función ``mi_varianza(x)``, que devuelva la varianza muestral
del vector ``x``. *Ayuda: puede contar la cantidad de elementos con* ``length(x)``
*o* ``numel(x)``. Utilice la función ``mi_media(x)`` para obtener la media muestral.

### Vectorización
Si $$x \in \RR[n \times 1]$$, puede calcular la varianza haciendo el producto
interno de $$(X-\bar{X})$$ consigo misma.

$$ \text{S}(X) = \frac{1}{N-1} \trans{\left(X-\bar{X}\right)} \left(X-\bar{X}\right) $$


**Ej 3** Implemente la función ``mi_varianza_vectorizada(x)`` que calcule
la varianza muestral del vector ``x``, pero en lugar de usando un for, utilizando el
procedimiento anterior. Verifique que funcionan igual. **Nota: Haga una sola
vez la operación $$X-\bar{X}$$ y almacene el resultado en una variable.**
Utilice la función ``mi_media_vectorizada(x)`` para hallar $$\bar{X}$$.

**Ej 4** Compare el tiempo de ejecución de ambas implementaciones,
de la forma que lo realizó anteriormente para la media muestral.


## Haciendo las cosas en serio
Para sumar todos los elementos del vector ``x`` existe la función ``sum(x)``.

**Ej 1** Compare el tiempo de ejecución del comando ``sum(x)/length(x)`` con el de
la función ``mi_media_vectorizada(xtest)`` para un vector ``xtest`` con muchos elementos
(como el definido anteriormente). Compare finalmente con el comando ``mean(xtest)``.

{% include links.html %}