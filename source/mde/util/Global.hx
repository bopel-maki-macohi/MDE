package mde.util;

import mde.foundation.State;
import lime.app.Application;

class Global
{
	public static var application(get, never):Application;

	static function get_application():Application
	{
		return Application.current;
	}

    @:allow(Main)
    public static var runner(default, null):Runner = null;

	public static function switchState(targetState:State)
	{
		if (targetState == null)
		{
			Logger.err('Attempted to switch to a null state. Aborted.');

			return;
		}

		if (runner.state != null)
		{
			runner.state.destroy();
			runner.state = null;
		}

		runner.state = targetState;
		runner.state.create();
	}
}
