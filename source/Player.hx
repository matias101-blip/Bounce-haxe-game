package;

import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite
{
	static inline var SPEED:Float = 150;
	static inline var GRAVITY:Int = 800;
	var run = new FlxSprite();
    public function new(x:Float = 0, y:Float = 0) {
		super(x, y);
		run = loadGraphic("assets/images/gato-run.png", true, 81, 72);
        drag.x = drag.y = 800;
		setFacingFlip(LEFT, true, false);
		setFacingFlip(RIGHT, false, false);
		run.animation.add("Caminar", [0, 1, 2, 3, 4, 5, 6], 8);
		acceleration.y = GRAVITY;
	}

	function updateMovement()
	{
		var left:Bool = FlxG.keys.anyPressed([LEFT, A]);
		var right:Bool = FlxG.keys.anyPressed([RIGHT, D]);
		if (left && right)
		{
			left = right = false;
		}
		// Mantén la velocidad de movimiento en la dirección actual
		if (left || right)
		{
			if (left)
			{
				velocity.x = -SPEED;
				facing = LEFT;
			}
			else if (right)
			{
				velocity.x = SPEED;
				facing = RIGHT;
			}
		}
		else
		{
			run.animation.stop();
		}
		switch (facing)
		{
			case LEFT, RIGHT:
				run.animation.play("Caminar");
			default:
		}
	}

	function Jump()
	{
		var jump:Bool = FlxG.keys.anyPressed([SPACE, W]);
		if (jump && isTouching(DOWN))
		{
			velocity.y = -GRAVITY / 1.5;
		}
	}

	override function update(elapsed:Float)
	{
		Jump();
		updateMovement();
		super.update(elapsed);
	}
}
