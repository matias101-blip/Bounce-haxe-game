package;
//paguina para recortar = fotopia
import LevelTest2;
import flixel.FlxG;
import flixel.FlxSprite; // Se importa la clase Sprite
import flixel.FlxState;
import flixel.ui.FlxButton;

class Menu extends FlxState{
    override public function create(){
        //Se crean variables de tipo Flx
        //Las imánes no pueden pasar de 640(ancho) x 480(Alto)
        //Me falta poner un fondo en 
        var cuadro:FlxSprite=new FlxSprite();//Variable de tipo sprite y el new es un constructor de la clase sprite 
        var fondo:FlxSprite=new FlxSprite();
        //Aquí se configuranlos objetos
        cuadro.loadGraphic("assets/images/gui/Marco_principal.png", false, 48,32); // Aquí cargamos la imagen
        fondo.loadGraphic("assets/images/gui/Fondo1.png", false, 0,0);
       

        //fondo.screenCenter();
        cuadro.screenCenter();
        fondo.screenCenter();
        //fondo.scale.set(280,230);
        cuadro.scale.set(4,4);//Con scale le estoy diciendo la escala y con set la estoy cambiando

        //Aquí vana a ir los botones
        var boton1:FlxButton = new FlxButton(280,203, "Iniciar juego",saludar);
        var boton2:FlxButton = new FlxButton(280,231, "Niveles",niveles);
        var boton3:FlxButton = new FlxButton(280,259, "Salir");
        
        //PlayBtn.screenCenter();
        
        //trace(cuadro.getPosition());


        add(fondo);
        add(cuadro);//Se añade el cuadro al escenario, (renderizando)
        add(boton1);
        add(boton2);
        add(boton3);
        //add(PlayBtn);
        
        super.create();
    };
    
    function saludar(){
        FlxG.switchState(new LevelTest2());//Cambiar de escenario -(Llamar a los escenarios)
    };
    function niveles(){
        FlxG.switchState(new Niveles());
    };

	function level()
	{
		FlxG.switchState(new LevelTest());
		PlayState.ActuallLevel = 1;
	}
    override public function update(elapsed:Float) {
        super.update(elapsed);
    };

}



