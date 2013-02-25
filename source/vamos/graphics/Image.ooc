use sdl2
import sdl2/Core
import vamos/[Engine, Graphic, Entity]
import vamos/display/[Texture, StateRenderer]

Image: class extends Graphic {
	
	texture:Texture
	
	dstRect: SdlRect
	srcRect: SdlRect
	origin: SdlPoint
	
	scale: Double {
		get
		set (v) {
			dstRect w = texture width * v
			dstRect h = texture height * v
			scale = v
		}
	}
	
	angle:Double
	
	init: func (path:String) {
		super()
		texture = engine assets getTexture(path)
		dstRect w = texture width
		dstRect h = texture height
		srcRect w = texture width
		srcRect h = texture height
		scale = 1
	}
	
	center: func {
		origin x = srcRect w * 0.5
		origin y = srcRect h * 0.5
	}
	
	draw: func (renderer:StateRenderer, entity:Entity, x, y: Double) {
		dstRect x = x - origin x
		dstRect y = y - origin y
		renderer drawTexture(texture, srcRect&, dstRect&)
	} 
	
}