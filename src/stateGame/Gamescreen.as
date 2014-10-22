package stateGame 
{
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event
	import starling.textures.Texture;
	

	/**
	 * ...
	 * @author Chris
	 */
	public class Gamescreen extends Sprite 
	{
		private var heli:Helicopter;
		private var landingPlate:LandingPlate;
		private var obstacle:Obstacles;
		private var goodie:Goodie;
		private var clock:Clock;
		
		public function Gamescreen() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
			var grass:Texture = Game.gameAssets.getTexture("ground");
			var grassImage:Image = new Image(grass);
			grassImage.y = 470;
			addChild(grassImage);
			
			//levelXML.level_1.hinder
			//theXML.infoclipassets.infoclipasset[i].@title
			//var xpos:Number = Game.levelXML.level_1.helikopter.@x;
			//var ypos:Number = Game.levelXML.level_1.helikopter.@y;
			//trace("xpos: " + Game.levelXML.level_1.helikopter.@x)
			
			
			//var obsTextureName:String = 
			
			//TODO: set the params from the Levels xml
			clock = new Clock(40, 22, .04);
			addChild(clock);
			
			
			obstacle = new Obstacles();
			addChild(obstacle);
			//TODO: maybe it is faster if we have for example the x/y pos from the xml
			//in vars here and just pass them to the constructor of say Goodie class
			goodie = new Goodie();
			addChild(goodie);
			
			heli = new Helicopter(String(1));
			addChild(heli);
			
			
/*			landingPlate = new LandingPlate();
			addChild(landingPlate);*/
			
		}
		
		
	}

}