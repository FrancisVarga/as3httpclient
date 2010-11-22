package org.httpclient.events
{
	import flash.events.Event;
	import flash.events.ErrorEvent;

	public class HTTPErrorEvent extends ErrorEvent
	{
		public static const ERROR : String = "httpError";
		public static const TIMEOUT_ERROR : String = "httpTimeoutError";

		public function HTTPErrorEvent(type : String = ERROR, bubbles : Boolean = false, cancelable : Boolean = false, text : String = "") : void
		{
			super(type, bubbles, cancelable, text);
		}

		override public function clone() : Event
		{
			return new HTTPErrorEvent(this.type);
		}

	}
}