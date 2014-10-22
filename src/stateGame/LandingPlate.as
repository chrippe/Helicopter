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
	public class LandingPlate extends Sprite 
	{
		
		private var landingPlateTexture:Texture;
		private var landingPlateImage:Image;
		
		public function LandingPlate() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
			landingPlateTexture = Game.gameAssets.getTexture("landingpad");
			
			landingPlateImage = new Image(landingPlateTexture);
			//TODO: set the right position of the landingplate
			landingPlateImage.x = Game.levelXML.level_1.landingplate.@x;
			landingPlateImage.y = Game.levelXML.level_1.landingplate.@y;
			landingPlateImage.pivotX = landingPlateImage.width >> 1;
			landingPlateImage.pivotY = landingPlateImage.height >> 1;
			
			addChild(landingPlateImage);
			
			trace("Landingplate added to stage");
			
		}
		
	}

}