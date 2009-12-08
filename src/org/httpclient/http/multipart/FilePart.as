package org.httpclient.http.multipart
{
	import flash.filesystem.File;
	
	public class FilePart extends AttachmentPart
	{
		public function FilePart(file:File, contentType:String="application/octet-stream")
		{
			super("file", file.name, file, contentType);
		}
	}
}