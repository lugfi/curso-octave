---
title: "Curso de GNU/Octave para FIUBA"
keywords: sample homepage
tags: [getting_started]
sidebar: curso_sidebar
permalink: index.html
summary: Un breve curso sobre GNU/Octave para brindarle al estudiante Fiubense las herramientas para poder manejarse y no tener que hacer simulaciones arrastrando filas en Excel.
---

## Acerca de GNU/Octave
Octave es un software y un lenguaje de programación para computación científica
(muy similar a MATLAB, ya que pretende ser bastante compatible con él). Originalmente desarrollado
para resolver problemas de diseño de reactores químicos allá por 1988. Más tarde fue extendido
para propósitos generales.

Más información en [Wikipedia](https://es.wikipedia.org/wiki/GNU_Octave).

## Acerca del Cálculo Numérico
Al trabajar con Octave, estamos orientados a resolver problemas de la vida real. Por lo cual
las soluciones obtenidas no son exactas analíticamente sino más bien aproximaciones.

Por ejemplo, los números reales se representan por punto flotante. Es decir, toda la recta real
se representa mediante $$2^64$$ puntos, espaciados exponencialmente. Por lo cual, todos los números
en realidad los números almacenados y los esperados pueden diferir levemente
(por decir algo, para números más o menos normales uno esperaría tener unos 10 dígitos de presición... ponele).

Existen otros software que permiten realizar calculo simbólico, en los cuales $$pi$$ vale exactamente $$pi$$,
pero los problemas de la vida real suelen ser tan complicados que obtener una solución cerrada suele ser
innecesario y muy costoso, por lo cual uno los usa, pero para otras cosas.

## Sobre el Álgebra Matricial
Octave hace uso extensivo las matrices (y vectores) a la hora de realizar cálculos.
Las computadoras están optimizadas para trabajar con operaciones matriciales, por lo cual, si uno logra
poner un problema de una forma "vectorizada" puede resolverlo generalmente en un tiempo mucho menor.


{% include links.html %}
