package ;

import ash.core.Entity;
import haxe.unit.TestCase;
import mash.core.MashScene;
import mash.serialization.SceneSerializer;


class TestSerialization extends TestCase
{

	private var scene: MashScene;
	
	public override function setup()
	{
		scene = new MashScene("SerializationTestScene");
		
		for (i in 0...9)
		{
			var entity = new Entity("Entity $i");
			scene.ash.addEntity(entity);
			var a : TestComponentA = new TestComponentA();
			
			
		}
		
		
	}
	
	public function new() 
	{
		super();
		
	}
	
	private function testSceneSerializer(serializer:SceneSerlializer)
	{
		
	}
	
}