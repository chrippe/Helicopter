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
	public class Obstacles extends Sprite 
	{
		
		public var obstacleList:Array;
		private var obstacleImage:Image;
		
		public function Obstacles() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
			obstacleList = new Array();
			
			var obstacleTexture:Texture = Game.gameAssets.getTexture("blocks_01");
			
			var len:Number = Game.levelXML.level_1.obstacles.obstacle.length();
			for (var i:int = 0; i < len; i++) 
			{
				obstacleImage = new Image(obstacleTexture);
				obstacleImage.x = Game.levelXML.level_1.obstacles.obstacle[i].@x;
				obstacleImage.y = Game.levelXML.level_1.obstacles.obstacle[i].@y;
				obstacleImage.pivotX = obstacleImage.width >> 1;
				obstacleImage.pivotY = obstacleImage.height >> 1;
				obstacleList.push(obstacleImage);
				addChild(obstacleImage);
			}
			
		}
		
	}

}