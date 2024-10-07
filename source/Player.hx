package;

import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite
{
	static inline var SPEED:Float = 150;
	static inline var GRAVITY:Int = 1100;

	// Se designan los sprites sheets a cargar
	final A_normal:String = "assets/images/normal-cat.png";
	final A_run:String = "assets/images/run-cat.png";

	// Estas var nos ayudaran a saber si el sprite se cargo.
	var run:Bool = false;
	var B_normal:Bool = true;

	public function new(x:Float = 0, y:Float = 0)
	{
		// Cargamos el personaje, esta funcion se ejecuta una vez
		super(x, y);
		drag.x = drag.y = 800;
		Animation("Normal", A_normal, [0, 1, 2, 3, 4, 5, 6], 6);
		animation.play("Normal");
		acceleration.y = GRAVITY;
	}

	function Animation(Name:String, RootImage:String, Frames:Array<Int>, FPS:Int)
	{
		// Esta funccion se encarga de manejar la carga de sprite y aniadir las
		loadGraphic(RootImage, true, 32, 32);
		animation.add(Name, Frames, FPS);
		setFacingFlip(LEFT, true, false);
		setFacingFlip(RIGHT, false, false);
		setSize(28, 30);
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
		var action:String = "Normal";
		if (!isTouching(DOWN)) {}
		else if (velocity.x > 0 || velocity.x < 0 && isTouching(DOWN))
		{
			if (!run)
			{
				run = true;
				B_normal = false;
				action = "Run";
				Animation("Run", A_run, [0, 1, 2, 3, 4, 5, 6], 15);
			}
		}
		else if (velocity.x == 0 && !B_normal)
		{
			run = false;
			B_normal = true;
			Animation("Normal", A_normal, [0, 1, 2, 3, 4, 5, 6], 6);
		}
		switch (action)
		{
			case "Run":
				animation.play(action);
			case _:
				animation.play(action);
		}

	}

	function Jump()
	{
		var jump:Bool = FlxG.keys.anyPressed([SPACE, W]);
		if (jump && isTouching(DOWN))
		{
			FlxG.sound.play("assets/music/sfx/jump.ogg", 1, false);
			velocity.y = -GRAVITY / 3.5; // Ajuste para el salto
		}
	}

	override function update(elapsed:Float)
	{
		Jump();
		updateMovement();
		super.update(elapsed);
	}
}
