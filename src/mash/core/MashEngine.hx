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
		mashScene = new MashScene("BaseScene");
		ash = mashScene.ash;
		
		//Loader.the.loadRoom("level", init);
		//trace("asdf");
		//Loader.the.loadImage("lambda", null);
		//Loader.the.loadProject(init);
		
		
		
		
		
		
		
	}
	
	
	override public function init(): Void 
	{ 
		Loader.the.loadRoom("level", levelLoaded);
	}
	
	private function levelLoaded(): Void 
	{
		lastFrameTime = timeSinceStart = Sys.getTime();
		
		ash.addSystem(new ImageRenderSystem(this), 0);
		var ent: Entity = new Entity("Test Lambda");
		ent.add(new Position(5, 0));
		ent.add(new ImageDisplay("lambda"));
		ash.addEntity(ent);
		
		for (s in Loader.the.getAvailableImages())
			trace(s);
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