package mash;

import ash.core.Engine;
import ash.core.Entity;
import haxe.Int64;
import kha.Framebuffer;
import kha.Image;
import kha.Game;
import kha.Color;
import kha.Sys;
import kha.Loader;
import mash.component.ImageDisplay;
import mash.component.Position;
import mash.system.ImageRenderSystem;

class MashEngine extends Game
{
	
	public var mashScene : MashScene;
	public var backbuffer: Image;
	public var graphics2: kha.graphics2.Graphics;
	
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
		super(Loader.the.name, false);
		
		mashScene = new MashScene("_newScene");
	}	
	
	
	override public function init(): Void 
	{ 
		backbuffer = Image.createRenderTarget(width, height);
		graphics2 = backbuffer.g2;
		lastFrameTime = timeSinceStart = Sys.getTime();
		initialized = true;
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
	
	
	override public function render(frame: kha.Framebuffer): Void
	{
		if (!initialized) return;
		
		deltaTime = Sys.getTime() - lastFrameTime;
		lastFrameTime = Sys.getTime();
		
		graphics2.begin();
		mashScene.update(deltaTime);
		graphics2.end();
		
		startRender(frame);
		kha.Scaler.scale(backbuffer, frame, kha.Sys.screenRotation);
		endRender(frame);
		
	}
}