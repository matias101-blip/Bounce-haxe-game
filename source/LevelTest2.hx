package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.tiled.TiledImageLayer;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxGroup;
import flixel.sound.FlxSound;
import flixel.tile.FlxTilemap;
import flixel.util.FlxCollision;
import lime.tools.Platform;
import modules.LoadObjects.LoadObjects;
import modules.LoadObjects.LoadObjectsTouch;

class LevelTest2 extends FlxState
{
    var player:Player;
    var BlockTilesStr:FlxTilemap;
	var C_ObjetosLoad:FlxTypedGroup<FlxSprite>;
    // Para las coliciones  definir aqui, con su tipo
	var music:FlxSound = new FlxSound();

	override public function create()
	{
        //Se carga el jugadosr
		player = new Player(0, 455);
        //Se caraga el arch del mapa (TODO) tmx
        final tilemap:TiledMap = new TiledMap("assets/data/Nivel1_1.tmx");
        //obtengo el fondo 
        var Image:TiledImageLayer = cast(tilemap.getLayer("Fondo"));
        var bg:FlxSprite = new FlxSprite(Image.x,Image.y);
		bg.setPosition();
        bg.loadGraphic(StringTools.replace(Image.imagePath,"..","assets"));

        //Carga de objetos 
        
		final LayersE = ["Edificios1", "Edificios2", "Arboles", "Objetos"]; // Arreglo con las capas que se cargaran, tener orden
		var objetosLoad = LoadObjects("assets/data/Nivel1_1.tmx", LayersE); // Funcion que carga objetos en segundo plano
		final CollisionObj = ["Colision"];
		C_ObjetosLoad = LoadObjectsTouch("assets/data/Nivel1_1.tmx", CollisionObj);// Funcion que carga objetos, en colision.

        BlockTilesStr = new FlxTilemap();
        BlockTilesStr.loadMapFromCSV("assets/data/Nivel1_1.csv","assets/images/tiles/park.png",32,32);
		FlxG.worldBounds.set(0, 0, tilemap.fullWidth, tilemap.fullHeight); // Limites del mundo, todo lo que esta en el limite se puede ver y mover

		// Carga de dialogo.
		var Text:FlxTypeText = new FlxTypeText(20, 450, 130, "Hola este es mi texto");
		Text.prefix = "Matias: ";
		Text.start();

		FlxG.sound.playMusic("assets/music/anime.ogg", 0.3, true);
		super.create();
		// Cargar el jugador
        add(bg);
        add(objetosLoad);
		add(C_ObjetosLoad);
        add(BlockTilesStr);
		add(Text);
        add(player);

        FlxG.camera.setScrollBoundsRect(0, 0, tilemap.fullWidth, tilemap.fullHeight);
		FlxG.camera.follow(player, PLATFORMER);
		FlxG.camera.zoom = 2;
        
	}

    override public function update(elapsed:Float)
        {
            FlxG.collide(player, BlockTilesStr);
		for (obj in C_ObjetosLoad.members)
		{
			if (FlxG.pixelPerfectOverlap(player, obj))
			{
				trace("Me tocar0n");
			}
		}

		if (player.x > FlxG.worldBounds.width || player.y > FlxG.worldBounds.height)
		{
			FlxG.switchState(new PlayState());
		}
		FlxG.collide(player, C_ObjetosLoad);
		super.update(elapsed);
	}

}
