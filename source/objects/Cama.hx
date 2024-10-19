package objects;

import flixel.FlxSprite;

class Cama extends FlxSprite
{
	override public function new(x, y)
	{
		super(x, y);
		loadGraphic("assets/images/cama.png", false, 32, 32);
		scale.set(0.65, 0.65);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}