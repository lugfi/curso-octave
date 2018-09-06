---
title: Variables
keywords: variables
last_updated: September 5, 2018
tags: [getting_started]
summary: "Declaración y uso de variables. Comandos realcionados"
sidebar: curso_sidebar
permalink: curso_variables.html
folder: curso
---

## Operaciones Básicas
Se puede utilizar Octave como una calculadora, simplemente escribiendo
cuentas en la Consola y presionando enter se calcula el resultado.

Examine qué hacen las siguientes operaciones:

```
5+2
3*5+1.1
3*(5+1.1)
sqrt(16)
2i^2
```

Note que el separador decimal es ``.``, y ``sqrt`` es abreviatura de "SQuare RooT".

### Complejos
La unidad imagiaria se denota con ``i`` o ``j``. Sin embargo, siempre es mejor
escribir ``1i`` o ``1j`` para evitar problemas.

Pruebe las siguientes funciones, son utiles a la hora de trabajar con complejos:

``` 
real(-1+3i)
imag(-1+3i)
conj(-1+3i)

abs(-1+3i)
angle(-1+3i)
```

Tambien se pueden componer operaciones:

```
abs( 1+3i - conj(2-2.5i) )
```

### Operaciones Trigonométricas
Los ángulos por defecto se miden en radianes, no en grados. Puede utilizar
las contastes ``e`` y ``pi`` que vienen por defecto.

```
sin(pi/2)
cos(pi/2)
tan(pi/3)

exp(2)
log(10)
log(e)
log10(10)
log2(256)
```

Tambien existen funciones en grados sexagesimales y trigonométricas inversas:

```
sind(45)
cosd(135)
tand(30)

acosd(1/2)
```

Las funciones por defecto trabajan con complejos, por ejemplo:

```
acos(3.2)

exp(1i*pi)
```

En la [documentación de Octave](https://octave.org/doc/v4.2.1/Trigonometry.html) hay más información.


## Variables
En los problemas matemáticos, uno suele plantear las ecuaciones en función de
variables y no de numeros en sí, y al llegar al resultado, puede reemplazar
cada variable por su valor y obtener el resultado.

En Octave (y el resto de los lenguajes de programación) una variable es un
contenedor donde se almacena información. Las variables se identifican por
un nombre (que pueden ser letras, números o guión bajo) y poseen un cierto
valor y un tipo.

Por defecto Octave trabaja con matrices de números complejos. Los números
reales son simplemente matrices de $$\RR[1 \times 1]$$.

### Ejemplos

#### Área y Perímetro
Sea un rectángulo de lados 4 y 2.5, vamos a calcular su área y perímetro.
Primero vamos a definir ``a=4`` y ``b=2.5`` y luego procedemos a realizar
los cálculos:

```
a = 4;
b = 2.5;

perimetro = a+a+b+b
area = a*b
```

{% include note.html content="Poner ; al final de una linea evita que se
muestre el resultado (pero el cálculo se realiza igual)." %}

Para visualizar las variables se puede escribir su nombre y presionar enter:

```
a
```

O bien utilizar el comando ``disp()``:

```
disp(a);
```


Una forma equivalente de hacer lo anterior es esta, analice las diferencias con
la anterior:
```
a = 4;
b = 2.5;

perimetro = 2*(a+b);
area = a*b;

disp("El área es:");
disp(area);

disp("Y el perímetro es:");
disp(perimetro);
```

#### Pitágoras
Sea un triángulo rectángulo cuyos catetos miden 4.5 y 2. Calcule su perímetro.

Primero vamos a calcular la hipotenusa mediante el Teorema de Pitágoras, y
luego usarlo para determinar el perímetro:

```
c1 = 2;
c2 = 4.5;

# Hago pitágoras para obtener la hipotenusa
h = (c1^2 + c2^2)^0.5;
per = c1 + c2 + h;

disp("El perímetro del tiangulo es:");
disp(per);
```

Las lineas que comienza con un # o con un % son comentarios: Sirven para ayudar
al humano que está tratando de entender tu código, pero Octave las ignora por
completo.

El operador ``^`` denota la operación de potenciación. ``a^b`` es lo que
llamamos $$a^b$$.

La raiz cuadrada, si bien se puede obtener elevando un número a la 1/2, es más
conveniente obtenerla mediante la funcion ``sqrt()``. Por ejemplo, en el código
anterior se podía escribir:

```
h = sqrt(c1^2 + c2^2);
```

*La raiz cuadrada puede devolver números imaginarios*
```
sqrt(-1); % Esto devuelve i
```

## Manejo de Variables
La interfaz gráfica de Octave posee un panel llamado *Espacio de trabajo* o *Workspace*,
en el cual se listan las variables usadas y se muestra información adicional, como el
tipo, las dimensiones, etc.

Sin embargo, también se puede utilizar el comando ``whos`` en la consola, el cual
detalla la misma información.

Para eliminar una variable, basta con utilizar el comando ``clear`` seguido por un
espacio y el nombre de variable a eliminar. Por ejemplo: ``clear a`` elimina la
variable a, si existe. Para eliminar **todas** las variables, se puede utlizar
el comando ``clear all``.

### Variables ocultas (shadowed)
Octave trae algunas constastes definidas por defecto, como por ejemplo ``pi`` y ``e``
(no se si alguna más). Sin embargo, alguien puede ejecutar el comando ``pi = 3``, el
cual va a definir una variable ``pi`` que vale 3, y que va a ocultar la constante
predefinida en Octave, haciendo que todas las funciones trigonométricas anden
mal al parecer. Esto se soluciona borrando la variable con ``clear pi`` o
``clear all``. De esta forma, ``pi`` vuelve a referirse a la constante definida
en Octave.

Pasa lo mismo con funciones, por ejemplo, definir ``cos = 4`` hace que el comando
``cos(0)`` devuelva error. Haciendo ``clear cos`` se soluciona.



{% include links.html %}
