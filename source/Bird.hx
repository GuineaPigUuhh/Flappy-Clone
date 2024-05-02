import flixel.math.FlxMath;
import flixel.util.FlxColor;

class Bird extends FlxSprite
{
	public var _gravity:Int = 600;

	override public function new()
	{
		super(25, 0);
		screenCenter(Y);

		makeGraphic(50, 50, FlxColor.RED);

		acceleration.y = _gravity;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		jump_mechanic();
		applyLimits();
	}

	public function jump_mechanic()
	{
		final jumpKey = FlxG.keys.justPressed.SPACE;
		if (jumpKey)
		{
			velocity.y = -_gravity / 2;
		}
	}

	public function applyLimits()
	{
		if (y < 0)
			y = velocity.y = 0;
		if (y > FlxG.height)
			FlxG.resetState();
	}
}
