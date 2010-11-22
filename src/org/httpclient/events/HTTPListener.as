package org.httpclient.events
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.IOErrorEvent;

	/**
	 * Registers for events and forwards notifications to specified listeners
	 * if they are set.
	 */
	public class HTTPListener extends EventDispatcher
	{
		private var _onClose : Function = null;
		private var _onComplete : Function = null;
		private var _onConnect : Function = null;
		private var _onData : Function = null;
		private var _onError : Function = null;
		private var _onStatus : Function = null;
		private var _onRequest : Function = null;

		public function setOnCloseFunction(onClose : Function) : HTTPListener
		{
			this._onClose = onClose;
			return this;
		}

		public function setOnCompleteFunction(onComplete : Function) : HTTPListener
		{
			_onComplete = onComplete;
			return this;
		}

		public function setOnConnect(onConnect : Function) : HTTPListener
		{
			_onConnect = onConnect;
			return this;
		}

		public function setOnDataFunction(onData : Function) : HTTPListener
		{
			_onData = onData;
			return this;
		}

		public function setOnErrorFunction(onError : Function) : HTTPListener
		{
			_onError = onError;
			return this;
		}

		public function setOnStatusFunction(onStatus : Function) : HTTPListener
		{
			_onStatus = onStatus;
			return this;
		}

		public function setOnRequestFunction(onRequest : Function) : HTTPListener
		{
			_onRequest = onRequest;
			return this;
		}

		/**
		 * Listeners:
		 *  - onClose(e:Event)
		 *  - onComplete(e:HTTPResponseEvent)
		 *  - onConnect(e:HTTPRequestEvent)
		 *  - onData(e:HTTPDataEvent)
		 *  - onError(e:ErrorEvent)
		 *  - onStatus(e:HTTPStatusEvent)
		 *  - onRequest(e:HTTPRequestEvent)
		 */
		public function HTTPListener(listeners : Object = null)
		{
			if (listeners)
			{
				if (listeners["onClose"] != undefined) _onClose = listeners['onClose'];
				if (listeners["onComplete"] != undefined) _onComplete = listeners['onComplete'];
				if (listeners["onConnect"] != undefined) _onConnect = listeners['onConnect'];
				if (listeners["onData"] != undefined) _onData = listeners['onData'];
				if (listeners["onError"] != undefined) _onError = listeners['onError'];
				if (listeners["onStatus"] != undefined) _onStatus = listeners['onStatus'];
				if (listeners["onRequest"] != undefined) _onRequest = listeners['onRequest'];
			}
		}

		public function register(dispatcher : EventDispatcher = null) : HTTPListener
		{
			if (dispatcher == null) dispatcher = this;
			dispatcher.addEventListener(Event.CLOSE, onInternalClose);
			dispatcher.addEventListener(HTTPResponseEvent.COMPLETE, onInternalComplete);
			dispatcher.addEventListener(HTTPRequestEvent.CONNECT, onInternalConnect);
			dispatcher.addEventListener(HTTPDataEvent.DATA, onInternalData);
			dispatcher.addEventListener(HTTPErrorEvent.ERROR, onInternalError);
			dispatcher.addEventListener(HTTPErrorEvent.TIMEOUT_ERROR, onInternalError);
			dispatcher.addEventListener(HTTPStatusEvent.STATUS, onInternalStatus);
			dispatcher.addEventListener(HTTPRequestEvent.COMPLETE, onInternalRequest);
			dispatcher.addEventListener(IOErrorEvent.IO_ERROR, onInternalError);
			dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onInternalError);
			return this;
		}

		public function unregister(dispatcher : EventDispatcher = null) : HTTPListener
		{
			if (dispatcher == null) dispatcher = this;
			dispatcher.removeEventListener(Event.CLOSE, onInternalClose);
			dispatcher.removeEventListener(HTTPResponseEvent.COMPLETE, onInternalComplete);
			dispatcher.removeEventListener(HTTPRequestEvent.CONNECT, onInternalConnect);
			dispatcher.removeEventListener(HTTPDataEvent.DATA, onInternalData);
			dispatcher.removeEventListener(HTTPErrorEvent.ERROR, onInternalError);
			dispatcher.removeEventListener(HTTPErrorEvent.TIMEOUT_ERROR, onInternalError);
			dispatcher.removeEventListener(HTTPStatusEvent.STATUS, onInternalStatus);
			dispatcher.removeEventListener(HTTPRequestEvent.COMPLETE, onInternalRequest);
			dispatcher.removeEventListener(IOErrorEvent.IO_ERROR, onInternalError);
			dispatcher.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onInternalError);
			return this;
		}

		protected function onInternalClose(e : Event) : void
		{
			if (_onClose != null) _onClose(e);
		}

		protected function onInternalComplete(e : HTTPResponseEvent) : void
		{
			if (_onComplete != null) _onComplete(e);
		}

		protected function onInternalConnect(e : HTTPRequestEvent) : void
		{
			if (_onConnect != null) _onConnect(e);
		}

		protected function onInternalRequest(e : HTTPRequestEvent) : void
		{
			if (_onRequest != null) _onRequest(e);
		}

		protected function onInternalData(e : HTTPDataEvent) : void
		{
			if (_onData != null) _onData(e);
		}

		protected function onInternalError(e : ErrorEvent) : void
		{
			if (_onError != null) _onError(e);
		}

		protected function onInternalStatus(e : HTTPStatusEvent) : void
		{
			if (_onStatus != null) _onStatus(e);
		}
	}
}