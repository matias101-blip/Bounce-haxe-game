package;

import LevelTest2;
import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.FlxSprite;  //Se importa la clase Sprite

class Menu extends FlxState{
    override public function create(){
        var cuadro:FlxSprite=new FlxSprite();//Variable de tipo sprite y el new es un constructor de la clase sprite 
        cuadro.
        var PlayBtn:FlxButton;
		var Test:FlxButton;
		Test = new FlxButton(0, 0, "Testeo", level);
		PlayBtn = new FlxButton(0, 0, "Play!!!", click);
        PlayBtn.screenCenter();
        add(PlayBtn);
		add(Test);
        super.create();
    };

	function click()
	{
		FlxG.switchState(new LevelTest2());
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



