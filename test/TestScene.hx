package;
import ash.core.Entity;
import ash.core.Node;
import haxe.unit.TestCase;
import mash.core.MashScene;
import mash.core.MashSystem;
import TestTypes.TestComponentA;
import TestTypes.TestComponentB;
import TestTypes.TestNode;

class TestScene extends TestCase
{
	
	var scene: MashScene;
	
	public override function setup()
	{
		scene = new MashScene("TestScene");
	}

	public function testScene()
	{
		//Scene creates ash engine
		assertFalse(scene.ash == null);
		
		//Scene starts without any entities or systems
		assertTrue(Lambda.empty(scene.ash.entities));
		assertTrue(Lambda.empty(scene.ash.systems));
		
		//Test adding of entity
		var tEntity1: Entity = new Entity("TestEntity1");
		scene.ash.addEntity(tEntity1);
		assertEquals(1, Lambda.count(scene.ash.entities));
		
		
		//Test of adding another entity
		var tEntity2: Entity = new Entity("TestEntity2");
		scene.ash.addEntity(tEntity2);
		assertEquals(2, Lambda.count(scene.ash.entities));
		
		//Test removing an entity
		scene.ash.removeEntity(tEntity1);
		assertEquals(1, Lambda.count(scene.ash.entities));
		
		//Test removing all entities
		scene.ash.removeAllEntities();
		assertTrue(Lambda.empty(scene.ash.entities));
	}
	
	public function testEntityComponentOperations()
	{
		var tEntity1: Entity = new Entity("TestEntity1");
		
		//Entity starts without components
		assertEquals(0, componentCount(tEntity1));
		
		//Test adding component
		var component: TestComponentA = new TestComponentA();
		
		tEntity1.add(component);
		assertEquals(1, componentCount(tEntity1));
		
		//Test component retrieval
		assertFalse(tEntity1.has(TestComponentB));
		assertTrue(tEntity1.has(TestComponentA));
		
		//Test component removal
		tEntity1.remove(TestComponentA);
		assertEquals(0, componentCount(tEntity1));
		assertFalse(tEntity1.has(TestComponentA));
		
		
	}
	
	public function testNodeCreation()
	{
		var tEntity1: Entity = new Entity("TestEntity1");
		scene.ash.addEntity(tEntity1);
		
		//Nodelist starts empty
		assertTrue(Lambda.empty(scene.ash.getNodeList(TestNode)));
		
		var componentA: TestComponentA = new TestComponentA();
		var componentB: TestComponentB = new TestComponentB();
		
		//Test Node Creation
		tEntity1.add(componentA);
		assertTrue(Lambda.empty(scene.ash.getNodeList(TestNode)));
		tEntity1.add(componentB);
		assertEquals(1, Lambda.count(scene.ash.getNodeList(TestNode)));
		
		//Test Node Removal
		tEntity1.remove(TestComponentA);
		assertTrue(Lambda.empty(scene.ash.getNodeList(TestNode)));
	}
	
	
	static function componentCount(entity: Entity): Int
	{
		var count: Int = 0;
		for (c in entity.getAll())
		{
			count++;
		}

		return count;
	}
	
	
	
}