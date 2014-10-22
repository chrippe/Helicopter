package stateGame 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Chris
	 */
	public class Goodie extends Sprite 
	{
		
		public var goodieList:Array;
		private var goodieImage:Image;
		
		public function Goodie() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
			goodieList = new Array();
			
			var goodieTexture:Texture = Game.gameAssets.getTexture("carrot");
			
			var len:Number = Game.levelXML.level_1.carrots.carrot.length();
			
			for (var i:int = 0; i < len ; i++) 
			{
				goodieImage = new Image(goodieTexture);
				goodieImage.x = Game.levelXML.level_1.carrots.carrot[i].@x;
				goodieImage.y = Game.levelXML.level_1.carrots.carrot[i].@y;
				goodieImage.pivotX = goodieImage.width >> 1;
				goodieImage.pivotY = goodieImage.height >> 1;
				goodieList.push(goodieImage);
				addChild(goodieImage);
			}
		}
		
	}

}