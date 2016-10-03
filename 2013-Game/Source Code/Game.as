package {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import fl.transitions.TweenEvent;
	import fl.transitions.easing.*;
	import flash.events.Event;
	import fl.transitions.Tween;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.system.System;
	import flash.media.SoundMixer;

	
	
	
	public class Game extends MovieClip
	{
		
		private var lastScore:int; //use to remember the last score
		private var tweens:Array;
		private var targetFrame:String;
		private var proTipTimer:Timer;
		private var proTips:Array;
		private var lastTipIndex:int;
		public var soundOn:Boolean;
		
		public function Game() 
		{
			targetFrame="Menu";
			soundOn = true;
			
			//add sime protips to th list
			proTips=new Array();
			proTips.push("Did you Know? Pluto is not a planet? Pluto is a dwarf planet!");
			proTips.push("Did you know? Because light takes time to travel, when you look at the sun from the earth you are actually seeing what the sun looked like 8 minutes ago!");
			proTips.push("Did you know that water is necessary for life? Both our moon and Mars have water on them, just in ice form!");
			lastTipIndex=-1;
		}
		
		
		
		
		
		
		
		private function newProTip(t:TimerEvent)
		{
			if (currentLabel != "Menu") {
				//set protip timer looping
			//loop indefinately
			proTipTimer.removeEventListener(TimerEvent.TIMER, newProTip);// event listener
			proTipTimer.stop();
			return;
			}
			do 
				{
					var tipIndex=Math.floor(Math.random()*proTips.length)
				} 
			while (tipIndex == lastTipIndex);
			var tip:String = proTips[tipIndex];
			lastTipIndex=tipIndex;
			//trace(tip);
			theProTip.text == tip;
			
		}
			
		//make doGameOver
		function doGameOver(e:levelEvent) 
		{
			//set lst score to be score from custom level event
			lastScore=e.score;
			targetFrame="gameover"
			
			//trace("event recieved");
			level.removeEventListener(levelEvent.GAME_OVER, doGameOver);
			
			tweenOut();
		}
		
		private function gotoLabel(desiredLabel:String)
		{
			for (var i=0; i<currentLabels.length; i++)
			{
				if (currentLabels[i].name == desiredLabel) 
				{
					gotoAndPlay(desiredLabel);
					return;
				}
			}
		}
		
		private function startGame(m:MouseEvent) 
			{
				targetFrame="game";
				tweenOut();
			}
		private function mainMenu(m:MouseEvent) 
			{
				targetFrame="menu";
				tweenOut();
			}
		private function skipToMenu(m:MouseEvent) 
			{
				targetFrame="menu";
				gotoLabel(targetFrame);				
			}
		
		private function back(m:MouseEvent) 
			{
				targetFrame="menu";
				tweenOut();
			}
			
		private function back2(m:MouseEvent) 
			{
				targetFrame="Instructions";
				tweenOut();
			}
		private function back3(m:MouseEvent) 
			{
				targetFrame="intro2";
				tweenOut();
			}
		private function back4(m:MouseEvent) 
			{
				targetFrame="intro3";
				tweenOut();
			}
		private function intro2 (m:MouseEvent)
			{
				targetFrame="intro2";
				tweenOut();
			}
		private function intro3 (m:MouseEvent)
			{
				targetFrame="intro3";
				tweenOut();
			}
		private function intro4 (m:MouseEvent)
			{
				targetFrame="intro4";
				tweenOut();
			}

		private function restartGame(m:MouseEvent) 
			{
				targetFrame="game";
				tweenOut();
			}
 		
		private function startInstructions(m:MouseEvent) 
			{
				targetFrame="Instructions";
				tweenOut();	
			}
		
		private function learnMore(m:MouseEvent) 
			{
				targetFrame="lm1";
				tweenOut();
			}
			
		private function learnMore2(m:MouseEvent) 
			{
				targetFrame="lm2";
				tweenOut();
			}
		private function learnMore3(m:MouseEvent) 
			{
				targetFrame="lm3";
				tweenOut();
			}

		
		private function tweenIn() 
		{
			
			//make tweens a new array
			tweens = new Array();
			//loop through all on screen content
			for (var i=0; i<numChildren; i++)
			{
				//make a reference to the current object
				var ob = getChildAt(i);
				//make a tween for the current object
				var tw:Tween = new Tween(ob, //onject to tween
										 "z", ///property to tween
										 Elastic.easeInOut, //easing function to use
										 ob.z-stage.stageWidth, //start value
										 ob.z, //end value
										 20+(i*5)); //time to take 
				//add the tween to the list of tweens
				tweens.push(tw);
									 
			}
		 }
		 
		 
		 private function tweenInGame() 
		{
			//make tweens a new array
			tweens = new Array();
			//loop through all on screen content
			for (var i=0; i<numChildren; i++)
			{
				//make a reference to the current object
				var ob = getChildAt(i);
				//make a tween for the current object
				var tw:Tween = new Tween(ob, //onject to tween
										 "x", ///property to tween
										 Elastic.easeInOut, //easing function to use
										 ob.x-stage.stageWidth, //start value
										 ob.x, //end value
										 30+(i*10)); //time to take 
				//add the tween to the list of tweens
				tweens.push(tw);
									 
			}
		 }
		 private function tweenInGameOver() 
		{
			
			//make tweens a new array
			tweens = new Array();
			//loop through all on screen content
			for (var i=0; i<numChildren; i++)
			{
				//make a reference to the current object
				var ob = getChildAt(i);
				//make a tween for the current object
				var tw:Tween = new Tween(ob, //onject to tween
										 "z", ///property to tween
										 Elastic.easeInOut, //easing function to use
										 ob.z-stage.stageWidth, //start value
										 ob.z, //end value
										 20+(i*10)); //time to take 
				//add the tween to the list of tweens
				tweens.push(tw);
									 
			}
		 }
		 
		 private function tweenInInstructions() 
		{
			//make tweens a new array
			tweens = new Array();
			//loop through all on screen content
			for (var i=0; i<numChildren; i++)
			{
				//make a reference to the current object
				var ob = getChildAt(i);
				//make a tween for the current object
				var tw:Tween = new Tween(ob, //onject to tween
										 "x", ///property to tween
										 Elastic.easeInOut, //easing function to use
										 ob.x+stage.stageWidth, //start value
										 ob.x, //end value
										 15+(i*5)); //time to take 
				//add the tween to the list of tweens
				tweens.push(tw);
									 
			}
		}
		private function tweenOut() 
		{ //yoyo the existing tweens
		  //loop through all on screen content
			for (var i=0; i<tweens.length; i++)
			{
				//yoyo the tweens 
				tweens[i].yoyo();
				//if this is the last tween
				if (i==tweens.length-1)
				{
					tweens[i].addEventListener(TweenEvent.MOTION_FINISH, tweenedOut);
				}
			}
		}
		
		private function tweenedOut(t:TweenEvent)
		{
			System.gc();
			gotoLabel(targetFrame);
			
		}
		
		
		
	}
	
}
