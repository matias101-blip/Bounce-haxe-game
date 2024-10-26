package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import haxe.Timer;

class GameOver extends PlayState
{
	var player:Player;

	override public function create()
	{
		super.create();
		player = new Player(0, 0);
		player.screenCenter();
		player.Died();
		var TextGameOver:FlxText;
		var format1 = new FlxTextFormat(0xFF3B3B, false, false, 0xFFFFFF);
		TextGameOver = new FlxText(230, 178, 210, "You Died", 40);
		TextGameOver.font = "fonts/silver.ttf";
		TextGameOver.addFormat(format1, 0, 9);
		#if desktop
		Timer.delay(function()
		{
			FlxG.mouse.visible = true;
			add(BtnMenu);
			add(BtnRetry);
		}, 3300);
		#end

		add(TextGameOver);
		add(player);

		#if android
		Timer.delay(function()
		{
			add(BtnMenu);
			add(BtnRetry);
		}, 3300);
		#end
	}

	override public function update(elapsed:Float)
	{
		player.velocity.x = 0;
		player.velocity.y = 0;
		super.update(elapsed);
	}
}