package ;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;

//Aquí va lo que se renderiza (botones, etc)
class Niveles extends FlxState{
    var timer:FlxTimer= new FlxTimer();
    override public function create() {
        var fondo_niveles:FlxSprite=new FlxSprite();
        var cuadro_niveles:FlxSprite=new FlxSprite();
        var button1: FlxButton = new FlxButton(213,195,"Nivel 1", nivel1);
        var button2: FlxButton = new FlxButton(213,275,"Atras", menu);
        fondo_niveles.loadGraphic("assets/images/gui/Fondo_niveles1.png", false, 0,0);
        cuadro_niveles.loadGraphic("assets/images/gui/Marco_principal.png", false, 0,0);
        fondo_niveles.screenCenter();
        cuadro_niveles.screenCenter();
        cuadro_niveles.scale.set(6,5);

      
        
        add(fondo_niveles);
        add(cuadro_niveles);
        add(button1);
        add(button2);
        FlxG.camera.fade(FlxColor.BLACK,3,true,onFocus);
        super.create();//Todo lo que se valla a crear va ariiba de el constructor
        
       
        
    };
    function nivel1(){
        FlxG.switchState(new LevelTest2());
    };
    //Funcion de actualizar el juego en fotogramas 
    override public function update(elapsed: Float){
        super.update(elapsed) ;

    };
    function menu(){
        FlxG.camera.fade(FlxColor.BLACK,3,false,onFocus);
        timer.start(3,function(timer:FlxTimer):Void{
            FlxG.switchState(new Menu());    
        });
        
        
    }

}

