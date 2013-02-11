use sdl2
import sdl2/Event

import ShipGraphic
import vamos/Entity
import vamos/graphics/Image
import vamos/masks/Hitbox
import vamos/Input

Player: class extends Entity {
	
	init: func (=x, =y) {
		mask = Hitbox new(32, 32)
		
		image := ShipGraphic new(1)
		image scale = 2
		graphic = image
		type = "player"
	}
	
	update: func(dt:Double) {
		if (Input keyHeld(SDLK_LEFT)) x -= 200 * dt
		if (Input keyHeld(SDLK_RIGHT)) x += 200 * dt
		if (Input keyHeld(SDLK_UP)) y -= 200 * dt
		if (Input keyHeld(SDLK_DOWN)) y += 200 * dt
	}
}