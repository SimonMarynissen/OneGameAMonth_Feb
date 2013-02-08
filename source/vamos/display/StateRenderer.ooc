use sdl2
import sdl2/Core
import sdl2/Event
import engine/Input
import structs/ArrayList
import engine/State
import display/[Image, EntityRenderer]

// handles the rendering of all the entities in a state

StateRenderer: class {
	
	state: State
	renderer: SdlRenderer
	entityRenderers := ArrayList<EntityRenderer> new()
	
	camX, camY:Double
	
	init: func (=renderer, =state) {
		for (entity in state entities) {
			entityRenderers add(EntityRenderer new(this, entity))
		}
		
		state onEntityAdded add(|e|
			entityRenderers add(EntityRenderer new(this, e))
		)
		
		state onEntityRemoved add(|e|
			for (r in entityRenderers) {
				if (r entity == e)
					entityRenderers remove(r)
			}
		)
	}
	
	renderImage: inline func(image:Image, sourceRect, destRect:SdlRect*) {
		SDL renderCopy(renderer, image texture, sourceRect, destRect)
	}
	
	renderImageEx: inline func (image:Image, sourceRect, destRect:SdlRect*, angle:const Double, center:const SdlPoint*, flip:const Int) {
		SDL renderCopyEx(renderer, image texture, sourceRect, destRect, angle, center, flip)
	}
	
	draw: func {
		SDL setRenderDrawColor(renderer, 0, 0, 0, 255)
		SDL renderClear(renderer)
		
		for (r in entityRenderers) {
			r draw()
		}
		SDL renderPresent(renderer)
		
		if (Input keyHeld(SDLK_UP)) camY -= 0.2
		if (Input keyHeld(SDLK_LEFT)) camX -= 0.2
		if (Input keyHeld(SDLK_DOWN)) camY += 0.2
		if (Input keyHeld(SDLK_RIGHT)) camX += 0.2
	}
	
}