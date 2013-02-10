use sdl2
import sdl2/Event

import Ship
import vamos/Entity
import vamos/graphics/Image
import vamos/Input

Player: class extends Entity {
	
	img : Ship
	init: func (=x, =y) {
		
		img = Ship new(1)
		img scale = 2
		graphic = img
	}
	
	update: func(dt:Double) {
		if (Input keyHeld(SDLK_LEFT)) x -= 200 * dt
		if (Input keyHeld(SDLK_RIGHT)) x += 200 * dt
		if (Input keyHeld(SDLK_UP)) y -= 200 * dt
		if (Input keyHeld(SDLK_DOWN)) y += 200 * dt
	}
}