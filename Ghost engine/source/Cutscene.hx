package;

import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxTimer;

class Cutscene extends FlxSpriteGroup{

    public var finalThingy:Void->Void;

    var bg:FlxSprite;
    var bgtxt:FlxSprite;

    var multipleFrames:Bool;

    var isEnding:Bool;

    var invisTimer:FlxTimer;

    var unInvisTimer:FlxTimer;

    var fadeBG:FlxSprite;

    

    public function new(cutscene){
        super();

        isEnding = false;

        switch (cutscene){
            case 'mimicry':

                bg = new FlxSprite(0, 0).loadGraphic(Paths.image('dialogue/final_scene', 'week1'));
                bgtxt = new FlxSprite(0, 0).loadGraphic(Paths.image('dialogue/final_text', 'week1'));

                bg.alpha = 0;

                multipleFrames = false;

                bgtxt.alpha = 0;

                fadeBG = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height);
                fadeBG.color = 0xFF000000;
                fadeBG.alpha = 0;

                add(fadeBG);

                add(bg);
                add(bgtxt);
                FlxTween.tween(fadeBG, {alpha: 1}, 1, {onComplete: function(_){ FlxTween.tween(bg, {alpha: 1}, 1); }  });

                

                invisTimer = new FlxTimer();
                invisTimer.time = 2;
                invisTimer.loops = 1;

                


                invisTimer.onComplete = function(invisTimer:FlxTimer){

                    FlxTween.tween(bgtxt, {alpha: 0}, .5, {onComplete: function(_){unInvisTimer.start();} });

                }


                unInvisTimer = new FlxTimer();
                unInvisTimer.time = 5;
                unInvisTimer.loops = 1;


                hahaLoop();
                


            default:
                isEnding = true;
                finalThingy();
               //kill();
        }

    }

    override function update(elapsed:Float){
        if(bg != null){

            

            
            if(FlxG.keys.justPressed.ANY && bg.alpha == 1){
                

                if (!isEnding)
                    {

                        isEnding = true;
                        FlxG.sound.play(Paths.sound('clickText'), 0.8);

                        invisTimer.cancel();
                        FlxTween.cancelTweensOf(bgtxt);
                        FlxTween.tween(bgtxt, {alpha: 0}, .5, {});

                        

                        FlxTween.tween(bg, {alpha: 0}, 1);

                        new FlxTimer().start(1, function(tmr:FlxTimer)
                        {
                            finalThingy();
                            //kill();
                        });
                    }

            }


        }

    }

    function hahaLoop():Void{
        invisTimer.start(2, function(invisTimer:FlxTimer){

            FlxTween.tween(bgtxt, {alpha: 1}, .5, {onComplete: function(_){ hahaLoop2();} });

        }, 1);


    }

    function hahaLoop2():Void{
        invisTimer.start(5, function(invisTimer:FlxTimer){

            FlxTween.tween(bgtxt, {alpha: 0}, .5, {onComplete: function(_){ hahaLoop();} });

        }, 1);


    }


}