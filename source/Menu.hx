package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;

class Menu extends FlxState{
    override public function create(){
        var PlayBtn:FlxButton;
        PlayBtn = new FlxButton(0,0,"Onichan!!!",klikeame);
        PlayBtn.screenCenter();
        add(PlayBtn);
        super.create();
    };

    function klikeame() {
        FlxG.switchState(new PlayState());
    };

    override public function update(elapsed:Float) {
        super.update(elapsed);
    };

}
