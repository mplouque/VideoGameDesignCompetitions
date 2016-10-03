package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	public class Hero 
	{
		public var sprNum:Number;
		public var sheet:BitmapData;
		public var ts:int;
		public var xtile:int;
		public var ytile:int;
		public var bmp:Bitmap;
		public var x:Number;
		public var y:Number;
		public var dist:Number;
		public var speed:Number;
		public var moveOb:Object;
		public var mymap:int;
		public var anim:Array;
		public var animCount:int;
		public var animTime:int;
		public var jumpSpeed:Number;
		public var jumpStart:Number;
		public var gravity:Number;
		public var onLadder:Boolean;
		public var xtc:int;
		public var ytc:int;
		

		public function Hero(spr:Number, tileSize:int, xt:int, yt:int) 
		{
			// constructor code
			sprNum = spr;
			sheet = new HeroSheet(0,0);
			ts = tileSize;
			anim = new Array();
			animCount = 0;
			animTime = 0;
			dist = 0;
			jumpSpeed = Infinity;
			xtile = xt;
			ytile = yt;
			onLadder = false;
		}

	}
	
}
