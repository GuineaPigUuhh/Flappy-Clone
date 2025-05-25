import flixel.FlxCamera;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.system.macros.FlxMacroUtil;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	public var HUD:FlxCamera;
	public var scoreTxt:FlxText;
	public var score(default, set):Int = 0;

	var player:Bird;

	final _scoreTxt_scale = 0.65;
	final _scoreTxt_lerp = 0.2;

	public var pipes:Array<FlxSpriteGroup>;
	public var pipeTimer:FlxTimer;

	public static var instance:PlayState;

	public function set_score(value:Int):Int
	{
		score = value;

		scoreTxt.text = '$score';
		scoreTxt.scale.y = scoreTxt.scale.x += _scoreTxt_scale;
		FlxG.sound.play(Paths.sound('score' + (score % 2 + 1)));

		return score;
	}

	override public function create()
	{
		instance = this;
		FlxG.mouse.visible = false;

		HUD = new FlxCamera();
		HUD.bgColor.alpha = 0;
		FlxG.cameras.add(HUD, false);

		player = new Bird();
		player.screenCenter();
		add(player);

		pipeTimer = new FlxTimer();
		pipeTimer.start(1.5, function(t)
		{
			newPipe();
		}, 0);

		createHUD();

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		scoreTxt.scale.set(FlxMath.lerp(scoreTxt.scale.x, 1, _scoreTxt_lerp), FlxMath.lerp(scoreTxt.scale.y, 1, _scoreTxt_lerp));
	}

	function createHUD()
	{
		scoreTxt = new FlxText(0, 50, FlxG.width, '0', 50);
		scoreTxt.cameras = [HUD];
		scoreTxt.bold = true;
		scoreTxt.font = Paths.font(Main.defaultFont);
		scoreTxt.alignment = CENTER;
		add(scoreTxt);
	}

	dynamic function newPipe()
	{
		var currentPipesGroup = new Pipes();
		currentPipesGroup.friend = player;
		add(currentPipesGroup);
		// pipes.push(currentPipesGroup);
	}
}
