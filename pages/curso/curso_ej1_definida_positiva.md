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
y submatrices (usando notación de rangos). Generalice para $$M_k$$, con $$k\le n$$.

**Ej 2** Escriba una función ``obtener_menor(A, k)`` que obtenga el
k-ésimo menor de $$A$$, $$M_k$$.

**Ej 3** Utilice un bucle para obtener los tres menores de A, y determine
si es definida positiva o no.

**Ej 4** Escriba una funcion ``es_defida_positiva(A)`` que devuelva ``1``
si la matriz ``A`` pasada como parámetro es definida positiva
o ``0`` en otro caso.

**Ej 5** Si no lo hizo aún, agregue validaciones, documentación y
tests a las funciones anteriormente implementadas (recuerde que Sylvester
pide que las matrices sean simétricas).


{% include links.html %}