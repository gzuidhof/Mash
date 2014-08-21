package mash.core;

import ash.core.Engine;
import ash.core.Entity;
import haxe.Int64;
import kha.Game;
import kha.Painter;
import kha.Color;
import kha.Sys;
import kha.Loader;
import mash.component.ImageDisplay;
import mash.component.Position;
import mash.system.ImageRenderSystem;

class MashEngine extends Game
{
	
	public var mashScene : MashScene;
	public var ecs : Engine;
	public var painter : Painter;
	
	/**
	 * Time (in seconds) since start of application.
	 */
	public var timeSinceStart : Float;
	public var lastFrameTime : Float;
	
	/**
	 * Time (in seconds) since last frame.
	 */
	public var deltaTime : Float;
	
	/**
	 * Frames since start of the application.
	 */
	public var frameCount : Int = 0;
	
	public function new(?scene : MashScene) 
	{
		super(Loader.the.name, false);
		
		if (scene == null)
		{
			mashScene = new MashScene("_newScene");
		}
		else
		{
			mashScene = scene;
		}
		
		ecs = mashScene.ecs;
	}	
	
	
	override public function init(): Void 
	{ 
		lastFrameTime = timeSinceStart = Sys.getTime();
	}
	
	override public function update(): Void 
	{
		
	}
	
	override public function render(painter: Painter): Void
	{
		this.painter = painter;
		
		deltaTime = Sys.getTime() - lastFrameTime;
		lastFrameTime = Sys.getTime();
		
		startRender(painter);
		mashScene.update(deltaTime);
		endRender(painter);
		
		frameCount++;
	}
}