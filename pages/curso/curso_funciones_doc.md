---
title: Documentación de Funciones
keywords: funcion, doc
last_updated: September 6, 2018
tags: [getting_started]
summary: "Importancia de la Documentación, y cómo documentar"
sidebar: curso_sidebar
permalink: curso_funciones_doc.html
folder: curso
---

## Introducción
En la [guia anterior](/curso_funciones.html), al utlizar el comando ``edit``
vemos que antes del código sale una sarasa terrible. Bueno, no es tan sarasa:

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

## Licencia
La primera parte de la sarasa, es la licencia. Por defecto, GNU/Octave pone
la descripción de la licencia GNU. Obviamente se puede borrar o cambiar
según conveniencia. Un análisis sobre licencias se puede encontrar en la
web del proyecto [GNU](https://www.gnu.org/licenses/license-list.html).

## Documentación
Un usuario normal espera que al escribir ``help nombre_de_tu_funcion`` le salga
una explicación de cómo utilizarla. No brindarla es romper el acuerdo
tácito entre usuarios de GNU/Octave; además de convertirte automáticamente en mala persona, asesino de pollitos
~~y [marichulo](https://www.cronica.com.ar/info-general/Cristina-le-dijo-marichulo-a-Macri-Mira-lo-que-significa-20180528-0032.html) (?)~~.

Si hacemos ``edit mean`` podemos ver su código fuente, del cual ahora
sólo nos importa la documentación. Lo muestro entero y después
lo desglosamos:

```
## -*- texinfo -*-
## @deftypefn  {} {} mean (@var{x})
## @deftypefnx {} {} mean (@var{x}, @var{dim})
## @deftypefnx {} {} mean (@var{x}, @var{opt})
## @deftypefnx {} {} mean (@var{x}, @var{dim}, @var{opt})
## @deftypefnx {} {} mean (@dots{}, @var{outtype})
## Compute the mean of the elements of the vector @var{x}.
##
## The mean is defined as
##
## @tex
## $$ {\rm mean}(x) = \bar{x} = {1\over N} \sum_{i=1}^N x_i $$
## where $N$ is the number of elements of @var{x}.
##
## @end tex
## @ifnottex
##
## @example
## mean (@var{x}) = SUM_i @var{x}(i) / N
## @end example
##
## @noindent
## where @math{N} is the length of the @var{x} vector.
##
## @end ifnottex
## If @var{x} is a matrix, compute the mean for each column and return them
## in a row vector.
##
## If the optional argument @var{dim} is given, operate along this dimension.
##
## The optional argument @var{opt} selects the type of mean to compute.
## The following options are recognized:
##
## @table @asis
## @item @qcode{"a"}
## Compute the (ordinary) arithmetic mean.  [default]
##
## @item @qcode{"g"}
## Compute the geometric mean.
##
## @item @qcode{"h"}
## Compute the harmonic mean.
## @end table
##
## The optional argument @var{outtype} selects the data type of the
## output value.  The following options are recognized:
##
## @table @asis
## @item @qcode{"default"}
## Output will be of class double unless @var{x} is of class single,
## in which case the output will also be single.
##
## @item @qcode{"double"}
## Output will be of class double.
##
## @item @qcode{"native"}
## Output will be the same class as @var{x} unless @var{x} is of class
## logical in which case it returns of class double.
##
## @end table
##
## Both @var{dim} and @var{opt} are optional.  If both are supplied, either
## may appear first.
## @seealso{median, mode}
## @end deftypefn
```

### Definición de la función
En el primer bloque, debe comenzar con la línea ``## -*- texinfo -*-``,
y a continuación se debe listar todas las formas posibles de utilizar
la función, la primera con la macro ``@deftypefn`` y las siguientes
(si existen) con ``@deftypefnx``. 

Las variables se deben distinguir con el chirimbolito ``@var{}``.
El uso de ``deftypefn`` es:

``## @deftypefn  {Function File} {[@var{ret1}, @var{ret2}] =} nombre_fn (@var{input1}, @var{input2})``

Por ejemplo, la gente de Octave no completó los dos primeros campos. Bueno, no importa tanto.

```
-*- texinfo -*-
## @deftypefn  {} {} mean (@var{x})
## @deftypefnx {} {} mean (@var{x}, @var{dim})
## @deftypefnx {} {} mean (@var{x}, @var{opt})
## @deftypefnx {} {} mean (@var{x}, @var{dim}, @var{opt})
## @deftypefnx {} {} mean (@dots{}, @var{outtype})
## Compute the mean of the elements of the vector @var{x}.
##
```

Por último, debe ir una línea que describa brevemente la función,
seguida por una línea en blanco (bah, con ``##``).

### Descripción del uso
En esta parte, tenes que comentar todo lo que hace y como usar la función.
Podes utlizar macros para latex y cosas así, pero por lo general, la gente
escribe todo como viene o con ascii-art. Cuando nombres una variable,
recorda ponerle el chirimbolito ``@var{}``, así Octave la puede pintar
de negrito, por ejemplo.

### Parte final
En la parte final, van dos lineas mucho muy importantes:

```
## @seealso{median, mode}
## @end deftypefn
```

La linea con ``@seealso`` tiene que contener el resto de las funciones
similares que al usuario les podría venir bien saber que existen.

Por último, la documentación termina con ``## @end deftypefn``.


{% include tip.html content="Siguiendo estos lineamientos, haremos del mundo un lugar <s>mejor</s> menos fiero." %}

## Más información
Pueden consultar la [documentación oficial](https://octave.org/doc/v4.0.0/Documentation-Tips.html), que es medio confusa, pero bueno.

{% include links.html %}