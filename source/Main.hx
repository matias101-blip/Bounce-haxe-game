package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(640, 480, Menu)); // El test esta en 1024 x 736
	}
}
