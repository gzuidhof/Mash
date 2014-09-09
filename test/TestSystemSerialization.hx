package ;

import haxe.unit.TestCase;
import mash.MashScene;
import mash.serialization.system.SystemSerializer;
import mash.serialization.system.YamlSystemSerializer;
import TestTypes.TestSystemA;
import TestTypes.TestSystemB;
import TestTypes.TestSystemC;

/**
 * ...
 * @author Guido
 */
class TestSystemSerialization extends TestCase
{

	var testScene: MashScene;
	
	public override function setup()
	{
		//First create the scene, with some systems, to be serialized.
		testScene = new MashScene("TestScene");
		testScene.ecs.addSystem(new TestSystemA(), 1);
		testScene.ecs.addSystem(new TestSystemB(), 0);
		
	}
	
	public function testSystemSerialization() 
	{
		//See if the assertions hold before serialization/deserialization
		sceneAssertions(testScene);
		
		var serializer:SystemSerializer = new YamlSystemSerializer();
		var output = serializer.serializeSystems(testScene);
		
		var newScene = new MashScene("New Scene");
		serializer.deSerializeSystems(output, newScene);
		
		//See if the assertions hold after serialization/deserialization
		sceneAssertions(newScene);
		
	}
	
	public function sceneAssertions(scene: MashScene)
	{
		assertEquals(2, Lambda.count(scene.ecs.systems));
		
		assertFalse(scene.ecs.getSystem(TestSystemA) == null);
		assertFalse(scene.ecs.getSystem(TestSystemB) == null);
		assertTrue(scene.ecs.getSystem(TestSystemC) == null);
		
		assertEquals(1, scene.ecs.getSystem(TestSystemA).priority);
		assertEquals(0, scene.ecs.getSystem(TestSystemB).priority);
	}
	
	
	
	
	
	
	
	
}