package background 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	import utils.NumberUtilities;
	
	/**
	 * ...
	 * @author Chris
	 */
	
	 
	 //TODO: make the spread of the dots better, perhaps more and/or wider
	 //Also some kind of animation, like bobbing in and out quite gently and soft
	 
	public class WhiteDot extends Sprite 
	{
		
		private var dotsArray:Array;
		private var numDots:Number = 16;
		private var dotTexture:Texture;
		
		public function WhiteDot() 
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
			dotsArray = new Array();
			
			dotTexture = Game.gameAssets.getTexture("dot");
			
			setUpDots();
		}
		
		private function setUpDots():void 
		{
			for (var i:int = 0; i < numDots ; i++) 
			{
				var dotImage:Image = new Image(dotTexture);
				dotImage.x = NumberUtilities.random(50, 770);
				dotImage.y = NumberUtilities.random(60, 300); 
				dotImage.scaleX = dotImage.scaleY = NumberUtilities.random(4, 10) / 10;
				dotsArray.push(dotImage);
				addChild(dotImage);
			}
			
		}
		
	}

}