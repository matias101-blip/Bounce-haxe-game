package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.ui.FlxButton;
import flixel.ui.FlxVirtualPad;

class PlayState extends FlxState
{
	public static var virtualPad:FlxVirtualPad;
	public static var ActuallLevel:Int = 0;
	public static var cameraPlayer:FlxCamera;
	public static var CameraHud:FlxCamera;
	public static var life_gui:FlxSprite;

	var BtnMenu:FlxButton;
	var BtnRetry:FlxButton;

	public static var Bar_life_gui:FlxTypedGroup<FlxSprite>;
	override public function create()
	{
		super.create();
		BtnMenu = new FlxButton(250, 300, "Inicio", MenuChange);
		BtnRetry = new FlxButton(350, 300, "Reintentar", Retry);
		// Se carga el mando virtual
		virtualPad = new FlxVirtualPad(LEFT_RIGHT, A);
		virtualPad.buttonLeft.scale.set(1.5, 1.5);
		virtualPad.buttonRight.scale.set(1.5, 1.5);
		virtualPad.buttonA.scale.set(1.5, 1.5);
		virtualPad.buttonA.setPosition(580, 415);
		virtualPad.buttonLeft.setPosition(16, 420);
		virtualPad.buttonRight.setPosition(86, 420);
		// Se configura la camara para el hud
		CameraHud = new FlxCamera(0, 0);
		CameraHud.bgColor = 0x00ED0606;
		virtualPad.camera = CameraHud;
		// Se configura la camera del jugador
		cameraPlayer = new FlxCamera(0, 0);
		cameraPlayer.zoom = 2;
		// Se agregaran los botones para salir y continuar
		#if desktop
		FlxG.mouse.visible = false;
		#end

	}

	public function MakeBarLife()
	{
		Bar_life_gui = new FlxTypedGroup<FlxSprite>();
		var x_heart:Int = 0;
		for (i in 0...Player.life)
		{
			life_gui = new FlxSprite(10 + x_heart, 8);
			life_gui.loadGraphic("assets/images/gui/heart.png", false, 16, 16);
			life_gui.scale.set(1.5, 1.5);
			Bar_life_gui.add(life_gui);
			x_heart += 28;
		}
		Bar_life_gui.camera = CameraHud;
		FlxG.state.add(Bar_life_gui);
	}

	public function addPad()
	{
		FlxG.state.add(virtualPad);
	}

	public function MenuChange()
	{
		FlxG.switchState(new Menu());
	}

	public function Retry()
	{
		FlxG.switchState(new LevelTest2());
	}

}
