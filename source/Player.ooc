import vamos/Entity
import vamos/graphics/Image
import vamos/masks/Hitbox
import vamos/comps/Physics

import Actor, ShipGraphic
import comps/PlayerInput

Player: class extends Actor {
	
	init: func(=x, =y) {
		super()
		image := ShipGraphic new(9)
		graphic = image
		
		physics velX class name println()
		physics maxVelX = physics maxVelY = 300
		physics dragX = physics dragY = 1000
		accel = 2000
		
		addComp(PlayerInput new())
		
		hitbox set(16, 16)
		type = "player"
	}
	
	update: func(dt:Double) {
		super(dt)
	}
}