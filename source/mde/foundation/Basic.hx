package mde.foundation;

import openfl.display.Sprite;

class Basic extends Sprite
{
	override public function new()
	{
		super();
	}

    public var exists:Bool = true;

    public function destroy()
    {
        exists = false;
    }
}
