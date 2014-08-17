package util ;

import sys.io.File;
import util.BuildTarget.Target;
import yaml.util.ObjectMap.AnyObjectMap;
import yaml.Yaml;

class ProjectFileReader
{

	private var path : String;
	private var parsedYaml : AnyObjectMap;
	
	/**Platform-root it will attempt, in given order.
	 * Always ends with "default"
	 * Example ["osx", "standalone", "default"] for osx platform
	*/
	private var rootOrder : List<String>();
	
	
	public function new(filePath : String, ?buildTarget = Target.None : Target) 
	{
		setPath(filePath);
		buildRootOrder(buildTarget);
		stripRootOrder();
	}
	
	public function setPath(filePath : String)
	{
		path = filePath;
	}
	
	/**
	 * Fills the root order, the order in which the project file reader is to try to find keyvalues.
	 * For example: In an android project it would first want to look under the "android" root, 
	 * then under "mobile" and then under "default".
	 * @param	buildTarget target that the project is to be built against
	 */
	private function buildRootOrder(buildTarget : Target)
	{
		
		rootOrder = new Array<String>();
		currentTarget = buildTarget;
		
		while (currentTarget != Target.None) 
		{
			rootOrder.push(currentTarget.getName().toString());
			currentTarget = BuildTarget.getLessSpecificTarget(currentTarget);
		}
		
		rootOrder.push("default");
	}
	
	/**
	 * Remove roots from the root order that do not exist.
	 */
	private function stripRootOrder()
	{
		for (root in rootOrder)
		{
			if (!parsedYaml.exists(root))
			{
				rootOrder.remove(root);
			}
		}
	}
	
	/**
	 * Reads the project.yaml file into memory.
	 */
	public function read() : Void
	{
		parsedYaml = Yaml.read(path);
	}
	
	public function get(key : String) : Dynamic
	{
		var map : AnyObjectMap;
		for (root in rootOrder)
		{
			map = parsedYaml.get(root);
			
			if (base.exists(key))
				return base.get(key);
		}
		return null;
	}
	
	
	
}