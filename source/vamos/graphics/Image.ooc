use sdl2
import sdl2/Core

import vamos/[Engine, Graphic, Entity]
import vamos/display/[Texture, StateRenderer]

Image: class extends Graphic {
	
	data:Texture
	
	dstRect: SdlRect
	srcRect: SdlRect
	origin: SdlPoint
	
	scale: Double {
		get
		set (v) {
			dstRect w = data width * v
			dstRect h = data height * v
			scale = v
		}
	}
	
	angle := 0.0
	
	init: func (path:String) {
		super()
		data = engine assets getTexture(path)
		dstRect w = data width
		dstRect h = data height
		srcRect w = data width
		srcRect h = data height
		scale = 1
	}
	
	draw: func (renderer:StateRenderer, entity:Entity, x, y: Double) {
		dstRect x = x
		dstRect y = y
		renderer drawData(data, srcRect&, dstRect&)
	} 
	
}