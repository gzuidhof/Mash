package mash.core;

import ash.core.Engine;
import ash.core.System;


/**
 * Extend this class for your systems. 
 * Systems are where the logic of your application is, it acts on nodes which contain certain components.
 */
@:keepSub
class MashSystem extends System 
{
	
	public var mashEngine : MashEngine;
	public var ecs : Engine;
	public var scene : MashScene;
	

	public function new(?mash:MashEngine) 
	{
		this.mashEngine = mash;
		
		if ( mash != null) 
		{
			this.scene = mash.mashScene;
			this.ecs = scene.ecs;
		}
		
		init();
		super();
	}
	
	public function init()
	{
		
	}
	
	override public function update(time: Float) 
	{
		
	}
	
	
}