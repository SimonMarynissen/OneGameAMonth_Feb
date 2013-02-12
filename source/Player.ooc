import vamos/Entity
import vamos/graphics/Image
import vamos/masks/Hitbox
import vamos/comps/Physics

import Actor, ShipGraphic
import comps/PlayerInput

Player: class extends Actor {
	
	init: func(=x, =y) {
		super()
		image := ShipGraphic new(1)
		image scale = 2
		graphic = image
		
		physics maxVelX = physics maxVelY = 400
		physics dragX = physics dragY = 10000
		
		addComp(PlayerInput new())
		
		hitbox set(32, 32)
		type = "player"
	}
	
	update: func(dt:Double) {
		
	}
}