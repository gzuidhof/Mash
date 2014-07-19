package mash.serialization.system;
import ash.core.System;
import mash.core.MashScene;
import yaml.util.ObjectMap;
import yaml.Yaml;

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
		var array= Lambda.array(Lambda.map(scene.ash.systems, function(s) { return { name : Type.getClassName(Type.getClass(s)), priority : s.priority }; }));
		
		var output = Yaml.render( { systems: array } );
		
				//trace(output);
		/*
		systems:
          - name: TestSystemB
            priority: 0
          - name: TestSystemA
            priority: 1
		
		*/
		
		return output;
		
	}
	
	public function deSerializeSystems(text:String, scene:MashScene):Void 
	{
		//TODO handle exceptions in parsing / systems no longer existing.
		var obj = Yaml.parse(text);
		var objMap = cast(obj, AnyObjectMap);
		
		var array : Array<AnyObjectMap> = objMap.get("systems");
		
		for (entry in array)
		{
			var sys : System = cast(Type.createEmptyInstance(Type.resolveClass(entry.get("name"))), System);
			scene.ash.addSystem(sys, entry.get("priority"));
		}
		
	}
	
}