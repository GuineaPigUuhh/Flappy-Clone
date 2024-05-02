import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;

class Pipes extends FlxSpriteGroup
{
	var _speed = 5;

	public var addedScore = false;

	public var bottom:FlxSprite;
	public var top:FlxSprite;

	public var friend:Bird;

	override public function new()
	{
		super();

		top = new FlxSprite(FlxG.width, FlxG.random.float(-497, -173));
		top.makeGraphic(50, 500, FlxColor.GREEN);
		add(top);

		bottom = new FlxSprite(FlxG.width, (top.y + top.height) + 160);
		bottom.makeGraphic(50, 500, FlxColor.GREEN);
		add(bottom);
	}

	override function update(elapsed:Float)
	{
		if (exists)
			x -= _speed;
		if (x < -700)
			kill();
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
					FlxG.resetState();
			}
		}

		super.update(elapsed);
	}
}
