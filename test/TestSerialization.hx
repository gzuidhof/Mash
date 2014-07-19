package ;

import ash.core.Entity;
import haxe.unit.TestCase;
import mash.core.MashScene;
import mash.serialization.HaxeStdSceneSerializer;
import mash.serialization.SceneSerializer;
import TestTypes.TestComponentA;
import TestTypes.TestComponentB;
import TestTypes.TestComponentC;
import TestTypes.TestComponentD;


class TestSerialization extends TestCase
{

	
	/**
	 * Scene without any entities.
	 */
	private var emptyScene: MashScene;
	/**
	 * Scene with components that only contain simple (mostly basic) types.
	 */
	private var simpleScene: MashScene;
	/**
	 * Scene with components that also contain (circular!) references.
	 */
	private var complexScene: MashScene;
	
	public override function setup()
	{
		emptyScene = new MashScene("Empty Serialization Test Scene");
		simpleScene = new MashScene("Simple Serialization Test Scene");
		complexScene = new MashScene("Complex Serialization Test Scene");
		
		initializeSimpleScene();
		initializeComplexScene();
	}
	
	
	
	
	public function testSerializers() 
	{
		//Test Empty Scene assertions before any serialization
		emptySceneAssertions(emptyScene);
		
		//Test Simple Scene assertions before any serialization
		simpleSceneAssertions(simpleScene);
		
		//Test Complex Scene assertions before any serialization
		complexSceneAssertions(complexScene);
		
		//Test the HaxeStd Serializer
		serializerTest(new HaxeStdSceneSerializer());
	}
	
	private function serializerTest(serializer:SceneSerializer)
	{
		if (serializer == null) return;
		
		trace ("Testing Empty Scene Serialization");

		//Test empty scene
		var fileEmpty:String = serializer.serializeScene(emptyScene);
		var deserializedEmpty:MashScene = serializer.deSerializeScene(fileEmpty);
		emptySceneAssertions(deserializedEmpty);
		
		trace("Testing Simple Scene Serialization");
		
		//Test simple scene
		var fileSimple:String = serializer.serializeScene(simpleScene);
		var deserializedSimple:MashScene = serializer.deSerializeScene(fileSimple);
		simpleSceneAssertions(simpleScene);
		
		trace("Testing Complex Scene Serialization");
		
		//Test complex scene
		var fileComplex:String = serializer.serializeScene(complexScene);
		var deserializedComplex:MashScene = serializer.deSerializeScene(fileComplex);
		complexSceneAssertions(deserializedComplex);
	}
	
	
	private function emptySceneAssertions(scene : MashScene) : Void
	{
		assertEquals("Empty Serialization Test Scene",scene.name);
		assertEquals(0, Lambda.count(scene.ash.entities));
	}
	
	function initializeSimpleScene():Void 
	{
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
	
	private function simpleSceneAssertions(scene : MashScene) : Void
	{
		assertEquals("Simple Serialization Test Scene",scene.name);
		assertEquals(10, Lambda.count(scene.ash.entities));
		
		assertTrue(scene.ash.getEntityByName("Entity 2").has(TestComponentA));
		assertTrue(scene.ash.getEntityByName("Entity 7").has(TestComponentB));
		assertFalse(scene.ash.getEntityByName("Entity 6").has(TestComponentB));
		assertEquals(5 * 10, scene.ash.getEntityByName("Entity 6").get(TestComponentA).fieldA);
		assertEquals("Some String On Entity 3", scene.ash.getEntityByName("Entity 3").get(TestComponentB).fieldA);
	}
	
	function initializeComplexScene():Void 
	{
		for (i in 0...10) //1 through 10
		{
			var entity = new Entity("Entity " + i);
			complexScene.ash.addEntity(entity);
			var a : TestComponentA = new TestComponentA((i-1) * 10);
			entity.add(a);
		}
		
		var entity1 = complexScene.ash.getEntityByName("Entity 1");
		var entity2 = complexScene.ash.getEntityByName("Entity 2");
		var entity3 = complexScene.ash.getEntityByName("Entity 3");
		var entity4 = complexScene.ash.getEntityByName("Entity 4");
		
		
		//Nullpointer
		entity1.add(new TestComponentD("Some String On Entity 1", null));
		
		//Single direction reference
		
		entity4.add(new TestComponentC(entity1.get(TestComponentA), null));
		
		//Circular reference
		entity2.add(new TestComponentD("Bla", null));	
		
		entity3.add(new TestComponentC(entity4.get(TestComponentA), entity2.get(TestComponentD)));
		entity2.get(TestComponentD).referenceToC = entity3.get(TestComponentC);
		
	}	
	
	private function complexSceneAssertions(scene : MashScene) : Void
	{
		assertEquals("Complex Serialization Test Scene",scene.name);
		assertEquals(10, Lambda.count(scene.ash.entities));
		
		var entity1 = scene.ash.getEntityByName("Entity 1");
		var entity2 = scene.ash.getEntityByName("Entity 2");
		var entity3 = scene.ash.getEntityByName("Entity 3");
		var entity4 = scene.ash.getEntityByName("Entity 4");
		
		//Nullpointer
		assertEquals(null, entity1.get(TestComponentD).referenceToC);
		
		//Single direction reference
		assertEquals(entity1.get(TestComponentA), entity4.get(TestComponentC).referenceToA);
		
		//Circular reference
		assertEquals(entity3.get(TestComponentC).referenceToD.referenceToC, entity3.get(TestComponentC));
		assertEquals(entity2.get(TestComponentD).referenceToC.referenceToD.referenceToC, entity3.get(TestComponentC));
		
	}


	
}