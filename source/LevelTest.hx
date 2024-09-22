import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.tiled.TiledImageLayer;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;

class LevelTest extends FlxState
{
	var LevelBorde:FlxGroup;
	var player:Player;
	var BlockTilesStr:FlxTilemap;
	function createLevel()
	{
		player = new Player(20, 450);

		final tilemap:TiledMap = new TiledMap("assets/data/TesteoPark.tmx");
		var GroupLayersO = new FlxTypedGroup<FlxSprite>();

		// Se cargo el fondo del escenario :)
		var Image:TiledImageLayer = cast(tilemap.getLayer("Fondo"));
		var Bg:FlxSprite = new FlxSprite(Image.x, Image.y);
		Bg.loadGraphic(StringTools.replace(Image.imagePath, "..", "assets"));
		GroupLayersO.add(Bg);

		// Se cargaran los edificios1
		final LayersE = ["Edificios1", "Edificios2", "Arboles", "Objetos"];
		for (layer in LayersE)
		{
			var LayerObject:TiledObjectLayer = cast(tilemap.getLayer(layer));
			for (object in LayerObject.objects)
			{
				var asset:String = "";
				var o_str:FlxSprite = new FlxSprite(object.x, object.y);
				switch (object.gid)
				{
					case 1:
						asset = "assets/images/bg/2.png";
					case 2:
						asset = "assets/images/bg/3.png";
					case 4:
						asset = "assets/images/bg/5.png";
				}
				o_str.loadGraphic(asset, false, object.width, object.height);
				o_str.offset.set(0, object.y - 188);
				GroupLayersO.add(o_str);
			}
		}
		// Se carga el mapa de tilesmap
		BlockTilesStr = new FlxTilemap();
		BlockTilesStr.loadMapFromCSV("assets/data/TesteoPark.csv", "assets/images/tiles/park.png", 32, 32);

		add(GroupLayersO);
		add(BlockTilesStr);
		add(player);
	}

	override public function update(elapsed:Float)
	{
		FlxG.collide(player, BlockTilesStr);
		super.update(elapsed);
	}
}