package org.httpclient.events
{
    import flash.events.ErrorEvent;
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
  
  
  /**
   * Registers for events and forwards notifications to specified listeners
   * if they are set.
   */
  public class HTTPListener extends EventDispatcher {
    
    public var onClose:Function = null;
    public var onComplete:Function = null;
    public var onConnect:Function = null;
    public var onData:Function = null;
    public var onError:Function = null;
    public var onStatus:Function = null;
    public var onRequest:Function = null;
    
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
    public function HTTPListener(listeners:Object = null) {
      if (listeners) {
        if (listeners["onClose"] != undefined) onClose = listeners.onClose;
        if (listeners["onComplete"] != undefined) onComplete = listeners.onComplete;
        if (listeners["onConnect"] != undefined) onConnect = listeners.onConnect;
        if (listeners["onData"] != undefined) onData = listeners.onData;
        if (listeners["onError"] != undefined) onError = listeners.onError;
        if (listeners["onStatus"] != undefined) onStatus = listeners.onStatus;
        if (listeners["onRequest"] != undefined) onRequest = listeners.onRequest;
      }
    }
    
    public function register(dispatcher:EventDispatcher = null):HTTPListener {
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
    
    public function unregister(dispatcher:EventDispatcher = null):HTTPListener {
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
    
    protected function onInternalClose(e:Event):void { 
      if (onClose != null) onClose(e);
    }
    
    protected function onInternalComplete(e:HTTPResponseEvent):void { 
      if (onComplete != null) onComplete(e);
    }
    
    protected function onInternalConnect(e:HTTPRequestEvent):void { 
      if (onConnect != null) onConnect(e);
    }
    
    protected function onInternalRequest(e:HTTPRequestEvent):void {
      if (onRequest != null) onRequest(e);
    }
    
    protected function onInternalData(e:HTTPDataEvent):void { 
      if (onData != null) onData(e);
    }
    
    protected function onInternalError(e:ErrorEvent):void { 
      if (onError != null) onError(e);
    }
    
    protected function onInternalStatus(e:HTTPStatusEvent):void { 
      if (onStatus != null) onStatus(e);
    }
    
  }
}