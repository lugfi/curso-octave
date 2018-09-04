---
title: Instalación
keywords: instalación, windows, linux, descarga
last_updated: September 3, 2018
tags: [getting_started]
summary: "Cómo instalar GNU/Octave en PC/Mac/Android"
sidebar: curso_sidebar
permalink: curso_instalacion.html
folder: curso
---

## Instalación
Octave es software libre, por lo cual, puede ser descargado, distribuido y modificado libremente.
Como parte del proyecto GNU, obviamente funciona para GNU/Linux, pero también corre sobre Windows, macOS y BSD.

Hay mucha información al respecto en la [página oficial](https://www.gnu.org/software/octave/#install).

### Windows
En Windows simplemente hay que [descargar el instalador](https://www.gnu.org/software/octave/#install)
 y darle siguiente a todo. Hay versiones de 32 y 64bits.
Si no estás seguro de la arquitectura de tu sistema, la versión de 32 bits andaría bien.

{% include note.html content="Hay algunos problemas de compatibilidad con Windows 10. Es recomendable activar 'Usar la consola heredada' en las propiedades del Símbolo del Sistema > Propiedades. Ver los primeros segundos <a href='https://youtu.be/1P2WDfLO8L8?t=1m57s' target='_blank'>de este video</a> para encontrar dicha opción." %}

### Linux
Por lo general, instalar Octave es tan sencillo como ``sudo apt-get install octave'' o similar. Aunque, si estás
usando una versión vieja de Ubuntu o Debian, posiblemente descargues una versión vieja de Octave. Para ello,
te recomiendo que lo bajes usando PPA:

```
sudo apt-add-repository ppa:octave/stable
sudo apt-get update
sudo apt-get install octave
```

Más infomación [aquí](https://wiki.octave.org/Octave_for_Debian_systems)

### Android
{% include note.html content="Se puede instalar sin tener <b>root</b>." %}

Dado que Android es Linux, Octave pudo ser portado fácilmente allí. Basta con descargar estas dos aplicaciones:

  - [GNURoot Octave](https://play.google.com/store/apps/details?id=com.gnuroot.octave)
  - [GNURoot Debian](https://play.google.com/store/apps/details?id=com.gnuroot.debian)


### macOS
Ni idea, vi que algunos tuvieron algún que otro inconveniente para tenerlo andando,
pero hay información por ahí en internet. Cualquier cosa, preguntar en la [lista de mails](https://savannah.gnu.org/mail/?group=octave)

  
{% include links.html %}
