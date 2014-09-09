package mash.serialization.system;
import mash.MashScene;

interface SystemSerializer 
{
	/**
	 * Serializes systems active in given scene, with order.
	 * @param	scene
	 * @return
	 */
    public function serializeSystems(scene : MashScene): String;
	
	/**
	 * Creates systems and adds them to given MashScene.
	 * @param	text serialized String of systems.
	 * @param	scene MashScene to add systems to.
	 */
	public function deSerializeSystems(text : String, scene : MashScene): Void;
}