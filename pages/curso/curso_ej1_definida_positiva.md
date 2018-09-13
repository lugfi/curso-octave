---
title: "Ejercicio: Matriz definida positiva"
keywords: vector, matriz
last_updated: September 6, 2018
tags: [getting_started]
summary: "Matrices, submatrices, funciones, bucles"
sidebar: curso_sidebar
permalink: curso_ej1_definida_positiva.html
folder: curso
---

## Introducción
El objetivo de este ejercicio es aplicar los conceptos sobre matrices y submatrices,
a un caso particular, y llegar paso a paso a obtener una función de calidad.

## Enunciado
Vamos a analizar si una matriz de $$\RR[3 \times 3]$$ es definida positiva
utilizando el [Criterio de Sylvester](https://es.wikipedia.org/wiki/Criterio_de_Sylvester):
Una matriz simétrica o hermítica es definida positiva si solo sí todos sus
menores principales son mayores a cero.

Si $$A$$ es una matriz cuadrada de $$n \times n$$, el menor $$M_i$$ es el
determinante de la matriz formada por las $$i$$ primeras filas y columnas
de $$A$$.

**Ej 1** Dada la matriz $$A = \mtx{1 & 3 & -2\\ 3 & 0 & -1 \\ -2 & -1 & 5}$$
halle los menores $$M_1$$, $$M_2$$ y $$M_3$$ usando el comando ``det()``
y submatrices (usando notación de rangos).

**Ej 2** Multiplique dichos menores para verificar si $$A$$ es definida positiva.

**Ej 3** Generalice para $$M_k$$, con $$k\le n$$.

