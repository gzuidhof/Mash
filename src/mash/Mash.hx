package mash;

import mash.core.MashEngine;

class Mash {
	public function new() {
		var starter = new kha.Starter();
		starter.start(new MashEngine());
	}
}

