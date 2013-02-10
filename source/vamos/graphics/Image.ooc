use sdl2
import sdl2/Core

import vamos/[Graphic, Entity, AssetCache]
import vamos/display/[ImageData, StateRenderer]

Image: class extends Graphic {
	
	data:ImageData
	
	dstRect:SdlRect
	srcRect:SdlRect
	
	scale = 1.0:Double
	
	init: func (path:String) {
		super()
		data = AssetCache getImageData(path)
		dstRect w = data width
		dstRect h = data height
		srcRect w = data width
		srcRect h = data height
		"%d, %d" printfln(dstRect w, dstRect h)
	}
	
	draw: func (renderer:StateRenderer, entity:Entity) {
		dstRect x = entity x + x - renderer camX * scrollX
		dstRect y = entity y + y - renderer camY * scrollY
		dstRect w = data width * scale
		dstRect h = data height * scale
		renderer drawData(data, srcRect&, dstRect&)
	} 
	
}