package  
{
	import background.BackgroundGradient;
	import background.Clouds;
	import background.WhiteDot;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.AssetManager;
	import stateGame.Gamescreen;
	import utils.LoadXML;
	
	import assets.EmbededAssets;
	
		
	/**
	 * ...
	 * @author Chris
	 */
	
	public class Game extends Sprite 
	{
		private var backgroundGradient:BackgroundGradient;
		private var loadLevelXML:LoadXML;
		private var dots:WhiteDot;
		public static var levelXML:XML;
	
		//FIX: should this be public static?
		public static var gameAssets:AssetManager;
		
		public function Game() 
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
			backgroundGradient = new BackgroundGradient(stage.stageWidth, stage.stageHeight, 16777215, true);
			addChild(backgroundGradient);
			
			loadTextureAtlas();
		}
		
		//Load our texture
		private function loadTextureAtlas():void 
		{
			gameAssets = new AssetManager();
			gameAssets.enqueue(EmbededAssets);
			gameAssets.loadQueue(function (ratio:Number):void
			{
				if (ratio == 1) 
				{
					loadTheLevelXML(); 
				}
			});
		}
		
		//Load our level data
		private function loadTheLevelXML():void 
		{
			loadLevelXML = new LoadXML("../bin/assets/level/Levels.xml");
			loadLevelXML.addEventListener("xmlLoaded", loadLevelXML_complete);			
		}
		
		private function loadLevelXML_complete():void 
		{
			levelXML = loadLevelXML.getXML();
			
			//When texture and leveldata are loaded we can begin to buid our scene
			addScene();
		}
		
		private function addScene():void 
		{
			dots = new WhiteDot();
			addChild(dots);
			
			var clouds:Clouds = new Clouds();
			addChild(clouds);
			
			var gs:Gamescreen = new Gamescreen();
			addChild(gs);
		}
	}

}