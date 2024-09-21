package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(1024, 736, Menu)); // El test esta en 1024 x 736
	}
}
