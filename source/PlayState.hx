package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxCollision;

class PlayState extends LevelTest
{
	var LevelBorde:FlxGroup;
	var player:Player;
	override public function create()
	{
		super.create();
		// Cargar el jugador
		createLevel();
		player = new Player(20, 20);
		add(player);
		LevelBorde = FlxCollision.createCameraWall(FlxG.camera, true, 1);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, LevelBorde);
	}
}
