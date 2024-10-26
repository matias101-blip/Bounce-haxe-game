package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.editors.tiled.TiledImageLayer;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import haxe.Timer;
import modules.LoadObjects.LoadObjects;
import modules.LoadObjects.LoadObjectsTouch;
import objects.Shuriken;

class LevelTest2 extends PlayState
{
    var player:Player;
    var BlockTilesStr:FlxTilemap;
	var C_ObjetosLoad:FlxTypedGroup<FlxSprite>;
	var obstacleGroup:FlxTypedGroup<FlxSprite>;
	var collision = false;

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

		final CollisionObj = ["Colision"];
		C_ObjetosLoad = LoadObjectsTouch("assets/data/Nivel1_1.tmx", CollisionObj); // Funcion que carga objetos, en colision.

		var obstacle:TiledObjectLayer = cast(tilemap.getLayer("Obstacle"));
		obstacleGroup = new FlxTypedGroup<FlxSprite>();
		for (object in obstacle.objects)
		{
			var shuiken = new Shuriken(object.x, object.y, C_ObjetosLoad);
			obstacleGroup.add(shuiken);
		}
		
        //Carga de objetos 
		PlayState.cameraPlayer.setScrollBoundsRect(0, 0, tilemap.fullWidth, tilemap.fullHeight);
		final LayersE = ["Edificios1", "Edificios2", "Arboles", "Objetos"]; // Arreglo con las capas que se cargaran, tener orden
		var objetosLoad = LoadObjects("assets/data/Nivel1_1.tmx", LayersE); // Funcion que carga objetos en segundo plano

        BlockTilesStr = new FlxTilemap();
        BlockTilesStr.loadMapFromCSV("assets/data/Nivel1_1.csv","assets/images/tiles/park.png",32,32);
		FlxG.worldBounds.set(0, 0, tilemap.fullWidth, tilemap.fullHeight); // Limites del mundo, todo lo que esta en el limite se puede ver y mover

		FlxG.sound.playMusic("assets/music/anime.ogg", 0.3, true);
		FlxG.sound.music.fadeIn(3);
		for (obj in [bg, objetosLoad, C_ObjetosLoad, BlockTilesStr, obstacleGroup])
		{
			obj.cameras = [PlayState.cameraPlayer];
		}

		// Cargar el jugador
		add(bg);
		add(objetosLoad);
		add(C_ObjetosLoad);
		add(obstacleGroup);
		add(BlockTilesStr);
		add(player);
		MakeBarLife();
		#if android
		addPad();
		#end
	}
    override public function update(elapsed:Float)
        {
		FlxG.collide(player, BlockTilesStr);
		if (player.x > FlxG.worldBounds.width || player.y > FlxG.worldBounds.height)
		{
			FlxG.switchState(new LevelTest());
		}

		// Verificacion de coliciones con el obstaculo
		for (obstacle in obstacleGroup)
		{
			if (FlxCollision.pixelPerfectCheck(player, obstacle) && !collision)
			{
				Player.life = Player.life - 1;
				PlayState.Bar_life_gui.members.remove(PlayState.Bar_life_gui.members[PlayState.Bar_life_gui.members.length - 1]);
				player.velocity.x = -200;
				player.velocity.y = -600 / 3.5;
				collision = true;
				Timer.delay(function()
				{
					collision = false;
				}, 3000);
			}
		}
		FlxG.collide(player, C_ObjetosLoad);
		super.update(elapsed);
	}


}