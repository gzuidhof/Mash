package mash.serialization;

import mash.core.MashScene;

interface SceneSerializer
{
	public function serializeScene(scene : MashScene): String;
	public function deSerializeScene(text : String): MashScene;
}