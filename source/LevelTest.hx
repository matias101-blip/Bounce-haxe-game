import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.tiled.TiledImageLayer;
import flixel.addons.editors.tiled.TiledMap;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import modules.LoadObjects.LoadObjects;

class LevelTest extends FlxState
{
	var LevelBorde:FlxGroup;
	var player:Player;
	var BlockTilesStr:FlxTilemap;
	function createLevel()
	{
		FlxG.mouse.visible = false;

		player = new Player(20, 450);

		final tilemap:TiledMap = new TiledMap("assets/data/TesteoPark.tmx");
		// Se cargo el fondo del escenario :)
		var Image:TiledImageLayer = cast(tilemap.getLayer("Fondo"));
		var Bg:FlxSprite = new FlxSprite(Image.x, Image.y);
		Bg.loadGraphic(StringTools.replace(Image.imagePath, "..", "assets"));

		// Se cargaran los edificios1
		final LayersE = ["Edificios1", "Edificios2", "Arboles", "Objetos", "Escaleras"];
		var objetosLoad = LoadObjects("assets/data/TesteoPark.tmx", LayersE);
		// Se carga el mapa de tilesmap
		BlockTilesStr = new FlxTilemap();
		BlockTilesStr.loadMapFromCSV("assets/data/TesteoPark.csv", "assets/images/tiles/park.png", 32, 32);
		add(Bg);
		add(objetosLoad);
		add(BlockTilesStr);
		add(player);
	}

	override public function update(elapsed:Float)
	{
		FlxG.collide(player, BlockTilesStr);
		FlxG.camera.follow(player);
		super.update(elapsed);
	}
}