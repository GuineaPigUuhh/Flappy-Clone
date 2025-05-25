import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;

class Pipes extends FlxSpriteGroup
{
	var _speed = 250;
	static final _width = 65;
	static final _height = 500;

	public var addedScore = false;

	public var bottom:FlxSprite;
	public var top:FlxSprite;

	public var friend:Bird;

	override public function new()
	{
		super();

		top = new FlxSprite(FlxG.width, FlxG.random.float(-497, -173));
		top.makeGraphic(_width, _height, FlxColor.GREEN);
		add(top);

		bottom = new FlxSprite(FlxG.width, (top.y + top.height) + 200);
		bottom.makeGraphic(_width, _height, FlxColor.GREEN);
		add(bottom);

		velocity.x = -_speed;
	}

	override function update(elapsed:Float)
	{
		if (x < -700) kill();
		if (friend != null)
		{
			for (i in [bottom, top])
			{
				if ((friend.x >= i.x && friend.x <= i.x + friend.width) && !addedScore)
				{
					addedScore = true;
					PlayState.instance.score++;
				}
				if (FlxG.overlap(friend, i))
					FlxG.state.openSubState(new GameOverSubstate(PlayState.instance.score));
			}
		}

		super.update(elapsed);
	}
}
