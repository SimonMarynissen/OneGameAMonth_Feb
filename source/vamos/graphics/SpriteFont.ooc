use sdl2
import sdl2/Core

import vamos/[Graphic, Entity, AssetCache]
import vamos/display/[ImageData, StateRenderer]
import vamos/graphics/SpriteMap

SpriteFont : class extends SpriteMap {
	
	text = "" :String
	
	init :func (=text) {
		super("vamos/font_temp.png", 8, 10)
	}
	
	draw: func (renderer:StateRenderer, entity:Entity, x, y : Double) {
		count := 0
		for (c in text)
		{
			setCurrentFrame(c as Int)
			super (renderer, entity, x + count * frameWidth, y)
			count += 1  
		}
	}
}
