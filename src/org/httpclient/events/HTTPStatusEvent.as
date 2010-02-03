package org.httpclient.events {
  
  import flash.events.Event;
  
  import org.httpclient.HTTPHeader;
  import org.httpclient.HTTPResponse;
  
  public class HTTPStatusEvent extends Event {
    
    public static const STATUS:String = "httpStatus";
    
    private var _response:HTTPResponse;
    
    public function HTTPStatusEvent(response:HTTPResponse, type:String = STATUS, bubbles:Boolean = false, cancelable:Boolean = false):void {
      super(type, bubbles, cancelable);
      _response = response;     
    }
    
    public function get response():HTTPResponse{
      return _response;
    }
    
    public function get code():String { 
      return _response.code; 
    }
    
    public function get header():HTTPHeader
    {
      return _response.header;
    }
  }
}