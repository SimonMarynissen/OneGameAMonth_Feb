use sdl2
import sdl2/Core

import vamos/[Graphic, Entity, AssetCache]
import vamos/display/[ImageData, StateRenderer]
import vamos/graphics/SpriteMap

SpriteFont : class extends SpriteMap {
	
	text = "" :String
	
	init :func (=text) {
		super("vamos/font_temp.png", 10, 10)
	}
	
	draw: func (renderer:StateRenderer, entity:Entity) {
		count := 0
		
		dstRect y = entity y + y - renderer camY * scrollY
		dstRect w = frameWidth * scale
		dstRect h = frameHeight * scale
		
		for (c in text)
		{
			dstRect x = entity x + x + (count * dstRect w) - renderer camX * scrollX
			
			setCurrentFrame(c as Int)
			
			renderer drawData(data, srcRect&, dstRect&)
			
			count += 1  
		}
	}
}
