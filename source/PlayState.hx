package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxVirtualPad;

class PlayState extends FlxState
{
	public static var virtualPad:FlxVirtualPad;
	public static var ActuallLevel:Int = 0;
	public static var cameraPlayer:FlxCamera;
	public static var CameraHud:FlxCamera;
	override public function create()
	{
		super.create();
		// Se carga el mando virtual
		virtualPad = new FlxVirtualPad(FULL, A_B);
		// Se configura la camara para el hud
		CameraHud = new FlxCamera(0, 0);
		CameraHud.bgColor = 0x00ED0606;
		virtualPad.camera = CameraHud;
		// Se configura la camera del jugador
		cameraPlayer = new FlxCamera(0, 0);
		cameraPlayer.zoom = 2;

		#if desktop
		FlxG.mouse.visible = false;
		#end

		// Cargar el jugador
		trace(ActuallLevel);

	}


}
