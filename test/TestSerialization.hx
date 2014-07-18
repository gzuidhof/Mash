package ;

import ash.core.Entity;
import haxe.unit.TestCase;
import mash.core.MashScene;
import mash.serialization.SceneSerializer;
import TestTypes.TestComponentA;
import TestTypes.TestComponentB;


class TestSerialization extends TestCase
{

	/**
	 * Scene with components that only contain simple (mostly basic) types.
	 */
	private var simpleScene: MashScene;
	
	public override function setup()
	{
		simpleScene = new MashScene("Simple Serialization Test Scene");
		
		for (i in 0...10) //1 through 10
		{
			var entity = new Entity("Entity " + i);
			simpleScene.ash.addEntity(entity);
			var a : TestComponentA = new TestComponentA((i-1) * 10);
			entity.add(a);
		}
		
		simpleScene.ash.getEntityByName("Entity 3")
			.add(new TestComponentB("Some String On Entity 3"));
		
		simpleScene.ash.getEntityByName("Entity 7")
		.add(new TestComponentB("Some Other String On Entity 7"));
		
	}
	
	public function testSerializers() 
	{
		simpleSceneAssumptions(simpleScene);
	}
	
	private function serializerTest(serializer:SceneSerializer)
	{
		if (serializer == null) return;
		
		var file:String = serializer.serializeScene(simpleScene);
		var deserialized:MashScene = serializer.deSerializeScene(file);
		
		simpleSceneAssumptions(simpleScene);
	}
	
	private function simpleSceneAssumptions(scene : MashScene) : Void
	{
		assertEquals("Simple Serialization Test Scene",scene.name);
		assertEquals(10, Lambda.count(scene.ash.entities));
		
		assertTrue(scene.ash.getEntityByName("Entity 2").has(TestComponentA));
		assertTrue(scene.ash.getEntityByName("Entity 7").has(TestComponentB));
		assertFalse(scene.ash.getEntityByName("Entity 6").has(TestComponentB));
		assertEquals(5 * 10, scene.ash.getEntityByName("Entity 6").get(TestComponentA).fieldA);
		assertEquals("Some String On Entity 3", scene.ash.getEntityByName("Entity 3").get(TestComponentB).fieldA);
	}
	
	
}