package;

import LevelTest2;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class Menu extends FlxState{
    override public function create(){
        var PlayBtn:FlxButton;
		PlayBtn = new FlxButton(0, 0, "Play!!!", click);
        PlayBtn.screenCenter();
        add(PlayBtn);
        super.create();
    };

	function click()
	{
		FlxG.switchState(new LevelTest2());
    };

    override public function update(elapsed:Float) {
        super.update(elapsed);
    };

}



