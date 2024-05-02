package;

class AssetPaths
{
	public static final SOUND_EXT:String = "ogg";

	public static function getPath(folder:String, ?str:String)
	{
		if (str == null)
			str = '';
		return 'resources/$folder/$str';
	}

	public static function font(str:String, ?ext:String)
	{
		if (ext == null)
			ext = "tff";
		return getPath("fonts", str + '.$ext');
	}

	public static function image(str:String)
	{
		return getPath("images", str + ".png");
	}

	public static function music(str:String)
	{
		return getPath("music", str + SOUND_EXT);
	}

	public static function sound(str:String)
	{
		return getPath("sound", str + SOUND_EXT);
	}

	public static function lua(str:String)
	{
		return getPath("lua", str + ".lua");
	}
}
