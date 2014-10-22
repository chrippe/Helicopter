package utils
{
	import flash.events.Event;
	//import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import starling.events.EventDispatcher;
	
	
	/**************************************************
	  ........................
	  @author Christian EKberg
	  ........................
	  
	  USAGE:
	  
	    import flash.events.Event;
     
		var n:LoadXML = new LoadXML("data.xml");
		var xml:XML;
		
		n.addEventListener(Event.COMPLETE, onComplete);
		
		function onComplete(event:Event):void
		{
	 		xml = n.getXML();
	 	}
	 	
	 ****************************************************/
	
	public class LoadXML extends EventDispatcher
	{
		private var data:XML;
		private var loader:URLLoader;
		
		public function LoadXML(path:String)
		{
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onComplete, false, 0, true);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError, false, 0, true);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, loader_securityError, false, 0, true);
			loader.load(new URLRequest(path));
		}
		
		
		//---------------------------------------------------------------------------------------
		
		private function onComplete(event:Event):void
		{
			try
			{
				data = new XML(event.target.data);
				
				loader.removeEventListener(Event.COMPLETE, onComplete);
				loader.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
				
				dispatchEventWith("xmlLoaded", false, "loadLevelXML_complete");
				//dispatchEvent(new Event(Event.COMPLETE));
				//trace("LoadXMl true");
			}
			catch (error:Error)
			{
				trace("Could not load XML: " + error);
			}
		}
		
		//---------------------------------------------------------------------------------------
		
		private function onIOError(event:IOErrorEvent):void
		{
			trace("An error occured trying to load the XML: " + event.text);
		}
		
		//---------------------------------------------------------------------------------------
		
		private function loader_securityError(e:SecurityErrorEvent):void 
		{
			trace("Security error: " + e);
		}
		
		//---------------------------------------------------------------------------------------
		
		public function getXML():XML
		{
			return data;
		}
		
		//---------------------------------------------------------------------------------------
	}	
}