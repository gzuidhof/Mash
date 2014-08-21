package mash;

import mash.core.MashEngine;
import mash.core.MashLoadingScreen;

class Mash {
	public function new() {
		var starter = new kha.Starter();
		//starter.start(new MashEngine());
		starter.start(new MashLoadingScreen("scene1"));
	}
}

