/**
 * Copyright (c) 2007 Gabriel Handford
 * See LICENSE.txt for full license information.
 */
package org.httpclient.http.multipart {
  
  import flash.filesystem.File;
  
  import org.httpclient.io.HttpFileStream;
  
  public class AttachmentPart extends Part {
    
    /**
     * Create file part.
     * @param file File
     * @param contentType Content type
     */
    public function AttachmentPart(fieldname:String, filename:String, file:File, contentType:String = "application/octet-stream") {      
      super(fieldname, HttpFileStream.readFile(file), contentType, [ { name:"filename", value:filename } ], "binary");
    }
    
  }
  
  
}
