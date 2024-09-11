package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

class Player extends FlxSprite
{
    static inline var SPEED:Float = 100;
	static inline var GRAVITY:Int = 800;

    public function new(x:Float = 0, y:Float = 0) {
		super(x, y);
		loadGraphic(AssetPaths.player__png, true, 80, 80);
        drag.x = drag.y = 800;
		setFacingFlip(LEFT, true, false);
		setFacingFlip(RIGHT, false, false);
		setSize(80, 80);
		animation.add("descanso", [0]);
		animation.add("caminando", [0, 1, 2], 4);
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
			var newAngle:Float = 0; // Usa el ángulo actual para la dirección de movimiento
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
		switch (facing)
		{
			case LEFT, RIGHT:
				animation.play("caminando");
			default:
				animation.play("descanso");
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
		super.update(elapsed);
		updateMovement();
	}
}
