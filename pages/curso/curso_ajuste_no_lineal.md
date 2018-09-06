---
title: Ajuste No Lineal
keywords: cuadrados, minimos, ls, ajuste
last_updated: September 6, 2018
tags: [getting_started]
summary: "Teoría sobre Cuadrados Mínimos, y ajuste"
sidebar: curso_sidebar
permalink: curso_ajuste_no_lineal.html
folder: curso
---

## Ajuste No Lineal
Todo lindo con lo anterior, pero ¿qué pasa si no quiero ajustar
algo tan "lineal"? (Notar que la linealidad subyace en el comportamiento
aditivo del ruido y no en el modelo utilizado).

Por ejemplo, si quiero obtener la fase de una senoidal, debo ajustar
una ecuación de la forma:

$$ x(t)= A \cos(\omega t+ \theta) $$

Al plantear el sistema de ecuaciones para distintos valores $$t_i$$ vemos
que el sistema no resulta lineal, y no puedo escribirlo de la forma
$$Ax=b$$ para hacer ``xsol=A\b``. Sin embargo, aprendimos a lidiar
con sistemas no lineales anteriormente utilizando ``fsolve()``,
pero antes de continuar primero necesitamos tener bien en claro
qué estamos haciendo al ajustar.

## Cuadrados Mínimos
Si cuadrados mínimos fuese sinónimo de "ecuaciones normales" 
¿por qué se llama cuadrados mínimos?

La idea de fondo es esta: Tengo un conjunto de datos, y tengo y modelo que
tiene parámetros. Quiero hallar la combinación de parámetros que haga que
mi modelo se ajuste "lo mejor posible" a mis datos.

|   t      |    x    |
|----------|---------|
|  0.00000 | 2.72690 |
|  0.02000 |-2.33725 |
|  0.04000 |-0.63825 |
|  0.06000 | 2.90761 |
|  0.08000 |-1.96009 |
|  0.10000 |-1.15601 |


El modelo que vamos a ajustar a esos datos es: $$ f(t; A,\omega,\theta)= A cos(\omega t+\theta)$$, a fin
de poder hallar la amplitud, frecuencia y fase de la senoidal.

Notemos que en el modelo, la variable independiente es $$t$$. Por claridad
se ponen los parámetros a determinar separados por un punto y coma,
para no confundirlos con la variable independiente.

Tenemos el modelo, ahora queremos ajustarlo a los datos. Lo que sigue es definir
qué significa que "ajuste bien" a los datos. La definición que se suele
tomar la mayoría de las veces es:

$$ J(A, \omega, \theta) = \sum_{i=1}^{n} \left( x_i - f(t_i; A, \omega, \theta) \right)^2 $$

A la función $$J$$ se la conoce como "función de costos" o "función de error",
y depende solamente de los parámetros del ajuste, y no del valor de $$t$$.
Es decir, dado un juego de parámetros $$(A,\omega,\theta)$$ el error cometido
al ajustar con ellos es la sumatoria del cuadrado de las distancias entre cada
punto y la curva correspondiente. Y queremos hallar el valor de los parámetros
que hace que ese "error" sea mínimo (de aquí el nombre: cuadrados mínimos).

Tranquilamente podríamos considerar medir el error de ajuste de otra forma;
dependiendo de la definición que demos llegaremos a distintas soluciones
(y cada una será "la mejor solución" en cada caso). Como función de error
podríamos mandar cualquier cosa que sea una función convexa en los parámetros
de ajuste, por ejemplo:

$$ J_1(A, \omega, \theta) = \sum_{i=1}^{n} \left| x_i - f(t_i; A, \omega, \theta) \right| $$

O [cosas más falopa](https://stats.stackexchange.com/questions/154879/a-list-of-cost-functions-used-in-neural-networks-alongside-applications).

Vamos a quedarnos con la definición inicial, que es la que en el caso
que tengamos una ecuación lineal e incertezas gaussianas iid, nos
conduce a las ecuaciones normales de Álgebra II.

Entonces, simplemente lo que queremos es minimizar el valor de J.
El punto (A,\omega,\theta)donde se alcance dicho mínimo serán los parámetros
de ajuste que estamos buscando. Idealmente, podríamos usar ``fsolve()``
para hallar el valor donde $$J(A,\omega,\theta)=0$$, pero ya sabemos que los
puntos no caen sobre la curva exactamente, por lo cual es de esperar que no
exista ningún juego de parámetros para el cual el error sea nulo.

En cambio, vamos a usar ``fminsearch()`` para hallar el mínimo en lugar de una raiz;
su sintaxis es idéntica a ``fsolve()``.


### Ejercicio
En resumen, vamos a hacer lo siguiente:
  - Definir el modelo: ``F = @(t, p) p(1)*cos(p(2).*t + p(3));``
  *Notar que todos los parámetros están agrupados en el vector p, siendo* $$A=p(1)$$, $$\omega=p(2)$$ y $$\theta=p(3)$$.
  - Definir la función de costo:  ``J = @(p) norm( x_data -  F(t_data, p) );``
  Nuevamente, ``J`` solo es función de los parámetros (vector ``p``).
  - Minimizar la función costo para obtener los parámetros:
    ``p_ajuste = fminsearch(J, [Ao, wo, to]); ``
    Donde en ``[Ao, wo, to]`` deben ir valores próximos a los que esperamos obtener, al menos del mismo orden.


Puede encontrar el script terminado aqui: [ajuste_nolineal.m](https://raw.githubusercontent.com/lugfi/curso-octave/master/ejemplos/ajuste/ajuste_nolineal.m)	
	
## Regularización
Tarea: Aumentar la frecuencia a ``w=113e3`` en el archivo [ajuste_nolineal.m](https://raw.githubusercontent.com/lugfi/curso-octave/master/ejemplos/ajuste/ajuste_nolineal.m)
y correr el script varias veces (comentando la línea de la semilla del rand).

Podemos ver que al aumentar muchos órdenes de magnitud la frecuencia el ajuste
deja de "ajustar muy bien". En realidad, la teoría funciona,
pero a ``fminsearch()`` se le empieza a complicar encontrar el juego de
parámetros óptimo. Esto es porque "mover un cachito la frecuencia" es
muchos órdenes de magnitud superior a "mover un cachito la amplitud".

Para ayudar a un buen funcionamiento de ``fminsearch()`` es necesario
que todos los parámetros tengan más o menos el mismo orden de magnitud.

La amplitud es de algo como 3, la fase tiene que estar entre 0 y 2pi=6
(aunque no pusimos ninguna restricción al respecto) y la frecuencia
debería ser algo de más o menos el mismo orden de magnitud.

Vamos a tomar como parámetro de ajuste entonces: ``p(2) = w/1e5``.
Por lo tanto, el modelo con parámetros regularizados quedaría:

```
F = @(t, p) p(1)*cos(p(2)*1e5 .*t + p(3));
``` 

Donde no hay que olvidar modificar el valor de arranque, dividiendo
la frecuencia por el factor ``1e5``:

```
p_hat = fminsearch(J, [3 1 0]); 
```

Ahora vemos que los tres parámetros de ajuste están más o menos
en el mismo orden de magnitud.

Tarea: Correr el script varias veces con estos cambios y ver que converge mucho mejor.

	
{% include links.html %}
