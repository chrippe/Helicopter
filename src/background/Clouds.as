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
	public class Clouds extends Sprite 
	{
		//FIX: Should we use an array to hold the speed, or perhaps add it to the xml
		private var cloudSpeedArray:Array = [];
		private var arrLength:int;
		private var speed:Number;
		
		private var min:Number = 1;
		private var max:Number = 3;
		private var avrund:Number = 1;
		private var divider:Number = 10;
		
		//FIX: see comment above
		private var cloudContainer:Sprite;
		
		public function Clouds() 
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
			cloudContainer = new Sprite();
			addChild(cloudContainer);
			
			//Textures
			var cloudOneTexture:Texture = Game.gameAssets.getTexture("cloud_1");
			var cloudTwoTexture:Texture = Game.gameAssets.getTexture("cloud_2");
			var cloudThreeTexture:Texture = Game.gameAssets.getTexture("cloud_3");
			
			//Make an image of the texture
			var cloud_1_Image:Image = new Image(cloudOneTexture);
			cloud_1_Image.x = 870;
			cloud_1_Image.y = 320;//420
			speed = NumberUtilities.random(min, max, avrund) / divider;
			cloudContainer.addChild(cloud_1_Image);
			cloudSpeedArray.push(speed);
			
			var cloud_2_Image:Image = new Image(cloudTwoTexture);
			cloud_2_Image.x = 600;
			cloud_2_Image.y = 340;//470
			speed = NumberUtilities.random(min, max, avrund) / divider;
			cloudContainer.addChild(cloud_2_Image);
			cloudSpeedArray.push(speed);
			
			var cloud_12_Image:Image = new Image(cloudOneTexture);
			cloud_12_Image.x = 360;
			cloud_12_Image.y = 310;//390
			speed = NumberUtilities.random(min, max, avrund) / divider;
			cloudContainer.addChild(cloud_12_Image);
			cloudSpeedArray.push(speed);
			
			var cloud_21_image:Image = new Image(cloudTwoTexture);
			cloud_21_image.x = 10;
			cloud_21_image.y = 350;//451
			speed = NumberUtilities.random(min, max, avrund) / divider;
			cloudContainer.addChild(cloud_21_image);
			cloudSpeedArray.push(speed);
			
			var cloud_3_image:Image = new Image(cloudThreeTexture);
			cloud_3_image.x = 200;
			cloud_3_image.y = 310;
			speed = NumberUtilities.random(min, max, avrund) / divider;
			cloudContainer.addChild(cloud_3_image);
			cloudSpeedArray.push(speed);
			
			arrLength = cloudSpeedArray.length;
			this.addEventListener(Event.ENTER_FRAME, this_enterFrame);
		}
		
		private function this_enterFrame(e:Event):void 
		{
			
			for (var i:int = 0; i < cloudContainer.numChildren; i++) 
			{
				var obj:Image = Image(cloudContainer.getChildAt(i));
				obj.x -= cloudSpeedArray[i];
				if (obj.x + obj.width < 0) 
				{
					obj.x = stage.stageWidth;
				}
			}
		}
		
	}

}