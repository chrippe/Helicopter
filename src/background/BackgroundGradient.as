package background 
{
	import starling.display.Quad;
	
	/**
	 * ...
	 * @author Chris
	 * This class just draws the blue background gradient
	 */
	
	public class BackgroundGradient extends Quad 
	{
		
		public function BackgroundGradient(width:Number, height:Number, color:uint=16777215, premultipliedAlpha:Boolean=true) 
		{
			super(width, height, color, premultipliedAlpha);
			this.setVertexColor(0, 0x69c7e8);
			this.setVertexColor(1, 0x69c7e8);
			this.setVertexColor(2, 0xe5f6ff);
			this.setVertexColor(3, 0xe5f6ff);
		}
		
	}

}