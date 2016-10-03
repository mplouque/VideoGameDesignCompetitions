package  {
	
	import flash.display.Sprite;
	import flash.events.Event;
	import ReusableCode.MyMaths;
	
	public class Bullet extends Sprite {
		
		//properties 
		private var speed:int;
		public var radius:int=3;
		
		public function Bullet() {
			// constructor code
			speed=10;
		}
		
		function update()
		{
			//move in direction bullet is fired
			MyMaths.moveForward(this, speed);
			//x=x+Math.cos(rotation/180*Math.PI)*speed;
			//y=y+Math.sin(rotation/180*Math.PI)*speed;
			//delete bullet when off of screen to stop lag/crash
			if (x<0 || x>500 || y<0 || y>500) 
			{
				//remove bullet from the screen
				parent.removeChild(this);
			}
		}
	}
	
}
