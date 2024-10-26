import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.editors.tiled.TiledImageLayer;
import flixel.addons.editors.tiled.TiledMap;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import modules.LoadObjects.LoadObjects;
import objects.Cama;

class LevelTest extends PlayState
{
	var LevelBorde:FlxGroup;
	var player:Player;
	var BlockTilesStr:FlxTilemap;
	var cama:Cama;
	var timer:FlxTimer = new FlxTimer();
	var ObstaclesGroup:FlxTypedGroup<FlxSprite> = new FlxTypedGroup();
	var tilemap:TiledMap;
	public static var meta:Bool;

	override public function create()
	{
		meta = false;
		super.create();
		cama = new Cama(655, 286);
		player = new Player(0, 455);
		PlayState.cameraPlayer.follow(player, PLATFORMER);
		player.camera = PlayState.cameraPlayer;
		FlxG.cameras.add(PlayState.cameraPlayer);
		FlxG.cameras.add(PlayState.CameraHud);

		tilemap = new TiledMap("assets/data/TesteoPark.tmx");
		// Se cargo el fondo del escenario :)
		var Image:TiledImageLayer = cast(tilemap.getLayer("Fondo"));
		var Bg:FlxSprite = new FlxSprite(Image.x, Image.y);
		Bg.loadGraphic(StringTools.replace(Image.imagePath, "..", "assets"));

		PlayState.cameraPlayer.setScrollBoundsRect(0, 0, tilemap.fullWidth, tilemap.fullHeight);
		// Se cargaran los edificios1
		final LayersE = ["Edificios1", "Edificios2", "Arboles", "Objetos", "Escaleras"];
		var objetosLoad = LoadObjects("assets/data/TesteoPark.tmx", LayersE);
		// Se carga el mapa de tilesmap
		BlockTilesStr = new FlxTilemap();
		BlockTilesStr.loadMapFromCSV("assets/data/TesteoPark.csv", "assets/images/tiles/park.png", 32, 32);
		FlxG.worldBounds.set(0, 0, tilemap.fullWidth, tilemap.fullHeight);
		for (obj in [Bg, objetosLoad, BlockTilesStr])
		{
			obj.cameras = [PlayState.cameraPlayer];
		}
		
		add(Bg);
		add(objetosLoad);
		add(BlockTilesStr);
		add(cama);
		add(player);
		MakeBarLife();
		#if android
		addPad();
		#end
	}

	override public function update(elapsed:Float)
	{
		if (FlxCollision.pixelPerfectCheck(player, cama) && !meta)
		{
			Player.Sleep = true;
			meta = true;
			Player.B_normal = true;
			Player.run = true;
			trace("a mimir");
			player.animation.pause();
			Complete();
			FlxG.sound.music.fadeOut(5);
		}
		else if (meta && !Player.Sleep)
		{
			if (!FlxCollision.pixelPerfectCheck(player, cama))
			{
				meta = false;
				Player.B_normal = false;
			}
		}
		if (player.x < -25)
		{
			FlxG.switchState(new LevelTest2());
		}
		if (player.x > tilemap.fullWidth)
		{
			Player.life = 0;
		}
		FlxG.collide(player, BlockTilesStr);
		super.update(elapsed);
	}
	private function Complete()
	{
		PlayState.cameraPlayer.fade(FlxColor.BLACK, 5, false, onFocus);
		timer.start(5, function(timer:FlxTimer):Void
		{
			FlxG.switchState(new Menu());
			player.kill();
			#if desktop
			FlxG.mouse.visible = true;
			#end
		}, 1);
	}
}