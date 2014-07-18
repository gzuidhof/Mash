package ;

import ash.core.Entity;
import haxe.unit.TestCase;
import mash.core.MashScene;
import mash.serialization.HaxeStdSerializer;
import mash.serialization.SceneSerializer;
import TestTypes.TestComponentA;
import TestTypes.TestComponentB;


class TestSerialization extends TestCase
{

	/**
	 * Scene with components that only contain simple (mostly basic) types.
	 */
	private var simpleScene: MashScene;
	private var emptyScene : MashScene;
	
	public override function setup()
	{
		simpleScene = new MashScene("Simple Serialization Test Scene");
		emptyScene = new MashScene("Empty Serialization Test Scene");
		
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
		//Test Empty Scene assumptions before any serialization
		emptySceneAssumptions(emptyScene);
		
		//Test Simple Scene assumptions before any serialization
		simpleSceneAssumptions(simpleScene);
		
		//Test the HaxeStd Serializer
		serializerTest(new HaxeStdSerializer());
	}
	
	private function serializerTest(serializer:SceneSerializer)
	{
		if (serializer == null) return;
		
		trace ("Testing empty scene");
		
		//Test empty scene
		var fileEmpty:String = serializer.serializeScene(emptyScene);
		var deserializedEmpty:MashScene = serializer.deSerializeScene(fileEmpty);
		emptySceneAssumptions(deserializedEmpty);
		
		trace("Testing simple scene");
		
		//Test simple scene
		var fileSimple:String = serializer.serializeScene(simpleScene);
		var deserializedSimple:MashScene = serializer.deSerializeScene(fileSimple);
		simpleSceneAssumptions(simpleScene);
	}
	
	
	private function emptySceneAssumptions(scene : MashScene) : Void
	{
		assertEquals("Empty Serialization Test Scene",scene.name);
		assertEquals(0, Lambda.count(scene.ash.entities));
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