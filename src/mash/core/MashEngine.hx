package mash.core;

import ash.core.Engine;

class MashEngine
{

	public var scene : MashScene;
	public var ash : Engine;

	
	public function new() 
	{
		scene = new MashScene(this, "BaseScene");
		ash = scene.ash;
	}
	
	public function begin() {
	}
	
	
	private function added(e) {

		
	}
	
	
	
	
}