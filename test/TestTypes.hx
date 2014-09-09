package ;

import ash.core.Node;
import mash.MashScene;
import mash.MashSystem;

class TestNode extends Node<TestNode>
{
	var componentA: TestComponentA;
	var componentB: TestComponentB;
}

class TestComponentA 
{
	public function new(?a) { fieldA = a; }
	
	public var fieldA: Int;
}

class TestComponentB 
{
	public function new(?a, ?b) { fieldA = a; fieldB = b; }
	
	public var fieldA: String;
	public var fieldB: Int;
}

class TestComponentC 
{
	public function new(a, d) { referenceToA = a; referenceToD = d; }
	
	public var referenceToA: TestComponentA;
	public var referenceToD: TestComponentD;
}

class TestComponentD 
{
	public function new(a, c) { fieldA = a; referenceToC = c; }
	
	public var fieldA: String;
	
	public var referenceToC: TestComponentC;
}

class TestSystemA extends MashSystem
{
	public function new() 
	{
		super(null);
	}
}

class TestSystemB extends MashSystem
{
	public function new() 
	{
		super(null);
	}
}

class TestSystemC extends MashSystem
{
	public function new() 
	{
		super(null);
	}
}

