package mash.core;

import ash.core.Engine;
import kha.Game;
import kha.Painter;
import kha.Color;

class MashEngine extends Game
{
	
	public var mashScene : MashScene;
	public var ash : Engine;

	
	public function new() 
	{
		super("Mash", false);
		mashScene = new MashScene(this, "BaseScene");
		ash = mashScene.ash;
	}
	
	public function begin() {
		
	}
	
	
	private function added(e) {
		
	}
	
	override public function update() : Void {
		
	}
	
	override public function render(painter: Painter): Void {
		startRender(painter);
		
		painter.setColor(Color.fromBytes(255, 255, 0));
		painter.fillRect(0, 0, width, height);
		
		endRender(painter);
	}
	
	
	
	
	
}