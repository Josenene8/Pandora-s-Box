package;

import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxTimer;


class Credits extends MusicBeatState
{

    var isEnding:Bool;

    override function create(){

        isEnding = false;

        var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('credits'));
		add(bg);

    }

    override function update(elapsed:Float){
        super.update(elapsed);

        if(FlxG.keys.justPressed.ANY){
                

            if (!isEnding)
                {   
                    isEnding = true;


                    FlxG.switchState(new MainMenuState());
                }

        }


    }

}