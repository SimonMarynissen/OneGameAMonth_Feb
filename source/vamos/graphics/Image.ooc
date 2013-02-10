use sdl2
import sdl2/Core

import vamos/[Graphic, Entity, AssetCache]
import vamos/display/[ImageData, StateRenderer]

Image: class extends Graphic {
	
	data:ImageData
	
	destRect:SdlRect
	
	scale: Double {
		set (v) {
			destRect w = data width * v
			destRect h = data height * v
		}
	}
	
	
	init: func (path:String) {
		super()
		data = AssetCache getImageData(path)
		destRect w = data width
		destRect h = data height
		"%d, %d" printfln(destRect w, destRect h)
	}
	
	draw: func (renderer:StateRenderer, entity:Entity) {
		destRect x = entity x + x - renderer camX * scrollX
		destRect y = entity y + y - renderer camY * scrollY
		renderer drawData(data, null, destRect&)
	} 
	
}