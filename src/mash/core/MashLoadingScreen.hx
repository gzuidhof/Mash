package mash.core;

import kha.Image;
import kha.Game;
import kha.Loader;

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
	
	public function new(gameName:String, sceneToLoad:String) 
	{
		super(gameName, false);
	}
	
	override public function init(): Void 
	{
		Loader.the.loadRoom("mashloadingscreen", startLoader);
	}
	
	public function startLoader(): Void
	{
		this.logo = Loader.the.getImage("mashlogo");
		this.logoLight = Loader.the.getImage("mashlogo-light");
	}

	
	override public function render(painter: kha.Painter): Void 
	{
		startRender(painter);
		//Draw background
		painter.setColor(kha.Color.fromBytes(240, 240, 240));
		painter.fillRect(0, 0, width, height);
		
		if (logo != null)
		{
			//Draw logo backdrop
			painter.drawImage(logoLight, width / 2 - logoLight.width / 2, height / 2 - logoLight.height / 2);
			
			//Draw logo, transparancy doesn't seem to be working yet.
			painter.setColor(kha.Color.fromFloats(1.0, 1.0, 1.0, Loader.the.getLoadPercentage()/100));
			painter.drawImage(logo, width / 2 - logo.width/2, height / 2 - logo.height/2);
		}
		
		//Draw loading bar
		painter.setColor(kha.Color.fromBytes(255, 255, 255, 255));
		painter.fillRect(0, height / 2 + 80 , Loader.the.getLoadPercentage() * width / 100, 20);
		
		endRender(painter);
	}
	
}