package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public var Scale = 150; 

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);
 

		animation.add('bf', [0, 1], 0, false, isPlayer);
		animation.add('pico', [2, 3], 0, false, isPlayer);
		animation.add('fsby', [4, 5], 0, false, isPlayer);
		animation.add('dad', [4, 5], 0, false, isPlayer);
		animation.add('fsby-broken', [6, 7], 0, false, isPlayer);
		animation.add('fsby-destroyed', [8, 9], 0, false, isPlayer);
		animation.add('hat', [10], 0, false, isPlayer);
		animation.add('gf', [11], 0, false, isPlayer);

		animation.play(char);
		switch(char){
			case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit' | 'gf-pixel':
				{

				}
			default:
				{
					antialiasing = true;
				}
		}
		scrollFactor.set();
	}



	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
