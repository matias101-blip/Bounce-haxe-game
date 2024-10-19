package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.editors.tiled.TiledImageLayer;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxGroup;
import flixel.sound.FlxSound;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import modules.LoadObjects.LoadObjects;
import modules.LoadObjects.LoadObjectsTouch;

class LevelTest2 extends PlayState
{
    var player:Player;
    var BlockTilesStr:FlxTilemap;
	var C_ObjetosLoad:FlxTypedGroup<FlxSprite>;
	// Para las coliciones  definir aqui, con su tipo
	

	override public function create()
	{
		super.create();
		LevelTest.meta = false;
		// Instanciamos la camera de la clase pricipal
		// aqui va mi variable de camera
		player = new Player(0, 455);
		PlayState.cameraPlayer.follow(player, PLATFORMER);
		player.camera = PlayState.cameraPlayer;
		FlxG.cameras.add(PlayState.cameraPlayer);
		FlxG.cameras.add(PlayState.CameraHud);
        //Se caraga el arch del mapa (TODO) tmx
        final tilemap:TiledMap = new TiledMap("assets/data/Nivel1_1.tmx");
        //obtengo el fondo 
        var Image:TiledImageLayer = cast(tilemap.getLayer("Fondo"));
		var bg:FlxSprite = new FlxSprite(Image.x, Image.y);
        bg.loadGraphic(StringTools.replace(Image.imagePath,"..","assets"));

        //Carga de objetos 
		PlayState.cameraPlayer.setScrollBoundsRect(0, 0, tilemap.fullWidth, tilemap.fullHeight);
		final LayersE = ["Edificios1", "Edificios2", "Arboles", "Objetos"]; // Arreglo con las capas que se cargaran, tener orden
		var objetosLoad = LoadObjects("assets/data/Nivel1_1.tmx", LayersE); // Funcion que carga objetos en segundo plano
		final CollisionObj = ["Colision"];
		C_ObjetosLoad = LoadObjectsTouch("assets/data/Nivel1_1.tmx", CollisionObj);// Funcion que carga objetos, en colision.

        BlockTilesStr = new FlxTilemap();
        BlockTilesStr.loadMapFromCSV("assets/data/Nivel1_1.csv","assets/images/tiles/park.png",32,32);
		FlxG.worldBounds.set(0, 0, tilemap.fullWidth, tilemap.fullHeight); // Limites del mundo, todo lo que esta en el limite se puede ver y mover

		// Carga de dialogo.
		var Box:FlxSprite = new FlxSprite(20, 450);
		Box.makeGraphic(130, 20, FlxColor.BLACK);
		var Text:FlxTypeText = new FlxTypeText(20, 450, 130, "Hola este es mi texto", 9);
		Text.font = "fonts/silver.ttf";
		Text.prefix = "Matias: ";
		Text.start();

		FlxG.sound.playMusic("assets/music/anime.ogg", 0.3, true);
		FlxG.sound.music.fadeIn(3);
		for (obj in [bg, objetosLoad, C_ObjetosLoad, BlockTilesStr, Text, Box])
		{
			obj.cameras = [PlayState.cameraPlayer];
		}
		// Cargar el jugador
		add(bg);
		add(objetosLoad);
		add(C_ObjetosLoad);
		add(BlockTilesStr);
		add(Box);
		add(Text);
		add(player);
		add(PlayState.virtualPad);
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
			FlxG.switchState(new LevelTest());
		}
		FlxG.collide(player, C_ObjetosLoad);
		super.update(elapsed);
	}


}
