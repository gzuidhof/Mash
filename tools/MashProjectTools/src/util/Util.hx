package util;

/**
 * ...
 * @author Guido
 */
class Util
{

	public function new() {}
	
	public static inline function print(value)
	{
		#if sys
			Sys.print(value);
		#end
	}
	
	public static inline function println(value)
	{
		#if sys
			Sys.println(value);
		#end
	}	
	
	
	
	
	
	
}