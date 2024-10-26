package objects;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxCollision;

class Shuriken extends FlxSprite
{
	static inline var SPEED:Float = 40;

	var Objectuch:FlxTypedGroup<FlxSprite>;
	final ImgSprite:String = "assets/images/objects/obstacle/Suriken.png";
	var vuelta:Bool = false;

	public function new(x, y, Objectuch)
	{
		super(x, y);
		this.Objectuch = Objectuch;
		loadGraphic(ImgSprite, true, 32, 32);
		animation.add("rodar", [0, 1, 2, 3, 4, 5, 6, 7], 30);
		animation.play("rodar");
	}

	function MoveUpdate()
	{
		if (vuelta)
		{
			velocity.x = -SPEED;
		}
		else
		{
			velocity.x = SPEED;
		}
	}

	override public function update(elapsed:Float)
	{
		for (hitBox in Objectuch.members)
		{
			if (this.overlaps(hitBox))
			{
				if (vuelta)
				{
					vuelta = false;
				}
				else
				{
					vuelta = true;
				}
			}
		}
		MoveUpdate();
		super.update(elapsed);
	}
}