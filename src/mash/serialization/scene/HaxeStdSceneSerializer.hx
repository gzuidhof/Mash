package mash.serialization.scene;
import haxe.Serializer;
import haxe.Unserializer;
import mash.core.MashScene;
import ash.core.Entity;

/**
 * ...
 * @author Guido
 */
class HaxeStdSceneSerializer implements SceneSerializer
{
	
	public function new() 
	{

	}
	
	/* INTERFACE mash.serialization.SceneSerializer */
	
	public function serializeScene(scene:MashScene):String 
	{
		var serializer: Serializer = new Serializer();
		serializer.useCache = true;
		
		//"Serializing scene name"
		serializer.serialize(scene.name);
		
		//Serializing scene entities
		var entitySaveArray : Array<Dynamic> = new Array<Dynamic>();
		
		for (e in scene.ash.entities)
		{
			entitySaveArray.push( { name : e.name, components: Lambda.array(e.components) } );
		}
		
		serializer.serialize(entitySaveArray);
		return serializer.toString();
		 
	}
	
	public function deSerializeScene(text:String):MashScene 
	{
		var unserializer : Unserializer = new Unserializer(text);
		
		var name:String = unserializer.unserialize();
		var scene:MashScene = new MashScene(name);
		
		var entityArray:Array<Dynamic> = unserializer.unserialize();
		
		for (e in entityArray) 
		{
			var entity = new Entity(e.name);
			
			for (component in cast(e.components, Array<Dynamic>))
			{
				entity.add(component);
			}
			scene.ash.addEntity(entity);
		}
		
		return scene;
	}
	
	
}