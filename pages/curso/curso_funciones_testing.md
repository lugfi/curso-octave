---
title: Documentación de Funciones
keywords: funcion, doc
last_updated: September 6, 2018
tags: [getting_started]
summary: "Importancia de la Documentación, y cómo documentar"
sidebar: curso_sidebar
permalink: curso_funciones_testing.html
folder: curso
---

## Introducción
¿Viste cuando armas una función, la probas y anda lindo. Después armas otra
cosa en otro lado, y nada funciona como debería, y luego de días de sufrimiento
y agonía, te das cuenta que el problema estaba en la función que armaste al
principio, que no funciona como debería? Bueno, sí, esas cosas pasan.

Otro ejemplo clásico es: una pesona arma una función que anda piola.
Para el tiempo, y le quiere agregar una pequeña funcionalidad o cambiar
algo que no afectaría su funcionamiento, pero de repente, entran a 
fallar otros códigos que la usaban. Y sí, cuando le metiste mano
hiciste cagada y cambiaste algo que no te diste cuenta, y ahora
tu función falla en casos que antes no lo hacía, pero que no lo testeaste
porque no te diste cuenta.

Por todas estas cosas, y porque la gente no quiere escribir como mono,
es que se inventaron los *test unitarios*.

## Haciendo un test unitarios
Tenemos esta función, parecida a la [de antes](/curso_funciones.html#funciones-con-varias-salidas):

```
function [S, AS] = descomp_simetrica (A)
  S  = (A' + A)/2;
  AS = (A' - A)/2;
endfunction
```

La idea es que en el código de la función esten casos de prueba, para
verificar que está haciendo lo que debería hacer. Para eso se utiliza el 
commando ``assert(a,b)``, que verifica que ``a`` y ``b`` sean iguales.
Si no lo son, devuelve un error.

Para distinguir los tests del código en serio, se deben poner al final,
con un ``%`` y un ``!`` de la forma: %!assert (a, b)

Por ejemplo:

```
function [S, AS] = descomp_simetrica (A)
  S  = (A' + A)/2;
  AS = (A' - A)/2;
endfunction

%!assert (descomp_simetrica([0 1; 0 0]), [0 0.5; 0.5 0])
```

Y podemos correr el test ejecutando el comando ``test descomp_simetrica``.

### Test verdadero o falso
Uno de los tests más comunes es llamar a ``assert`` con un solo argumento.
Si el argumento es falso (o sea, ``0``) devuelve error. Por ejemplo,
podemos verificar que el resultado de nuestra descomposición sea una matriz
simétrica. Para eso, utilizaremos la función ``issymmetric``:

```
%!assert (descomp_simetrica( issymmetric([1 2 3; 0 -1 2; 9 -2 1]) ))
```

### Tests complejos
A veces es necesario testear más de un parámetro, o bien, armar los datos
para el test. Por ejemplo, a continuación vamos a testear que la descomposición
funcione:

```
%!test
%! A = [1 2 3; 0 -1 2; 9 -2 1];
%! [S, AS] = descomp_simetrica(A);
%! assert(norm(S+AS-A, "inf") < 1e-10);
```

La norma infinito es simplemente el valor más grande (en módulo) de la matriz.
No es buena idea esperar que el error sea cero, ya que trabajamos con numeros
aproximados. Un error de ``1e-10`` es suficientemente bueno en este caso
para verificar que nuestra función ande o para detectar que falla.

{% include warning.html content="De hecho, la función <a href='haciendo-un-test-unitarios'>utilizada aquí</a> debe fallar este test. Notar que está invertido el orden de los transpuestos respecto a <a href='/curso_funciones.html#funciones-con-varias-salidas'>esta otra que anda bien</a>." %}

### Función completa

Aqui está como debería quedar la función con los tests:

```
function [S, AS] = descomp_simetrica (A)
  S  = (A' + A)/2; 
  AS = (A' - A)/2; # está mal a propósito
endfunction

%!assert (descomp_simetrica([0 1; 0 0]), [0 0.5; 0.5 0])
%!assert (descomp_simetrica( issymmetric([1 2 3; 0 -1 2; 9 -2 1]) ))
%!test # este test debería fallar
%! A = [1 2 3; 0 -1 2; 9 -2 1];
%! [S, AS] = descomp_simetrica(A);
%! assert(norm(S+AS-A, "inf") < 1e-10);
```

Puede encontrar más información en la [wiki de Octave](https://wiki.octave.org/Tests).


## Validando Parámetros
Esto no debería ir acá con los tests, pero bueno, ya fue. Las funciones
generalmente deberían verificar que se cumplen las hipótesis sobre
las que trabajan. Por ejemplo, ``descomp_simetrica()`` debería verificar
que la matriz es cuadrada, y ``es_defida_positiva()`` de
[esta tarea](http://localhost:4000/curso_ej1_definida_positiva.html)
debería verificar que la matriz es hermítica (ser simétrica es un caso
particular de ser hermítica).

En lugar de poner ``if`` por todas partes, se puede utlizar la función
``validateattributes()``. A esta hay que pasarle la variable a validar,
seguido por el tipo de datos que esperamos que tenga (generalmente ``{"float"}``)
y a continuación, una lista de las condiciones que debe cumplir, de la forma
propiedad 1, valor 1, propiedad 2, valor 2.

Dependiendo de la propiedad usada, puede llevar valores (como ``ncols``) o no (como ``real``).

Ejemplo:

```
# A debe ser una matriz de 3 columnas, con numeros reales
validateattributes(A, {"float"}, {"ncols",3,"real"});

# B debe tener 1 columna, y tantos elementos como filas tenga A
validateattributes(b, {"float"}, {"cols", 1, "numel",rows(A),"real"});
```

Para más información hacer ``help validateattributes``.

### Validaciones personalizadas
En caso de que ``validateattributes`` no tenga la validación que buscamos,
podemos utilizar ``assert()`` pero sin el ``%!`` de antes. Por ejemplo:

```
function ret = es_defida_positiva(A)
  # Validación: A debe ser simétrica
  assert(issymmetric(A), "La matriz A debe ser simétrica");

  #.... resto del codigo ....
endfunction
```


{% include links.html %}