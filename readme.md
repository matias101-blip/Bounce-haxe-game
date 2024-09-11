
# &Iacute;ndice

1.  [Bounce juego - Haxe con Flixel](#orgb832980)
    1.  [Creación del proyecto](#org1de7699)
        1.  [Flixel, OpenFL, Lime](#org04a3a89)
    2.  [Testeo y construcción](#org65e3b36)
    3.  [Desarrollo](#orgcb8a49d)
    4.  [Objetivo](#orgf8bbd55)
    5.  [Player](#org536ce5e)



<a id="orgb832980"></a>

# Bounce juego - Haxe con Flixel

Para este proyecto se usará como lenguaje de programación
el lenguaje de alto nivel &laquo;Haxe&raquo; con la librería &laquo;Flixel&raquo;

El juego es una recreación o inspiración del juego &laquo;Bounce Tales&raquo;


<a id="org1de7699"></a>

## Creación del proyecto

El proyecto está desarrollado en &laquo;Flixel&raquo; la cual es una librería para
el lenguaje &laquo;Haxe&raquo;, de esta forma se puede compilar para html5 (Web), Neko (para escritorio).

Primero se instala el lenguaje &laquo;Haxe&raquo; en el siguiente enlace llevará a la página oficial
de descarga [Haxe Download](https://haxe.org/download/).


<a id="org04a3a89"></a>

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


<a id="org65e3b36"></a>

## Testeo y construcción

Para testar el juego es necesario clonar el repositorio de GitHub o bajar el ZIP,
en una consola o terminal ejecutar:

    #Para HTML5, este se ejecuta en el navegador.
    haxelib run lime test html5
    
    #Para el escritorio, se ejecuta de forma nativa.
    haxelib run lime test neko


<a id="orgcb8a49d"></a>

## Desarrollo

A continuación, en este apartado se explicará el desarrollo del proyecto.


<a id="orgf8bbd55"></a>

## Objetivo


<a id="org536ce5e"></a>

## Player

