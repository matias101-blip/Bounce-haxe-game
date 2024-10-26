package objects;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class HitBox extends FlxSprite
{
	public function new(x:Int = 0, y:Int = 0, width:Int, heigth:Int)
	{
		super(x, y);
		makeGraphic(width, heigth, FlxColor.TRANSPARENT);
	}
}