package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import GenericToggleButton;
	
	class mutebutton extends GenericToggleButton
{
    public function mutebutton()
    {
        super();
    }

    override protected function toggleClick(event:MouseEvent):void
    { 
        super.toggleClick(event);

        // do magic for this button
    }

    // ETC
}
	
}
