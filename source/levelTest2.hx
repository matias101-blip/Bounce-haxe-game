package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.tiled.TiledImageLayer;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObject;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.util.FlxCollision;
import modules.LoadObjects.LoadObjects;

class LevelTest2 extends FlxState
{
    var player:Player;
    var BlockTilesStr:FlxTilemap;

	override public function create()
	{
        //Se carga el jugadosr
        player= new Player(0,0);
        //Se caraga el arch del mapa (TODO) tmx
        final tilemap:TiledMap = new TiledMap("assets/data/Nivel1_1.tmx");
        //obtengo el fondo 
        var Image:TiledImageLayer = cast(tilemap.getLayer("Fondo"));
        var bg:FlxSprite = new FlxSprite(Image.x,Image.y);
        bg.loadGraphic(StringTools.replace(Image.imagePath,"..","assets"));

        //Carga de objetos 
        
        final LayersE = ["Edificios1", "Edificios2", "Arboles", "Objetos"];
		var objetosLoad = LoadObjects("assets/data/Nivel1_1.tmx", LayersE);

        BlockTilesStr = new FlxTilemap();
        BlockTilesStr.loadMapFromCSV("assets/data/Nivel1_1.csv","assets/images/tiles/park.png",32,32);
        FlxG.worldBounds.set(0, 0, tilemap.fullWidth, tilemap.fullHeight);

		super.create();
		// Cargar el jugador
        add(bg);
        add(objetosLoad);
        add(BlockTilesStr);
        add(player);

        FlxG.camera.setScrollBoundsRect(0, 0, tilemap.fullWidth, tilemap.fullHeight);
		FlxG.camera.follow(player, PLATFORMER);
		FlxG.camera.zoom = 2;
        
	}

    override public function update(elapsed:Float)
        {
            FlxG.collide(player, BlockTilesStr);
            super.update(elapsed);
        }

}
