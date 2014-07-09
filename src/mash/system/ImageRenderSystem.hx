package mash.system;

import ash.core.Entity;
import mash.core.MashSystem;
import mash.core.MashEngine;
import mash.component.Image;
import mash.component.Position;
import mash.component.Rotation;



class ImageRenderSystem extends MashSystem
{

	public function new(mash:MashEngine)
	{ 
		super(mash); 
	}
	
	override public function init()
	{

	}
	
	override public function update(dt)
	{
		
		for (node in ash.getNodeList(ImageNode))
		{
			var entity : Entity = node.entity;
			mashEngine.painter.drawImage(node.image, node.position.x, node.position.y);
		}
		
	}
	
	
}