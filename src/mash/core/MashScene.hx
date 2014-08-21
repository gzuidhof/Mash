package mash.core;

import ash.core.Engine;
import ash.core.Entity;

/**
* @author 
 */
class MashScene
{
	
	public var ecs : Engine;
	public var name : String;
	
	public function new(name : String)
	{
		this.ecs = new Engine();
		this.name = name;
	}
	
	
	public function update(deltaTime : Float) 
	{
		ecs.update(deltaTime);
	}	
	
}