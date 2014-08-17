package util ;

import sys.io.File;
import util.BuildTarget.Target;
import yaml.util.ObjectMap.AnyObjectMap;
import yaml.Yaml;

class ProjectFileReader
{

	private var path : String;
	private var parsedYaml : AnyObjectMap;
	private var buildTarget : Target;
	
	/**Platform-root it will attempt, in given order.
	 * Always ends with "default"
	 * Example ["osx", "standalone", "default"] for osx platform
	*/
	private var rootOrder : List<String>;
	
	
	public function new(filePath : String, ?buildTarget = null) 
	{
		if (buildTarget == null) buildTarget = Target.None;
		this.buildTarget = buildTarget;

		setPath(filePath);
	}
	
	/**
	 * Reads the project.yaml file into memory.
	 */
	public function read() : Void
	{
		parsedYaml = Yaml.read(path);
		buildRootOrder(buildTarget);
		stripRootOrder();
	}

	/**
	 * Fills the root order, the order in which the project file reader is to try to find keyvalues.
	 * For example: In an android project it would first want to look under the "android" root, 
	 * then under "mobile" and then under "default".
	 * @param	buildTarget target that the project is to be built against
	 */
	private function buildRootOrder(buildTarget : Target)
	{
		
		rootOrder = new List<String>();
		var currentTarget = buildTarget;
		
		while (currentTarget != Target.None) 
		{
			rootOrder.add(currentTarget.getName().toString().toLowerCase());
			currentTarget = BuildTarget.getLessSpecificTarget(currentTarget);
		}
		
		rootOrder.add("default");
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

		trace(rootOrder.toString());
	}
	
	public function get(key : String) : Dynamic
	{
		var map : AnyObjectMap;
		for (root in rootOrder)
		{
			map = parsedYaml.get(root);
			
			if (map.exists(key))
				return map.get(key);
		}
		return null;
	}
	
	public function setPath(filePath : String)
	{
		path = filePath;
	}

	public function setBuildTarget(target : Target)
	{
		buildTarget = target;
	}	
	
	
}