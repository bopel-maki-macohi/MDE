package mde;

import mde.foundation.State;
import mde.foundation.Basic;

class Runner extends Basic
{
	@:allow(mde.util.Global)
	public var state(default, null):State;
}
