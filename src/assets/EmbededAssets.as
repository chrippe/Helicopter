package assets 
{
	/**
	 * ...
	 * @author Chris
	 */
	public class EmbededAssets 
	{
		//Spritesheet
		[Embed(source = "../../bin/assets/spritesheet/atlasTexture.xml", mimeType = "application/octet-stream")]
		public static const AtlasXML:Class;
		
		[Embed(source="../../bin/assets/spritesheet/atlasTexture.png")]
		public static const atlasTexture:Class;
		
		//Font
		[Embed(source = "../../bin/assets/font/font.fnt", mimeType = "application/octet-stream")]
		public static const SegoeXML:Class;
		
		[Embed(source = "../../bin/assets/font/SegoeTexture.png")]
		public static const SegoeTexture:Class;
	}

}