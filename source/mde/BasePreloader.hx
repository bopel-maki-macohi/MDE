package mde;

import openfl.events.ProgressEvent;
import openfl.events.Event;
import openfl.display.Sprite;

class BasePreloader extends Sprite
{
	public function new()
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	public function onAddedToStage(_)
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

		onInit();
		onUpdate(loaderInfo.bytesLoaded, loaderInfo.bytesTotal);

		addEventListener(ProgressEvent.PROGRESS, onProgress);
		addEventListener(Event.COMPLETE, onComplete);
	}

	function onComplete(event:Event):Void
	{
		event.preventDefault();

		removeEventListener(ProgressEvent.PROGRESS, onProgress);
		removeEventListener(Event.COMPLETE, onComplete);

		onLoaded();
	}

	public function onProgress(event:ProgressEvent):Void
	{
		onUpdate(Std.int(event.bytesLoaded), Std.int(event.bytesTotal));
	}

	public function onInit() {}

	public function onLoaded()
	{
		dispatchEvent(new Event(Event.UNLOAD));
	}

	public function onUpdate(bytesLoaded:Int, bytesTotal:Int):Void
	{
		var percentLoaded = 0.0;
		if (bytesTotal > 0)
		{
			percentLoaded = bytesLoaded / bytesTotal;
			if (percentLoaded > 1)
				percentLoaded = 1;
		}
	}
}
