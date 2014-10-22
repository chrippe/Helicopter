package stateGame 
{
	import assets.EmbededAssets;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.textures.Texture;	
	import starling.textures.TextureAtlas;
	import starling.utils.deg2rad;
	
	import starling.core.Starling;
	import starling.animation.Juggler;
	
	/**
	 * ...
	 * @author Chris
	 */
	public class Helicopter extends Sprite 
	{
		
		public var vx:Number = 0;
		public var vy:Number = 0;
		public var ax:Number = 0.15 / 2;//0.15;
		public var ay:Number = 0.20 / 2;//0.20;
		public var grav:Number = 0.05 / 2;//0.05
		
		public var heliContainer:Sprite;
		
		public static const LEFT:uint = 37;
		public static const RIGHT:uint = 39;
		public static const UP:uint = 38;
		public static const DOWN:uint = 40;
		public static const SPACE:uint = 32;
		
		private var leftDown:Boolean = false;
		private var rightDown:Boolean = false;
		private var upDown:Boolean = false;
		private var downDown:Boolean = false;
		
		private var worldWidth:Number = 820;
		private var worldHeight:Number = 540;
		
		private var rotorTopTexture:Texture;
		private var rotorTopXML:XML;
		private var rAtlas:TextureAtlas;
		private var rotorTop_mc:MovieClip;
		private var heliTexture:Texture;
		private var heliImage:Image;
		private var rotorBakTexture:Texture;
		private var rotorBakImage:Image;
		
		
		
		private var maxSpeed:Number = 3;
		
		private var level:String;
		
		//public var hitQuad:Quad;

		
		public function Helicopter(level:String) 
		{
			this.level = level;
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		
		//TODO: This class should be sent which level so we can build
		//the correct string for example:
		//Game.levelXML.level_1.helikopter.@x this line should be
		//var whichLevel:String = level_2;
		//Game.levelXML.whichLevel.helikopter.@x;
		//or something like that.
		//also the same with, goodie, landingplate and obstacle
		
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			

			
			trace("level: " + level)
			
			heliContainer = new Sprite();
			heliContainer.x = Game.levelXML.level_1.helikopter.@x;
			heliContainer.y = Game.levelXML.level_1.helikopter.@y;
			addChild(heliContainer);
			
			heliTexture = Game.gameAssets.getTexture("chopper");
			heliImage = new Image(heliTexture);
			heliContainer.addChild(heliImage);
			
			
			rotorTopTexture = Texture.fromBitmap(new EmbededAssets.atlasTexture());
			rotorTopXML = XML(new EmbededAssets.AtlasXML());
			rAtlas = new TextureAtlas(rotorTopTexture, rotorTopXML);
			
			rotorTop_mc = new MovieClip(rAtlas.getTextures("toprotoar"), 60);
			rotorTop_mc.pivotX = rotorTop_mc.width / 2;
			rotorTop_mc.pivotY = rotorTop_mc.height / 2;
			rotorTop_mc.x = 38;
			rotorTop_mc.y = 0;
			heliContainer.addChild(rotorTop_mc);
			Starling.juggler.add(rotorTop_mc);
			
			rotorBakTexture = Game.gameAssets.getTexture("rotor_back");
			rotorBakImage = new Image(rotorBakTexture);
			rotorBakImage.pivotX = rotorBakImage.width / 2;
			rotorBakImage.pivotY = rotorBakImage.height / 2;
			//FIXME: check why these values are why they are
			rotorBakImage.x = 7; 
			rotorBakImage.y = 39;
			heliContainer.addChild(rotorBakImage);
			
			heliContainer.pivotX = heliImage.width >> 1;
			heliContainer.pivotY = heliImage.height >> 1;
			
			
			
/*			hitQuad = new Quad(40, 70, 0xff0000);
			hitQuad.alpha = 0.4;
			hitQuad.pivotX = hitQuad.width / 2;
			hitQuad.pivotY = hitQuad.height / 2;
			hitQuad.x = heliContainer.width / 2 + 6;
			hitQuad.y = heliContainer.height / 2 - 8;
			heliContainer.addChild(hitQuad);*/
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, heliImage_keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, heliImage_keyUp);
			
			heliContainer.addEventListener(Event.ENTER_FRAME, enterFrame);
			
		}
		
		
		private function heliImage_keyDown(e:KeyboardEvent):void 
		{
			
			if (e.keyCode == LEFT) 
			{
				leftDown = true;
			} else if (e.keyCode == RIGHT) 
			{
				rightDown = true;
			}
			
			if (e.keyCode == UP) 
			{
				upDown = true;
			} else if (e.keyCode == DOWN)
			{
				downDown = true;
			}
			
		}
		
		private function heliImage_keyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == LEFT) 
			{
				leftDown = false;
			} else if (e.keyCode == RIGHT) 
			{
				rightDown = false;
			}
			if (e.keyCode == UP) 
			{
				upDown = false;
			}else if (e.keyCode == DOWN)
			{
				downDown = false;
			}
		}
		
		private function enterFrame(e:Event):void 
		{
			
			//TODO: make rotation dependet on the speed of the chopper
			rotorBakImage.rotation += deg2rad(10);
			//rotorTopImage.skewY += .10;
			
			
			if (leftDown)
			{
				
				vx -=  ax;
				vy -=  ay / 5; //1.8
				if (heliContainer.rotation > deg2rad(-24)) 
				{
					heliContainer.rotation -= deg2rad(1);
				}
			} 
			else if (!leftDown)
			{
				if (heliContainer.rotation <= deg2rad( -1))
				{
					heliContainer.rotation +=  deg2rad(2);
				}
			}
			
			if (rightDown) 
			{
				vx +=  ax;
				vy -=  ay / 5;
				if (heliContainer.rotation < deg2rad(24))
				{
					heliContainer.rotation +=  deg2rad(1);
				}
			} 
			else if (!rightDown)
			{
				if (heliContainer.rotation >= deg2rad(1))
				{
					heliContainer.rotation -=  deg2rad(2);
				}
			}
			
			if (upDown)
			{
				vy -=  ay;
			}
			else if (downDown) 
			{
				vy +=  ay / 6;
			}
			
			//Sets the max speed
			//TODO: make vars of the speed values
			if (vx >= 3) 
			{
				vx = 3;
			}
			if (vx <= -3) 
			{
				vx = -3;
			}
			vy +=  grav;
			heliContainer.x +=  vx;
			heliContainer.y +=  vy;
			
			//Check edges
			//TODO: maybe add movieclip borders 50px width
			if ( (heliContainer.x + heliContainer.width / 2) >  worldWidth)
			{
				heliContainer.x = worldWidth - heliContainer.width / 2;
				vx =  -  vx / 4;
			}
			else if ((heliContainer.x - heliContainer.width / 2) < 0)
			{
				heliContainer.x = 0 + heliContainer.width / 2;
				vx =  -  vx / 4;
			}
			if ((heliContainer.y + heliContainer.height / 2) > worldHeight)
			{
				heliContainer.y = worldHeight - heliContainer.height / 2;
				vy =  -  vy / 4;
			}
			else if ((heliContainer.y - heliContainer.height / 2) < 0)
			{
				heliContainer.y = 0 + heliContainer.height / 2;
				vy =  -  vy / 4;
			}
			
			
		}	
		
	}

}