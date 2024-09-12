
# &Iacute;ndice

1.  [Bounce juego - Haxe con Flixel](#org7201055)
    1.  [Creación del proyecto](#orgf4e87c1)
        1.  [Flixel, OpenFL, Lime](#org2f52771)
    2.  [Testeo y construcción](#orga74c7a0)
    3.  [Desarrollo](#org1913d64)
    4.  [Objetivo](#orge132a5f)
    5.  [Player](#orgf1bebd1)



<a id="org7201055"></a>

# Bounce juego - Haxe con Flixel

![img](./img/haxeflixel.png "HaxeFlixel Icon")
Para este proyecto se usará como lenguaje de programación
el lenguaje de alto nivel &laquo;Haxe&raquo; con la librería &laquo;Flixel&raquo;

El juego es una recreación o inspiración del juego &laquo;Bounce Tales&raquo;


<a id="orgf4e87c1"></a>

## Creación del proyecto

El proyecto está desarrollado en &laquo;Flixel&raquo; la cual es una librería para
el lenguaje &laquo;Haxe&raquo;, de esta forma se puede compilar para html5 (Web), Neko (para escritorio).

Primero se instala el lenguaje &laquo;Haxe&raquo; en el siguiente enlace llevará a la página oficial
de descarga [Haxe Download](https://haxe.org/download/).


<a id="org2f52771"></a>

### Flixel, OpenFL, Lime

Las librerías que se usarán son Flixel, OpenFL, Lime
Las cuales se instalan de la siguiente forma:

    #Instala la librería de Flixel
    haxelib install flixel
    
    #Instala la librería de Lime
    haxelib install lime
    
    #Instala la librería de OpenFL
    haxelib install openfl

Con las librerías instaladas podemos construir el proyecto.


<a id="orga74c7a0"></a>

## Testeo y construcción

Para testar el juego es necesario clonar el repositorio de GitHub o bajar el ZIP,
en una consola o terminal ejecutar:

    #Para HTML5, este se ejecuta en el navegador.
    haxelib run lime test html5
    
    #Para el escritorio, se ejecuta de forma nativa.
    haxelib run lime test neko


<a id="org1913d64"></a>

## Desarrollo

A continuación, en este apartado se explicará el desarrollo del proyecto.


<a id="orge132a5f"></a>

## Objetivo


<a id="orgf1bebd1"></a>

## Player

