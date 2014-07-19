package ;

import haxe.unit.TestCase;
import mash.core.MashScene;
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
		testScene = new MashScene("TestScene");
		testScene.ash.addSystem(new TestSystemA(), 1);
		testScene.ash.addSystem(new TestSystemB(), 0);
		
	}
	
	public function testSystemSerialization() 
	{
		sceneAssertions(testScene);
	}
	
	public function sceneAssertions(scene: MashScene)
	{
		assertEquals(2, Lambda.count(scene.ash.systems));
		
		assertFalse(scene.ash.getSystem(TestSystemA) == null);
		assertFalse(scene.ash.getSystem(TestSystemB) == null);
		assertTrue(scene.ash.getSystem(TestSystemC) == null);
		
		assertEquals(1, scene.ash.getSystem(TestSystemA).priority);
		assertEquals(0, scene.ash.getSystem(TestSystemB).priority);
	}
	
	
	
	
	
	
	
	
}