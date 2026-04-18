package mde.util;

class Logger
{
	public static function err(e:Dynamic)
		log('err: $e');

	public static function wrn(e:Dynamic)
		log('wrn: $e');

	public static function info(e:Dynamic)
		log('info: $e');

	public static function log(info:Dynamic)
	{
		var str:String = Std.string(info);

		#if js
		if (js.Syntax.typeof(untyped console) != "undefined" && (untyped console).log != null)
			(untyped console).log(str);
		#elseif lua
		untyped __define_feature__("use._hx_print", _hx_print(str));
		#elseif sys
		Sys.println(str);
		#else
		throw new haxe.exceptions.NotImplementedException()
		#end
	}
}
