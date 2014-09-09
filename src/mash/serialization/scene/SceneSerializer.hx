package mash.serialization.scene;

import mash.MashScene;

interface SceneSerializer
{
	public function serializeScene(scene : MashScene): String;
	public function deSerializeScene(text : String): MashScene;
}