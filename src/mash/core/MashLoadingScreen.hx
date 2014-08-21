package mash.core;

import kha.Image;
import kha.Game;
import kha.Loader;
import mash.serialization.scene.HaxeStdSceneSerializer;

/**
 * Default loading screen for a Mash game.
 * @author Guido
 */
class MashLoadingScreen extends Game
{
	private var gameName: String;
	private var sceneToLoad: String;
	
	private var logo: Image;
	private var logoLight: Image;
	
	public function new(sceneToLoad:String) 
	{
		super(Loader.the.name, false);
	}
	
	override public function init(): Void 
	{
		Loader.the.loadRoom("mashloadingscreen", onLogoLoaded);
		//Do actual loading.
		Loader.the.loadRoom(sceneToLoad, loadMashEngine);
	}

	private function onLogoLoaded()
	{
		this.logo = Loader.the.getImage("mashlogo");
		this.logoLight = Loader.the.getImage("mashlogo-light");
	}
	
	private function loadMashEngine(): Void
	{
		var scene = loadECSScene();
		startEngine(scene);
	}
	
	private function loadECSScene(): MashScene
	{
		
		if (Loader.the.isBlobAvailable(sceneToLoad + ".hxscene"))
		{
			var text = Loader.the.getBlob(sceneToLoad + ".hxscene").toString();
			var sceneSerializer = new HaxeStdSceneSerializer();
			return sceneSerializer.deSerializeScene(text);
		}
		
		return null;
	}
	
	private function startEngine(scene : MashScene)
	{
		new MashEngine(scene);
	}
	
	override public function render(painter: kha.Painter): Void 
	{
		startRender(painter);
		
		//Draw background
		painter.setColor(kha.Color.fromBytes(240, 240, 240));
		painter.fillRect(0, 0, width, height);
		
		if (logo != null)
		{
			renderLogo(painter);
		}
		
		drawLoadingBar(painter);
	
		endRender(painter);
	}
	
	private function renderLogo(painter: kha.Painter):Void 
	{
		//Draw logo backdrop
		painter.drawImage(logoLight, width / 2 - logoLight.width / 2, height / 2 - logoLight.height / 2);
		
		//Draw logo, transparancy doesn't seem to be working yet.
		painter.setColor(kha.Color.fromFloats(1.0, 1.0, 1.0, Loader.the.getLoadPercentage()/100));
		painter.drawImage(logo, width / 2 - logo.width/2, height / 2 - logo.height/2);
	}
	
	private function drawLoadingBar(painter: kha.Painter):Void 
	{
		painter.setColor(kha.Color.fromBytes(255, 255, 255, 255));
		painter.fillRect(0, height / 2 + 80 , Loader.the.getLoadPercentage() * width / 100, 20);
	}
	
	
	
}