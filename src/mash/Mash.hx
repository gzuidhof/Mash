package mash;

import kha.Game;
import kha.Painter;
import kha.Color;

class Mash extends Game {
	public function new() {
		super("Mash", false);
		
		
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
