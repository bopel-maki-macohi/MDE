package;

import mde.util.Global;
import mde.Runner;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();

		haxe.Log.trace = function(v,?infos)
		{
			Logger.log('trace: ' + v);
		}

		Global.runner = new Runner();
		addChild(Global.runner);
	}
}
