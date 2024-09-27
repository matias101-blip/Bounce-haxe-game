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

class LevelTest2 extends FlxState
{
    var player:Player;
    var BlockTilesStr:FlxTilemap;

	override public function create()
	{
        //Se carga el jugadosr
        player= new Player(0,0);
        //Se caraga el arch del mapa (TODO) tmx
        final tilemap:TiledMap = new TiledMap("assets/data/Nivel1.1.tmx");
        //obtengo el fondo 
        var Image:TiledImageLayer = cast(tilemap.getLayer("Fondo"));
        var bg:FlxSprite = new FlxSprite(Image.x,Image.y);
        bg.loadGraphic(StringTools.replace(Image.imagePath,"..","assets"));

        //Carga de objetos 
        var objetos:TiledObjectLayer = cast(tilemap.getLayer("Arboles"));
        var grupoObjetos:FlxTypedGroup<FlxSprite> = new FlxTypedGroup<FlxSprite>();
        for (items in objetos.objects){
            var itemSprite:FlxSprite = new FlxSprite();
            itemSprite.loadGraphic("assets/images/bg/5.png");
            itemSprite.setPosition(items.x,items.y);
            itemSprite.setSize(items.width,items.height);
            grupoObjetos.add(itemSprite);

        }

        BlockTilesStr = new FlxTilemap();
        BlockTilesStr.loadMapFromCSV("assets/data/Nivel1.1.csv","assets/images/tiles/park.png",32,32);


		super.create();
		// Cargar el jugador
		
        add(bg);
        add(grupoObjetos);
        add(BlockTilesStr);
        add(player);
        
	}

    override public function update(elapsed:Float)
        {
            FlxG.collide(player, BlockTilesStr);
            super.update(elapsed);
        }

}
