import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.util.FlxCollision;

class LevelTest extends FlxState
{
	var LevelBorde:FlxGroup;
	var player:Player;
	var tiledMap:FlxTilemap;
	var bg_bgg = new FlxSprite();
	function createLevel()
	{
		tiledMap = new FlxTilemap();
		tiledMap.loadMapFromCSV("assets/data/TesteoPark.csv", "assets/images/tiles/Park.png", 32, 32);
		player = new Player();
		add(tiledMap);
		add(player);
		LevelBorde = FlxCollision.createCameraWall(FlxG.camera, true, 1);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, LevelBorde);
		FlxG.collide(player, tiledMap);
	}
}