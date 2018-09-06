---
title: Bucles y Lógica
keywords: for, while, if
last_updated: September 6, 2018
tags: [getting_started]
summary: "Uso de bucles y condicionales"
sidebar: curso_sidebar
permalink: curso_bucles.html
folder: curso
---

## Introducción
Al trabajar con vectores o matrices surge una necesidad muy evidente ¿cómo
puedo recorrer todos los elementos de un vector? Bueno, para eso **no** sirven
los bucles, pero vamos a arrancar por ahi (pero está mal).

### Bucle for
El bucle ``for`` sirve para ejecutar un comando muchas veces, cambiando
el valor de un índice. Por ejemplo:

```
for i=1:5
  disp(i);
endfor
```

El codigo anterior ejecuta el comando ``disp(i)``, donde ``i`` va tomando,
uno a uno, los valores del rango ``1:5``. Así es, dentro del for, ``i`` es
un escalar, no una matriz de 1 a 5, como esperaríamos del comando ``i=1:5``.

La utilidad es evidente. Por ejemplo, sumemos todos los elementos de este vector:

```
vec = [1 4 3 -1 3 2 1];
total = 0;
for i=1:7
  total = total + vec(i);
endfor

disp(total);
```

Es decir, ``vec(i)`` va tomando en cada iteración cada uno de los valores del vector,
o sea, el codigo anterior es equivalente al siguiente:

```
vec = [1 4 3 -1 3 2 1];
total = 0;

total = total + vec(1);
total = total + vec(2);
total = total + vec(3);
total = total + vec(4);
total = total + vec(5);
total = total + vec(6);
total = total + vec(7);

disp(total);
```

Pero tiene un pequeño detalle ¿qué pasa si agrego más elementos al vector?
Tendría que cambiar el recorrido de la variable ``i``, por ejemplo:

```
vec = [1 4 3 -1 3 2 1 9 9 9];
total = 0;
for i=1:10 # ya no es más 7, ahora 10
# etc....
```

¿No se puede hacer automáticamente? Sí, utilizando el comando ``length(vec)``
que devuelve el largo de un vector:

```
vec = [1 4 3 -1 3 2 1];
total = 0;
for i=1:length(vec)
  total = total + vec(i);
endfor

disp(total);
```

### Bucle do-while
Muchas veces no sabemos exactamente cuántas iteraciones necesitamos hacer,
por lo cual, el bucle debe repetirse hasta que ``pase algo``. Para ello
podemos utilizar el bucle ``while``, por ejemplo, para evaluar la serie:

$$ X = \sum_{k=1}^{\infty} \frac{1}{k^2} $$

```
X = 0;
k = 1;
do
  cachito = 1/k^2;
  X = X + cachito;
  k = k+1;
until(cachito < 1e-10);

disp(cachito);
```

### Bucle while
De forma similar al anterior, este bucle repite mientras que la condición
sea verdadera, por ejemplo, repetir mientras no salga un 6 en un dado:

```
tiradas = 1;
while (rand < 5/6)
  tiradas = tiradas + 1;
endwhile

disp(tiradas);
```

## Operaciones lógicas
Muchas veces la condición de corte de un bucle no es tan secilla,
por ejemplo, si queremos simular la tirada de un dado hasta que
salgan dos 6 seguidos. El codigo podría ser algo así:

```
intentos = 0;
do
  dado1 = ceil(rand(100,1)*6);
  dado2 = ceil(rand(100,1)*6);
  intentos = intentos + 1;
until (dado1==6 && dado2==6)

disp(intentos);
```

El operador ``==`` compara los dos valores, si son iguales, devuelve verdadero,
caso contrario, devuelve falso.

El operador ``&&`` es la operación ``y`` logica. La operación ``o`` es ``||``.
También está el operador ``!=`` que verfica que dos parámetros sean distintos.

### Condicional
Vamos a tirar dos dados al mismo tempo, y guardar el menor valor que se registre:

```
Ndatos = 1000;

datos = zeros(Ndatos,1);
for i=1:Ndatos
  dado1 = ceil(rand*6);
  dado2 = ceil(rand*6);
  
  if (dado1 > dado2)
    datos(i) = dado2;
  else
    datos(i) = dado1;
  endif
endfor

hist(datos,6);
```

La instrucción ``if`` verifica si lo que está detro del paréntesis es verdad.
De ser así, ejecuta lo que está adentro del ``if``. Ocasionalmente, puede venir
acompañado del comando ``else`` que indica qué hacer en caso que la condición
no se haya cumplido. El comando ``elseif`` permite incluir una segunda condición
a evaluar si la segunda no se cumple.


## Tarea

**Ej 1** Hallar el elemento más grande de un vector (o de una matriz), usando un bucle for.

**Ej 2** Dado el vector: ``ceil(rand(100,1)*6)``, encontrar la posición del primer par de ``6`` consecutivos.
Una vez que encuentra la condición, puede salir del bucle usando el comando ``break`` si lo requiere.

Hay más tarea de bucles [acá](http://localhost:4000/curso_ej1_varianza_muestral.html).


{% include links.html %}