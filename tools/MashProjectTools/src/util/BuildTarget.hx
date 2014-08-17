package util;
import util.BuildTarget.Target;

/**
 * @author Guido
 */

enum Target
{
	//standalone
	Windows;
	Linux;
	OSX;
	
	//mobile
	iOS; 
	Android;
	Dalvik;
	WindowsRT;
	
	//webbish
	HTML5;
	Flash;
	
	Java;
	XNA;
	PSM;
	
	//non-targets, they group some targets above
	Standalone;
	Mobile;
	None;
}

class BuildTarget 
{
	public static function getLessSpecificTarget(value:Target)
	{
		//TODO: Find a cleaner way to represent this in code.
		if (value == Target.windows || value == Target.linux || value == Target.osx)
			return Target.standalone;
		
		else if (value == Target.iOS || value == Target.Android || value == Target.Dalvik || value == Target.WindowsRT)
			return Target.Mobile;
		
		return Target.None;
	}
}
