package org.httpclient.events
{
    import flash.events.ErrorEvent;
  
  
  public class HTTPErrorEvent extends ErrorEvent {
    
    public static const ERROR:String = "httpError";
    public static const TIMEOUT_ERROR:String = "httpTimeoutError";
    
    public function HTTPErrorEvent(type:String = ERROR, bubbles:Boolean = false, 
      cancelable:Boolean = false, text:String = "", id:int = 0):void {
        
      super(type, bubbles, cancelable, text);
    }
        
  }
}