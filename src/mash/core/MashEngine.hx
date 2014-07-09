package mash.core;

import ash.core.Engine;
import haxe.Int64;
import kha.Game;
import kha.Painter;
import kha.Color;
import kha.Sys;

class MashEngine extends Game
{
	
	public var mashScene : MashScene;
	public var ash : Engine;
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
	
	
	public function new() 
	{
		super("Mash", false);
		mashScene = new MashScene(this, "BaseScene");
		ash = mashScene.ash;
		
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