use sdl2
import sdl2/Core
import structs/ArrayList

import vamos/State
//import vamos/[Image, EntityRenderer]

// handles the rendering of all the entities in a state

StateRenderer: class {
	
	state: State
	renderer: SdlRenderer
	//entityRenderers := ArrayList<EntityRenderer> new()
	
	camX, camY:Double
	
	init: func (=renderer, =state) {
		// for (entity in state entities) {
		// 	entityRenderers add(EntityRenderer new(this, entity))
		// }
		
		// state onEntityAdded add(|e|
		// 	entityRenderers add(EntityRenderer new(this, e))
		// )
		
		// state onEntityRemoved add(|e|
		// 	for (r in entityRenderers) {
		// 		if (r entity == e)
		// 			entityRenderers remove(r)
		// 	}
		// )
	}
	
	// renderImage: inline func(image:Image, sourceRect, destRect:SdlRect*) {
	// 	SDL renderCopy(renderer, image texture, sourceRect, destRect)
	// }
	
	// renderImageEx: inline func (image:Image, sourceRect, destRect:SdlRect*, angle:const Double, center:const SdlPoint*, flip:const Int) {
	// 	SDL renderCopyEx(renderer, image texture, sourceRect, destRect, angle, center, flip)
	// }
	
	draw: func {
		SDL setRenderDrawColor(renderer, 0x20, 0x20, 0x20, 255)
		SDL renderClear(renderer)
		SDL renderPresent(renderer)
	}
	
}