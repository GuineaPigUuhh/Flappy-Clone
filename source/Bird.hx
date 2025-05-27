import flixel.math.FlxMath;
import flixel.util.FlxColor;
import Paths;

class Bird extends FlxSprite
{
	public var _gravity:Int = 600;
	static final _jump_scale = 0.2;
	static final _lerp_scale = 0.125;

	override public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		screenCenter(Y);

		makeGraphic(50, 50, FlxColor.RED);

		acceleration.y = _gravity;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		controls();
		applyLimits();
	}

	private function controls()
	{
		final jumpKey = FlxG.keys.justPressed.SPACE || FlxG.mouse.justPressed;
		if (jumpKey)
		{
			velocity.y = -_gravity / 2;
			FlxG.sound.play(Paths.sound('jump'));
			scale.x -= _jump_scale;
			scale.y += _jump_scale;
		}
		angle = velocity.y * 0.05;
		scale.x = FlxMath.lerp(scale.x, 1, _lerp_scale);
		scale.y = FlxMath.lerp(scale.y, 1, _lerp_scale);
	}

	private function applyLimits()
	{
		if (y < 0) y = velocity.y = 0;
		if (y > FlxG.height + height) FlxG.resetState();
	}
}
