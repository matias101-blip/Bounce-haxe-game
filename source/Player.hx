package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

class Player extends FlxSprite{
    static inline var SPEED:Float = 100;
    public function new(x:Float = 0, y:Float = 0) {
        super(x,y);
		makeGraphic(16, 16, FlxColor.RED);
        drag.x = drag.y = 800;
    };

    function updateMovement(){
        var up:Bool = false;
        var down:Bool = false;
        var left:Bool = false;
        var right:Bool = false;
        up = FlxG.keys.anyPressed([UP, W]);
        down = FlxG.keys.anyPressed([DOWN, S]);
        left = FlxG.keys.anyPressed([LEFT, A]);
        right = FlxG.keys.anyPressed([RIGHT, D]);

        if(up && down)
          up=down=false;
        if(left && right)
          left=right=false;
        if (up || down || left || right){
          var newAngle:Float=0;
            if(up){
              newAngle = -90;
            if(left)
              newAngle-=45;
            else if(right)
              newAngle+=45;
            }
            else if(down){
              newAngle=90;
            if (left)
              newAngle+=45;
            else if (right)
              newAngle-=45;
            }
            else if(left)
              newAngle=180;
            else if (right)
            newAngle=0;
            velocity.setPolarDegrees(SPEED, newAngle);
        }
    };

  override function update(elapsed:Float){
    updateMovement();
    super.update(elapsed);
  }
}
