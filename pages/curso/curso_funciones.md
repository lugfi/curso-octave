---
title: Funciones
keywords: funcion
last_updated: September 6, 2018
tags: [getting_started]
summary: "Definición y uso de funciones"
sidebar: curso_sidebar
permalink: curso_funciones.html
folder: curso
---

## Introducción
En octave, las funciones pueden recibir cero, uno o varios parámetros y devolver
cero, uno o varios resultados. Todos estos elementos son por defecto, matrices
(o vectores), aunque tabién pueden ser strings o cualquier otra tipo de datos que
soporte Octave.

## Definición de Funciones
Una forma fácil de comenzar a escribir una función, es usando el comando ``edit``
seguido por el nombre de la función, acompañada de la extensión ``.m``.

Por ejemplo, si queremos armar la función ``obtener_numero``, ejecutamos el comando
``edit obtener_numero.m`` en la consola. Pueden pasar dos cosas:

  - Si la función ya existe, octave mostrará el código. Si queríamos implementar
  una función nueva, deberíamos elegir un nombre distinto.
  - Si la función no existe, preguntará si queremos crear el archivo ``obtener_numero.m``
  en la carpeta de trabajo actual. A esto respondemos sí.

Al hacer esto, veremos en el editor un montón de comentarios (los cuales podríamos borrar
si queremos) seguido por la definición de la función en sí. Algo como esto:

```
## Copyright (C) 2018 ferna
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} obtener_numero (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ferna <ferna@HR14>
## Created: 2018-09-06

function retval = obtener_numero (input1, input2)

endfunction
```

De lo cual, nos importa esta parte:

```
function retval = obtener_numero (input1, input2)
# Tu código va aquí
endfunction
```


### Funcionamiento de las funciones
Las funciones empiezan con esta linea, donde se decalara los valores que devuelve,
el nombre de la función (que generalmente debe coincidir con el nombre del archivo,
pero sin el ``.m``) y finalmente los parámetros que toma.

Por ejemplo, esta función no recibe ningún parámetro, y al llamarla como ``obtener_numero()``
devuelve el valor 7.

```
function numero = obtener_numero ()
  numero = 7;
endfunction
```

Parece un ejemplo muy pavo, pero analicemos este otro:

```
function numero = obtener_numero ()
  numero = 7;
  numero = 23;
endfunction
```

Ahora, la función ``obtener_numero()`` devolverá ``23``, dado que siempre devuelve
el último valor que contienen las variables a la hora de terminar la función.

### Funciones con parametros
Dada una matriz $$A$$, puede descomponerse como la suma de una matriz simétrica
y otra antisimétrica (o hermítica y antihermítica), es decir: $$A = S + AS$$, con:

$$\begin{align*}
  S  &= \frac{1}{2}\left( \herm{A}+A \right)\\
  AS &= \frac{1}{2}\left( \herm{A}-A \right)
\end{align*}$$

Vamos a implementar una función a la que le pasemos una matriz ``A`` y devuelva
la componente simétrica de la descomposición, ``S``:

Para ello hacemos: ``edit descomp_simetrica.m`` y colocamos el siguiente código:

```
function S = descomp_simetrica (A)
  S = (A' + A)/2;
endfunction
```

Y podemos verificar que funciona: ``descomp_simetrica([1 2 3; 0 2 3; 3 0 1])``

### Funciones con varias salidas
Sería cómodo que la función ``descomp_simetrica(A)`` pueda devolver ambas partes
de la descomposición: ``S`` y ``AS``. Eso se puede hacer facilmente, listando
entre ``[]`` los valores que la función devuelve, de esta forma:

```
function [S, AS] = descomp_simetrica (A)
  S  = (A + A')/2;
  AS = (A - A')/2;
endfunction
```

Pero si la llamamos, devuelve una sola matriz, igual que antes: ``descomp_simetrica([1 2 3; 0 2 3; 3 0 1])``
¿Qué paso? Es que para obtener el segundo parámetro, es necesario pedirlo formalmente:

```
A = [1 2 3; 0 2 3; 3 0 1];

[sim, antisim] = descomp_simetrica([1 2 3; 0 2 3; 3 0 1]);

disp(sim)
disp(antisim)

disp(sim+antisim);
```
 
Y vemos que funciona bien. Una forma de verificarlo sería observando que la matriz
``sim+antisim-A`` es nula. Puede calcular la norma infinito de la matriz con
``norm(sim+antisim-A, "inf")``.

### Funciones con varias entradas
De forma análoga, una función puede recibir más de un parámetro:

```
function hipotenusa = calcular_hipotenusa(a, b)
  hipotenusa = sqrt(a.^2 + b.^2);
endfunction
```

## Funciones anónimas
Muchas veces las funciones son pequeñas y con uso muy específico, lo cual hace
que sea engorroso tener que armar un archivo aparte para ella. Por este y
otros motivos, es posible definir una función en una sola linea:

```
calcular_hipotenusa_anonima = @(a,b) sqrt(a.^2 + b.^2);
```

Y si hacemos ``whos``, podemos ver que hay una función llamada calcular_hipotenusa_anonima
¡como si fuese una variable!. Para los que vienen de C, pueden pensar que es un puntero
a función (en Octave se llaman ``function handle``. Resulta que las funciones son
objetos válidos, como los números o matrices ¡incluso se pueden armar vectores de funciones!
(en realidad, cell structs, que son como vectores... pero divertidos... y se usan con ``{}``
en lugar de ``[]``).

Las funciones anónimas están piolas para llamarlas recursivamente, o adaptar los parámetros
de funciones molestas, o cosas así.

### Punteros a funciones
Se puede obtener un puntero (o handler) a una función ``de carne y hueso``
colocando el operador ``@`` delante de su nombre. Por ejemplo:

```
mi_funcion = @cos;

disp(mi_funcion(pi))
```

Eso permite pasar funciones como argumento a otras funciones, por ejemplo:

```
fsolve(@cos, 1)
```

``fsolve`` sirve para hallar la raíz de la función que le pasas como primer parámetro,
más cercana al valor que le pasas como segundo parámetro.

### Vectores de funciones
Para meter funciones adentro de un vector, se utilizan los ``{}``:

```
trigonometricas_radianes = {@sin, @cos, @tan}
trigonometricas_grados  = {@sind, @cosd, @tand}

# Uso las funciones guardadas:
disp("Estos dos tendrían que ser iguales");
trigonometricas_radianes{1}(pi/4)
trigonometricas_grados{1}(45)

# A ver si anda:
x = 2*pi*rand;
disp("Si da 1, las trigonometricas en radianes andan");
trigonometricas_radianes{1}(x).^2 + trigonometricas_radianes{2}(x).^2

xd = x*180/pi;
disp("Si da 1, las trigonometricas en grados andan");
trigonometricas_grados{1}(x).^2 + trigonometricas_grados{2}(x).^2
```

**¿Y esto para que me sirve?** Bueno, cuando tenes que comparar funciones
para ver si todas dan lo mismo, podes meterlas en un struct (el coso con ``{}``)
e iterar ese struct con un ``for`` (esos suelen ser los únicos ``for`` que tienen
sentido en octave... siempre y cuando ``parfor`` no ande... si no, usa ``parfor``).

{% include links.html %}