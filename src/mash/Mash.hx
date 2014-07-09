package mash;

import mash.core.MashEngine;
import kha.Starter;

class Mash {
	public function new() {
		var starter = new Starter();
		starter.start(new MashEngine());
	}
}
