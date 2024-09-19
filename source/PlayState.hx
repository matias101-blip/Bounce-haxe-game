package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxCollision;

class PlayState extends LevelTest
{

	override public function create()
	{
		super.create();
		// Cargar el jugador
		createLevel();

	}


}
