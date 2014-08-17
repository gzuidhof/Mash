package projectgenerator ;
import util.Util;
import yaml.Yaml;


/**
 * ...
 * @author Guido
 */
class ProjectGenerator
{
	
	public function new() 
	{
		var proj = {project : { name : "MashGame", width : 800, height : 600}};
		var s = Yaml.render(proj);
		
		Util.print(s);
	}
	
	
	
}