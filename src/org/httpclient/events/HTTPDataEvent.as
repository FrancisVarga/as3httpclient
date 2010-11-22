package org.httpclient.events
{
	import flash.events.Event;
	import flash.utils.ByteArray;

	public class HTTPDataEvent extends Event
	{
		public static const DATA : String = "httpData";
		private var _bytes : ByteArray;

		public function HTTPDataEvent(bytes : ByteArray, type : String = DATA, bubbles : Boolean = false, cancelable : Boolean = false) : void
		{
			super(type, bubbles, cancelable);
			_bytes = bytes;
		}

		override public function clone() : Event
		{
			return new HTTPDataEvent(this.bytes);
		}

		public function get bytes() : ByteArray
		{
			return _bytes;
		}

		public function readUTFBytes() : String
		{
			return _bytes.readUTFBytes(_bytes.length);
		}
	}
}