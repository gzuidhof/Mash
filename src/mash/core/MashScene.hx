package mash.core;

import ash.core.Engine;
import ash.core.Entity;

/**
* @author 
 */
class MashScene
{
	
	public var ash : Engine;
	public var name : String;
	
	public function new(name : String)
	{
		this.ash = new Engine();
		this.name = name;
	}
	
	
	public function update(deltaTime : Float) 
	{
		ash.update(deltaTime);
	}	
	
}