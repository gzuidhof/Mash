package mash;

import ash.core.Engine;
import ash.core.Entity;

class MashEngine extends luxe.Game
{
	
	public var mashScene : MashScene;
	
	/**
	 * Frames since start of the application.
	 */
	public var frameCount : Int = 0;
	
	override function ready()
	{
		mashScene = new MashScene("_newScene");
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
	
	
	override public function update(dt: Float): Void
	{
		frameCount++;
		mashScene.update(dt);
		
	}
}