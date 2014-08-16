package ;

import neko.Lib;
import haxe.macro.Context;
import util.Util;

/**
 * ...
 * @author Guido
 */

class MashProjectTools extends mcli.CommandLine
{
	
	static function main() 
	{
		Util.println("Mash Project Tools\n------------------");
		new ProjectGenerator();
	}
	
	
	macro public static function getBuildDate()
	{
		return Context.makeExpr(Date.now().toString(), Context.currentPos());
	}
}