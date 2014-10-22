package stateGame 
{
	import starling.animation.DelayedCall;
	import starling.core.Starling;
	import starling.animation.Juggler;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	
	/**
	 * ...
	 * @author Chris
	 */
	public class Clock extends Sprite 
	{
		
		private var clockTexture:Texture;
		private var clockImage:Image;
		
		private var visareTexture:Texture;
		private var visareImage:Image;
		
		private var clockSpeed:Number;
		private var stopAngle:Number = rotFromDeg(357);
		private var clockTimer:DelayedCall;
		public static var finishTime:String;
		
		private var minutes:Number = 0;
		private var seconds:Number = 0;
		
		private var clockXpos:Number;
		private var clockYpos:Number;
		
		public function Clock(xpos:Number, ypos:Number, speed:Number) 
		{
			super();
			
			clockXpos = xpos;
			clockYpos = ypos;
			clockSpeed = speed;
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);	
			
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
			clockTexture = Game.gameAssets.getTexture("clock");
			clockImage = new Image(clockTexture);
			clockImage.x = clockXpos;
			clockImage.y = clockYpos;
			addChild(clockImage);
			
			//TODO: fix these hardcoded x och y
			visareTexture = Game.gameAssets.getTexture("visare");
			visareImage = new Image(visareTexture);
			visareImage.x = 86;
			visareImage.y = 81;
			visareImage.pivotX = 3;
			visareImage.pivotY = 32;
			addChild(visareImage);
			
			trace("stopangle: " + stopAngle);
			trace("visare start angle: " + (visareImage.rotation)* 180 / Math.PI);
			
			// Degrees to Radians
			//var radians:Number = degrees * Math.PI / 180

			// Radians to Degrees
			//var degree:Number = radians * 180 / Math.PI
			
			
			startClock();
			
		}
		
/*		private function get playerTime():String
		{
			clockSpeed = 0;
			return finishTime;
		}*/

		
		private function startClock():void
		{
			clockTimer = new DelayedCall(clockTimer_timer, 1);
			clockTimer.repeatCount = 0;
			Starling.juggler.add(clockTimer);
			
			addEventListener(Event.ENTER_FRAME, clockvisare_enterFrame);
		}
		
		private function clockTimer_timer():void 
		{
			finishTime = getTime();
			
			//trace(finishTime)
			Starling.juggler.remove(clockTimer);
			startClock();
		}
		

		
		private function getTime():String
		{
			
			seconds += 1;
			
			if ( seconds == 60 )
			{
				minutes += 1;
				seconds = 0;
			}
			var secString:String = String(seconds);
			var minString:String = String(minutes);
			return minString + "min " + " " + secString + "s ";
			
		}
		
		private function clockvisare_enterFrame(e:Event):void 
		{
				
			//trace(visareImage.rotation)
			//if (Math.floor(visareImage.rotation) == stopAngle) 
			if (Math.floor((visareImage.rotation)* 180 / Math.PI) == -3) 
			{
				clockSpeed = 0;
				removeEventListener(Event.ENTER_FRAME, clockvisare_enterFrame);
				
				//clockTimer.stop();
				//clockTimer.removeEventListener(TimerEvent.TIMER, clockTimer_timer);
				//Starling.juggler.remove(clockTimer);
				
				//TODO: should we dispatch event here???
				//dispatchEvent(new Event("ClockStop"));
			}
			else
			{
				//visareImage.rotation += clockSpeed;
				visareImage.rotation += .015;
			}
			
		}
		
		
		private function rotFromDeg( degInput:Number ):Number
		{
			var rotOutput:Number = degInput;
			while ( rotOutput > 180 )
			{
				rotOutput -= 360;
			}
			while ( rotOutput < -180 )
			{
				rotOutput += 360;
			}
			return rotOutput;
		}
		

		
	}

}