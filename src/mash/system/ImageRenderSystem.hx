package mash.system;

import ash.core.Entity;
import mash.MashSystem;
import mash.MashEngine;
import mash.component.ImageDisplay;
import mash.node.ImageRenderNode;
import mash.component.Position;
import mash.component.Rotation;



class ImageRenderSystem extends MashSystem
{
	
	//private var images: Map<String, Image>;
	
	
	public function new(mash:MashEngine)
	{ 
		super(mash); 
	}
	
	override public function init()
	{
		//images = new Map<String, Image>();
		ecs.getNodeList(ImageRenderNode).nodeAdded.add(onImageRenderNodeAdded);
	}
	
	private function onImageRenderNodeAdded(node: ImageRenderNode): Void 
	{
		/*if (!images.exists(node.imageDisplay.imageName))
		{
			var image: Image = Loader.the.getImage(node.imageDisplay.imageName);
			images.set(node.imageDisplay.imageName, image);
		}*/
	}
	
	
	override public function update(dt: Float)
	{
		for (node in ecs.getNodeList(ImageRenderNode))
		{
			//mashEngine.graphics2.drawImage(images.get(node.imageDisplay.imageName), node.position.x, node.position.y);
		}
		
	}
	
	
}