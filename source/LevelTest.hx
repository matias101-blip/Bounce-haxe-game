import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.group.FlxGroup.FlxTypedGroup;

class LevelTest extends FlxState
{
	function createLevel()
	{
		final map = new TiledMap("assets/data/Testeo1.tmx");
		final platformsLayer:TiledObjectLayer = cast(map.getLayer("Plataforma"));
		final platformsGrp = new FlxTypedGroup<FlxSprite>();
		for (platform in platformsLayer.objects)
		{
			final platformSprt = new FlxSprite(platform.x, platform.y);
			platformSprt.loadGraphic("assets/images/Free/Terrain/Tierra.png", false, 48, 48);
			platformsGrp.add(platformSprt);
		}
		add(platformsGrp);
	}
}