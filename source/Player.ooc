use sdl2
import sdl2/Event

import Actor, ShipGraphic
import vamos/Entity
import vamos/graphics/Image
import vamos/masks/Hitbox
import vamos/Input
import vamos/comps/Physics

Player: class extends Actor {
	
	init: func(=x, =y) {
		super()
		image := ShipGraphic new(1)
		image scale = 2
		graphic = image
		type = "player"
	}
	
	update: func(dt:Double) {
		if (Input keyPressed(SDLK_LEFT))  physics accX = -300
		if (Input keyPressed(SDLK_RIGHT)) physics accX = 300
		if (Input keyPressed(SDLK_UP))    physics accY = -300
		if (Input keyPressed(SDLK_DOWN))  physics accY = 300
	}
}