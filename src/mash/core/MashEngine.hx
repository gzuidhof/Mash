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
		super(Loader.the.name, false);
		
		mashScene = new MashScene("_newScene");
	}	
	
	
	override public function init(): Void 
	{ 
		lastFrameTime = timeSinceStart = Sys.getTime();
	}
	
	override public function update(): Void 
	{
		
	}
	
	public function loadScene(sceneName: String, callback: Void->Void) 
	{
		Loader.the.loadRoom(sceneName, callback);
	}
	
	public function startScene(sceneName: String)
	{
		if (Loader.the.isBlobAvailable(sceneName + ".hxscene"))
		{
			var text = Loader.the.getBlob(sceneName + ".hxscene").toString();
			var sceneSerializer = new mash.serialization.scene.HaxeStdSceneSerializer();
			mashScene = sceneSerializer.deSerializeScene(text);
		}
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