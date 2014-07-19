package mash.serialization.system;
import mash.core.MashScene;

/**
 * ...
 * @author Guido
 */
class YamlSystemSerializer implements SystemSerializer
{

	public function new() 
	{
		
	}
	
	/* INTERFACE mash.serialization.system.SystemSerializer */
	
	public function serializeSystems(scene:MashScene):String 
	{
		return "";
	}
	
	public function deSerializeSystems(text:String, scene:MashScene):Void 
	{
		
	}
	
}