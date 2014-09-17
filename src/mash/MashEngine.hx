package mash;

import ash.core.Engine;
import ash.core.Entity;
import haxe.Int64;
import haxe.Timer;
import mash.component.ImageDisplay;
import mash.component.Position;
import mash.system.ImageRenderSystem;

class MashEngine
{
	
	public var mashScene : MashScene;
	
	private var initialized = false;
	
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
		mashScene = new MashScene("_newScene");
	}	
	
	public function init(): Void 
	{ 
		lastFrameTime = timeSinceStart = getTime();
		initialized = true;
	}
	
	public function loadScene(sceneName: String, callback: Void->Void) 
	{
		//Loader.the.loadRoom(sceneName, callback);
	}
	
	public function startScene(sceneName: String)
	{
	/*
		if (Loader.the.isBlobAvailable(sceneName + ".hxscene"))
		{
			var text = Loader.the.getBlob(sceneName + ".hxscene").toString();
			var sceneSerializer = new mash.serialization.scene.HaxeStdSceneSerializer();
			mashScene = sceneSerializer.deSerializeScene(text);
		}
	*/
	}
	
	
	public function update(): Void
	{
		if (!initialized) return;
		
		deltaTime = getTime() - lastFrameTime;
		lastFrameTime = getTime();
		
		mashScene.update(deltaTime);
		
	}
	
	public static function getTime(): Float {
		return Timer.stamp();
		//return flash.Lib.getTimer() / 1000.0;
	}
}