---
title: Variables y Matrices
keywords: variables, matrices, funciones
last_updated: September 3, 2018
tags: [getting_started]
summary: "Variables, operaciones, matrices, funciones básicas"
sidebar: curso_sidebar
permalink: curso_matrices.html
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


## Matrices
Las matrices se escriben entre corchetes ``[ ]``, las filas se separan por
espacios o comas ``,`` y las columnas se separan por saltos de linea (enter)
o por punto y coma ``;``.

Por ejemplo, la matriz $$\mtx{1 & 2 \\ 3 & 4}$$ se puede escribir de las
siguientes formas equivalentes:

```
A = [1 2; 3 4]
B = [1, 2; 3, 4]
C = [1 2
     3 4] % poner espacios evita que la gente te odie :)

% Y estas deformidades también valen	 
D = [1 2
3,4]
```

### Vectores
Los vectores son simplemente matrices de $$1 \times n$$ o de $$n \times 1$$
dependiendo si usamos vectores filas o columnas, y por lo tanto es necesario
que las dimensiones concuerden para multiplicarlos por una matriz.

Por ejemplo, el producto $$\mtx{1 & 2 \\ -2 & 3}\mtx{1\\-1}$$ se resuelve como:

```
A = [1 2; -2 3];
b = [1; -1]; % Notar que es vector columna

A*b
```

### Operaciones con Matrices
Del álgebra vectorial sabemos que las matrices se pueden sumar, restar y
multiplicar (siempre que den las dimensiones).

#### Transpuesta
Una operación muy utlizada hallar la transpuesta hermítica,
o bien la transpuesta tradicional. Esto se realiza con los operadores ``'``
y ``.'`` respectivamente:

```
B = [1   3   4;
     2i  -1  0];
	 
B'  # Transpuesta y conjugada
B.' # Transpuesta
```

El operador ``'`` puede utiliarse para escribir de forma más comoda vectores
columna, ahorrándose muchos ``;``:

```
xlargo = [1 2 3 4 5 4 3 2 1 0 3 2 4].'
```

#### Potencia
La potencia de matrices es válida para matrices cuadradas, ya que se define
$$A^n = \underbrace{A A \cdots A}_{n\, \text{veces}}$$.
Por lo cual, lo siguiente es valido:

```
A = [1 2;
    -1 3];
A^3
```

Pero esto da error:

```
A = [1 2 3;
    -1 3 1];
A^3
```

Si embargo, si lo que queremos es elevar **cada componente** de la matriz,
se debe usar el operador ``.^``

```
A = [1 2 3;
    -1 3 1];
A.^3 % Esto funciona

% Resultado:
% [1 8 27;
% -1 27 1];
```

De forma similar, los operadores ``./`` y ``.*`` realizan opereaciones
elemento a elemento.

### Ejemplo: Matriz de Rotación
Nadie dijo que dentro de una matriz no pueda poner cuentas, por ejemplo:

```
theta = deg2rad(25);

M = [cos(theta),  -sin(theta)
     sin(theta),   cos(theta) ];
	 
M * [1 1].'
```

Y como sabemos, las matrices de rotación se pueden componer. Es divertido
hacerlo con rotaciones en el espacio:

```
theta1 = deg2rad(25);
Mx = [ 1     0            0
       0  cos(theta1)  -sin(theta1)
       0  sin(theta1)   cos(theta1) ];

theta2 = deg2rad(15);
Mz = [ cos(theta1)   -sin(theta1) 0
       sin(theta1)   cos(theta1)  0
           0                0     1];

M1 = Mx*Mz
M2 = Mz*Mx  % Notar la no-conmutatividad
```

Y también se puede obtener la rotación inversa:

```
M3 = inv(M2)
```

Que va a coincidir con ``M2.'`` pues es ortogonal. Podemos verificar
que al hacer ``det(M2)`` el determinante es 1.

## Submatrices
Se pueden obtener pedacitos de una matriz fácilmente. Trabajemos con esta
de ejemplo:

```
A = [ 17   11   71
      41   60    3
      85   24   58
      44   96   22 ];
```

El elemento en la fila ``i``, columna ``j`` se obtiene haciendo ``A(i,j)``.
Es decir, en este caso, ``A(1,1)`` es 17, ``A(3,2)`` es 24, etc.

Por otro lado, para indicar rangos de filas o columnas, se utilizan vectores
en las componentes, por ejemplo:

```
A(1,[1 3]) # Fila 1, Columnas 1 y 3
A([2 3],[3 1]) # Filas 2 y 3, Columnas 3 y 1 en ese orden
```

Incluso podemos invertir el orden de una matriz, por ejemplo:

```
A([4 3 2 1], [1 2 3])
# Resultado
#   44   96   22
#   85   24   58
#   41   60    3
#   17   11   71
```

Y cualquier combinación que se nos ocurra.

### Rangos
Es claro que se necesita una forma más cómoda para especificar las columnas,
no voy a andar escribiendo vectores enormes... ¿no?

Por suerte no. Para ello se utilizan los rangos, que es una forma de decirle
a octave que nos de un vector consecutivo, así no escribimos tanto.

La sintaxis es: ``inicio:paso:fin``. Prueben estos ejemplos:

```
1:3     # Resultado: [1 2 3]
1:10    # Resultado: del 1 al 10
1:2:6   # Resultado: [1 3 5]
1:0.5:3 # Resultado: [1 1.5 2 2.5 3]
3:-1:1  # Resultado: [3 2 1]
```

Por lo tanto, podemos escribir el ejemplo anterior como

```
# A(4:-1:1, 1:3)
```

Para obtener **todas** las filas o columnas, no es necesario poner ``1:3``,
basta con poner ``:`` y Octave va a interpretar que queremos todas las filas
o columnas. El ejemplo anterior es mejor así:

```
# A(4:-1:1, :)
```

Por otro lado, todas las matrices empiezan por el elemento ``1``, eso es claro,
pero es interesante que el último elemento se llama ``end``. Eso permite
independizarnos de la cantidad de elementos de la matriz. Por ejemplo,
en el caso anterior quedaría:

```
# A(end:-1:1, :) # Much clear, so Octave, wow
```

Pero también podemos hacer cosas como:

```
A(1, :)         # La primer fila
A(end, :)       # La última fila
A(end-1, :)     # La ante última fila
A(end-2:end, :) # Las tres últimas filas
A(:, end-1:end) # Las dos últimas columnas
```

### Selección usando un único indice

Por si fuera poco, las matrices también se pueden leer con un único indice,
como si todas las columnas se apilasen una abajo de otra.
Por ello, ``A(1)`` es 17, ``A(3)`` es
85, ``A(4)`` es 44, ``A(5)`` es 11 y así. Haciendo ``A(:)`` puede verse cómo
la matriz se convirtió en un vector columna.


### Filtrado
Tambien se pueden hacer cosas locas como esta:

```
A(A>50)
```

Eso devuelte todos los elementos de A que cumplen la condición de ser mayores
a 50. Este comportamiento se llama "list comprehension" y está muy piola.
Se puede poner básicamente cualquier función de selección ahí adentro y anda
pero eso no lo vamos a explocar porque es medio un bardo, pero está en internet.

{% include links.html %}
