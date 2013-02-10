use sdl2
import sdl2/Core

import vamos/[Graphic, Entity, AssetCache]
import vamos/display/[ImageData, StateRenderer]

Image: class extends Graphic {
	
	data:ImageData
	
	dstRect :SdlRect
	srcRect :SdlRect
	origin :SdlPoint
	
	scale : Double {
		get {
			return scale
		}
		set (v) {
			dstRect w = data width * v
			dstRect h = data height * v
			scale = v
		}
	}
	
	angle = 0.0:Double
	
	init: func (path:String) {
		super()
		data = AssetCache getImageData(path)
		dstRect w = data width
		dstRect h = data height
		srcRect w = data width
		srcRect h = data height
		scale = 1
		"%d, %d" printfln(dstRect w, dstRect h)
	}
	
	draw: func (renderer:StateRenderer, entity:Entity, x, y : Double) {
		dstRect x = x
		dstRect y = y
		renderer drawData(data, srcRect&, dstRect&)
	} 
	
}