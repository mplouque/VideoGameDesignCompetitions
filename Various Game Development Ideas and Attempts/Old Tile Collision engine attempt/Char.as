package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import ReusableCode.MyMath;
	
	public class Char extends MovieClip 
	{
		var leftKey:Boolean;
		var rightKey:Boolean;
		var upKey:Boolean;
		var downKey:Boolean;
		var spaceKey:Boolean;
		private var _root:MovieClip;
		public var radius:Number;
		public var ableToMoveUp:Boolean;
		public var ableToMoveDown:Boolean;
		public var ableToMoveRight:Boolean;
		public var ableToMoveLeft:Boolean;
		public var grabbing:Boolean;
		const SPEED:Number=4;
		public const TILESIZE:int=63;
		
		
		public function Char() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			radius=31.5;
			ableToMoveUp=true;
			ableToMoveDown=true;
			ableToMoveRight=true;
			ableToMoveLeft=true;
			grabbing=false;
			_root = MovieClip(root);//defining the root
		}
		
		public function init(e:Event)
		{
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			addEventListener(Event.ENTER_FRAME, update);
			
		}
		//keydown handler
		 function keyDownHandler(k:KeyboardEvent):void
		{
			if (k.keyCode == 37) 
			{
				leftKey = true;
				
			}
			else if (k.keyCode == 39) 
			{
				rightKey = true;
				
			}
			else if (k.keyCode == 38) 
			{
				upKey = true;
				
			}
			else if (k.keyCode == 40) 
			{
				downKey = true;
				
			}
			if (k.keyCode == 32)
			{
				spaceKey=true;
			}
			
			
		}
		//keyup handler
		 function keyUpHandler(k:KeyboardEvent):void
		{
			if (k.keyCode == 37) 
			{
				leftKey = false;
			}
			if (k.keyCode == 39) 
			{
				rightKey =false;
			}
			if (k.keyCode == 38) 
			{
				upKey = false;
			}
			if (k.keyCode == 40) 
			{
				downKey = false;
			}
			if (k.keyCode == 32)
			{
				spaceKey=false;
			}
		}
		
		function handleCharMovement()
		{
			if (upKey==true && ableToMoveUp)
			{
				this.y-= SPEED;
			}
			
			else if(downKey==true && ableToMoveDown)
			{
				this.y+= SPEED;
			}
			
			else if (leftKey==true && ableToMoveLeft)
			{
				this.x-=SPEED;
			}
			
			else if (rightKey==true && ableToMoveRight)
			{
				this.x+=SPEED;
			}
		}
		
		function handleCharBoundaries()
		{
				if ((this).x<TILESIZE) 
					{
						(this).x=TILESIZE;
					}
				else if ((this).x>stage.stageWidth-TILESIZE*2) 
					{
						(this).x=stage.stageWidth-TILESIZE*2;
					}
				if ((this).y<TILESIZE) 
					{
						(this).y=TILESIZE;
					}
				else if ((this).y>stage.stageHeight-TILESIZE*2) 
					{
						(this).y=stage.stageHeight-TILESIZE*2;
					}
		}
		
		function handleCharGrab()
		{
			if (spaceKey==true)
			{
				grabbing=true;
				(this).gotoAndStop("CharGrab");
			}
			else if (spaceKey==false)
			{
				(this).gotoAndStop(1);
				grabbing=false;
			}
			
	
		}
				
		function update(e:Event)
		{
			handleCharMovement();
			handleCharBoundaries();
			handleCharGrab();
			//trace("added");
			/*if(MyMath.hitTest((this), _root.mcWallBlock))
			   {
				   trace("HIT");
			   }*/
			//trace((this).x);
			//trace((this).y);
			
		}
		
	}
	
}
