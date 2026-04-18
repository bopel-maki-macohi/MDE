package;

import mde.Booter;
import openfl.display.Sprite;

class Main extends Sprite
{
	public var booter:Booter;

	public function new()
	{
		super();

		booter = new Booter();
		addChild(booter);
	}
}
