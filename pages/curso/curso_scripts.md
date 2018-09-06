---
title: Scripts
keywords: script
last_updated: September 6, 2018
tags: [getting_started]
summary: "Uso de scripts"
sidebar: curso_sidebar
permalink: curso_scripts.html
folder: curso
---

## Introducción
Si bien uno puede escribir todo en la consola, no es buena idea andar copiando y pegando cosas ahí.

Octave permite guardar el código en un archivo de texto y ejecutarlo muchas veces.

## Uso de scripts
Antes que nada, es necesario ir a la carpeta donde tenemos nuestro proyecto. Para eso, usar la
barra de dirección en la parte supierior del programa, o el comando ``cd`` en la consola.

Un script se puede crear o editar fácilmente con el comando ``edit`` en consola.
Ejecutemos el comando ``edit prueba1.m``. Debería salir una confirmación, contestar
que Sí, queremos crear un archivo nuevo.

Esto crea un archivo nuevo llamado ``prueba1.m`` en nuestra carpeta de trabajo, o
en caso de existir, lo abre.

En el panel del editor, podemos ver que el archivo viene lleno de un montón de codigo y weas,
no importa, vamos a proceder a borrar todo el contenido del archivo.

A continuación, prodecemos a escribir lo siguiente:

```
clear all
close all
clc

disp("El resultado es:")
sqrt(14329)
```

Y guardamos el archivo, tocando ``Ctrl+S`` o el ícono correspondiente.

Para ejecutar nuestro código, basta con posicionar el cursor en el editor y
apretar el la tecla ``F5`` del teclado. O bien, presionar el botón de play
en la barra de herramientas.

Una forma alternativa, es escribiendo el nombre del script en la consola,
en este caso, escribir ``prueba1`` y presionar enter.

Sea cual fuese la forma, en la consola aparecerá el resultado.

**Es una buena práctica** comenzar los scripts con los comandos
``clear all`` y ``close all``, de forma tal que se borren todas las
variables viejas y se cierren los gráficos abiertos. El comando
``clc`` elimina lo que haya en la consola.




{% include links.html %}