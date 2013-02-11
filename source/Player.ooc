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
		
		physics maxVelX = physics maxVelY = 400
		physics dragX = physics dragY = 10000
		
		hitbox set(32, 32)
		type = "player"
	}
	
	update: func(dt:Double) {
		if (Input keyPressed(SDLK_LEFT))  physics accX = -10000
		if (Input keyPressed(SDLK_RIGHT)) physics accX = 10000
		if (Input keyReleased(SDLK_RIGHT) || Input keyReleased(SDLK_LEFT))
			physics accX = 0
		
		if (Input keyPressed(SDLK_UP))    physics accY = -10000
		if (Input keyPressed(SDLK_DOWN))  physics accY = 10000
		if (Input keyReleased(SDLK_UP) || Input keyReleased(SDLK_DOWN))
			physics accY = 0
		
		"x %f, velX %f, accX %f" printfln(x, physics velX, physics accX)
		"y %f, velY %f, accY %f" printfln(y, physics velY, physics accY)
	}
}