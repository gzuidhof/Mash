package mash.core;

import ash.core.Engine;

/**
* @author 
 */
class MashScene
{
	
	public var ash : Engine;
	public var mash : MashEngine;
	public var name : String;
	
	public function new(mash : MashEngine, name : String) {
		this.ash = new Engine();
		this.mash = mash;
		this.name = name;
	}
	
	
	public function update(deltaTime : float) {
		ash.update(deltaTime);
	}	
	
	
}