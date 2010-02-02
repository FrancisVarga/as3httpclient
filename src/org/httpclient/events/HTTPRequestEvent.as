package org.httpclient.events {
  
  import flash.events.Event;
  
  import org.httpclient.HTTPRequest;
  
  public class HttpRequestEvent extends Event {
    
    public static const CONNECT:String = "requestConnect";
    public static const COMPLETE:String = "requestComplete";
    
    private var _request:HTTPRequest;
    private var _header:String;
    
    public function HttpRequestEvent(request:HTTPRequest, header:String, type:String = COMPLETE, bubbles:Boolean = false, cancelable:Boolean = false):void {
      super(type, bubbles, cancelable);
      _request = request;
      _header = header;
    }
    
    public function get request():HTTPRequest {
      return _request;
    }
    
    public function get header():String {
      return _header;
    }
    
  }
}