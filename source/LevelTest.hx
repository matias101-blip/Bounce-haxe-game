import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.util.FlxCollision;

class LevelTest extends FlxState
{
	var LevelBorde:FlxGroup;
	var player:Player;
	var platformsGrp:FlxTypedGroup<FlxSprite>;
	function createLevel()
	{
		final map = new TiledMap("assets/data/Testeo1.tmx");
		final platformsLayer:TiledObjectLayer = cast(map.getLayer("Plataforma"));
		platformsGrp = new FlxTypedGroup<FlxSprite>();
		for (platform in platformsLayer.objects)
		{
			final platformSprt = new FlxSprite(platform.x, platform.y);
			platformSprt.loadGraphic("assets/images/Free/Terrain/Tierra.png", false, 48, 48);
			platformSprt.immovable = true;
			platformsGrp.add(platformSprt);
		}
		add(platformsGrp);
		player = new Player(20, 20);
		add(player);
		LevelBorde = FlxCollision.createCameraWall(FlxG.camera, true, 1);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, LevelBorde);
		FlxG.collide(player, platformsGrp);
	}
}