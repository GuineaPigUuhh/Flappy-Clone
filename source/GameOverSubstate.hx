package;

import flixel.util.FlxColor;

class GameOverSubstate extends FlxSubState
{
    public var score:Int = 0;

    public function new(score:Int = 0) 
    {
        this.score = score;
        super();
    }  

    override public function create()
	{
        var bg = new FlxSprite(0,0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        bg.alpha = 0.5;
        add(bg);

        var scoreTxt = new FlxText(0, 0, FlxG.width, 'Score: ' + score, 50);
        scoreTxt.screenCenter();
		scoreTxt.bold = true;
		scoreTxt.font = Paths.font(Main.defaultFont);
		scoreTxt.alignment = CENTER;
		add(scoreTxt);

        var gameOverTxt = new FlxText(0, scoreTxt.y + 80, FlxG.width, 'Press [R] to restart the game', 25);
		gameOverTxt.bold = true;
		gameOverTxt.font = Paths.font(Main.defaultFont);
		gameOverTxt.alignment = CENTER;
		add(gameOverTxt);

        if (PlayState.instance.scoreTxt != null)
        {
            PlayState.instance.scoreTxt.destroy();
        }

        super.create();
    }

    override public function update(elapsed:Float)
	{
		super.update(elapsed);

        if (FlxG.keys.justPressed.R) FlxG.resetState();
	}
}