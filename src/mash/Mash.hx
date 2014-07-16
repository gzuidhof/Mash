package mash;

import kha.Game;
import mash.core.MashEngine;
import kha.Starter;
import kha.Loader;

class Mash {
	public function new() {
		var starter = new Starter();
		
		//starter.start(new TestGame());
		starter.start(new MashEngine());
		
		
	}
}

