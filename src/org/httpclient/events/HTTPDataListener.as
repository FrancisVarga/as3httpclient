package org.httpclient.events {
    
  import org.httpclient.Log;
  import flash.utils.ByteArray;
  
  
  /**
   * Same as HTTPListener but stores data. 
   * You may want to use the regular HTTPListener to handle the data as it becomes
   * available instead of storing it in memory.
   */
  public class HTTPDataListener extends HTTPListener {
    
    public var onDataComplete:Function = null;
    
    private var _data:ByteArray = null;
    
    /**
      * In addition to HTTPListener listeners, we have:
      *  - onDataComplete(e:HTTPResponseEvent, data:ByteArray)
      */
    public function HTTPDataListener(listeners:Object = null) {
      super(listeners);  
      if (listeners && listeners["onDataComplete"] != undefined) onDataComplete = listeners.onDataComplete;
      _data = new ByteArray();
    }
    
    override protected function onInternalData(e:HTTPDataEvent):void {
      if (_data != null) _data.writeBytes(e.bytes, 0, e.bytes.length);
      super.onInternalData(e);
    }
    
    override protected function onInternalComplete(e:HTTPResponseEvent):void { 
      if (onDataComplete != null) onDataComplete(e, _data);
      _data = null;
      super.onInternalComplete(e);
    }
  }
}