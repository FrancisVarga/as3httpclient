/**
 * Copyright (c) 2007 Gabriel Handford
 * See LICENSE.txt for full license information.
 */
package org.httpclient.http
{
    import org.httpclient.HTTPRequest;
  
  
  public class Delete extends HTTPRequest {
    
    public function Delete() {      
      super("DELETE");
    }
    
    override public function get hasRequestBody():Boolean {
      return false;
    }
    
    override public function get hasResponseBody():Boolean {
      return true;
    }
        
  }
  
}