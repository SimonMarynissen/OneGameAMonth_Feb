use sdl2
import sdl2/Core
import structs/ArrayList

import vamos/[State, Entity]
import vamos/display/ImageData
import vamos/Graphic

import vamos/AssetCache

// handles the rendering of all the entities in a state

StateRenderer: class {
	
	state: State
	renderer: SdlRenderer
	
	camX, camY:Double
	
	tex:SdlTexture
	
	init: func (=renderer, =state)
	
	drawData: inline func(data:ImageData, sourceRect, destRect:SdlRect*) {
		SDL renderCopy(renderer, data texture, sourceRect, destRect)
	}
	
	drawDataEx: inline func (data:ImageData, sourceRect, destRect:SdlRect*, angle:const Double, center:const SdlPoint*, flip:const Int) {
		SDL renderCopyEx(renderer, data texture, sourceRect, destRect, angle, center, flip)
	}
	
	draw: func {
		SDL setRenderDrawColor(renderer, 0x20, 0x20, 0x20, 255)
		SDL renderClear(renderer)
		
		for (e in state entities) {
			graphic := e graphic
			if (graphic != null && graphic visible) {
				graphic draw(this, e)
			}
		}
		
		SDL renderPresent(renderer)
	}
	
}