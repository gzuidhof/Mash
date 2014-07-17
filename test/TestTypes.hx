package ;

import ash.core.Node;

class TestNode extends Node<TestNode>
{
	var componentA: TestComponentA;
	var componentB: TestComponentB;
}

class TestComponentA 
{
	public function new(?a) { fieldA = a; }
	
	var fieldA: Int;
}

class TestComponentB 
{
	public function new(?a, ?b) { fieldA = a; fieldB = b; }
	
	var fieldA: String;
	var fieldB: Int;
}

class TestComponentC 
{
	public function new(?a, ?d) { referenceToA = a; referenceToD = d; }
	
	var referenceToA: TestComponentA;
	var referenceToD: TestComponentD;
}

class TestComponentD 
{
	public function new(?a, ?c) { fieldA = a; referenceToC = c; }
	
	var fieldA: String;
	var referenceToC: TestComponentC;
}
