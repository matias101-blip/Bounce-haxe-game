package ;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;

//Aquí va lo que se renderiza (botones, etc)
class Niveles extends FlxState{
    override public function create() {
        var fondo_niveles:FlxSprite=new FlxSprite();
        var cuadro_niveles:FlxSprite=new FlxSprite();
        var button1: FlxButton = new FlxButton(213,195,"Nivel 1", nivel1);
        fondo_niveles.loadGraphic("assets/images/gui/Fondo_niveles1.png", false, 0,0);
        cuadro_niveles.loadGraphic("assets/images/gui/Marco_principal.png", false, 0,0);
        fondo_niveles.screenCenter();
        cuadro_niveles.screenCenter();
        cuadro_niveles.scale.set(6,5);

      
        
        add(fondo_niveles);
        add(cuadro_niveles);
        add(button1);
        
        super.create();//Todo lo que se valla a crear va ariiba de el constructor
        
       
        
    };
    function nivel1(){
        FlxG.switchState(new PlayState());
    };
    //Funcion de actualizar el juego en fotogramas 
    override public function update(elapsed: Float){
        super.update(elapsed) ;

    };

}

