
# &Iacute;ndice

1.  [Bounce juego - Haxe con Flixel](#org03bc986)
    1.  [Creación del proyecto](#org18076ef)
        1.  [Flixel, OpenFL, Lime](#orgb0c1866)
    2.  [Testeo y construcción](#org77b9618)
    3.  [Desarrollo](#orgcf49052)
    4.  [Objetivo](#orge43efde)
    5.  [Player](#org48711d6)



<a id="org03bc986"></a>

# Bounce juego - Haxe con Flixel

![img](./img/haxeflixel.png "HaxeFlixel Icon")
Para este proyecto se usará como lenguaje de programación
el lenguaje de alto nivel &laquo;Haxe&raquo; con la librería &laquo;Flixel&raquo;

El juego es una recreación o inspiración del juego &laquo;Bounce Tales&raquo;


<a id="org18076ef"></a>

## Creación del proyecto

El proyecto está desarrollado en &laquo;Flixel&raquo; la cual es una librería para
el lenguaje &laquo;Haxe&raquo;, de esta forma se puede compilar para html5 (Web), Neko (para escritorio).

Primero se instala el lenguaje &laquo;Haxe&raquo; en el siguiente enlace llevará a la página oficial
de descarga [Haxe Download](https://haxe.org/download/).


<a id="orgb0c1866"></a>

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


<a id="org77b9618"></a>

## Testeo y construcción

Para testar el juego es necesario clonar el repositorio de GitHub o bajar el ZIP,
en una consola o terminal ejecutar:

    #Para HTML5, este se ejecuta en el navegador.
    haxelib run lime test html5
    
    #Para el escritorio, se ejecuta de forma nativa.
    haxelib run lime test neko


<a id="orgcf49052"></a>

## Desarrollo

A continuación, en este apartado se explicará el desarrollo del proyecto.


<a id="orge43efde"></a>

## Objetivo


<a id="org48711d6"></a>

## Player

